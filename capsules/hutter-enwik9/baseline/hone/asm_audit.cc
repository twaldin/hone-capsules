// Protected Clang 17 AST inspection for the hutter-enwik9 evaluator.
#include <clang/AST/ASTConsumer.h>
#include <clang/AST/Attr.h>
#include <clang/AST/RecursiveASTVisitor.h>
#include <clang/Frontend/CompilerInstance.h>
#include <clang/Frontend/FrontendActions.h>
#include <clang/Tooling/Tooling.h>
#include <clang/Tooling/CompilationDatabase.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/JSON.h>
#include <llvm/Support/Path.h>
#include <llvm/Support/raw_ostream.h>
#include <set>
#include <string>
#include <vector>

namespace {
std::string capsuleRoot;
llvm::json::Array assembly;
std::set<std::string> problems;

class Visitor : public clang::RecursiveASTVisitor<Visitor> {
  clang::SourceManager& sm;
  bool capsule(clang::SourceLocation loc) const {
    if (loc.isInvalid()) return false;
    auto file = sm.getFilename(sm.getExpansionLoc(loc));
    if (file.empty()) return false;
    llvm::SmallString<256> path(file);
    if (llvm::sys::fs::make_absolute(path)) return false;
    llvm::sys::path::remove_dots(path, true);
    return llvm::StringRef(path).startswith(capsuleRoot);
  }
  static bool estimate(llvm::StringRef name) {
    return name.startswith("__builtin_ia32_rcp") || name.startswith("__builtin_ia32_rsqrt") ||
           (name.startswith("_mm") && (name.contains("_rcp") || name.contains("_rsqrt")));
  }
public:
  explicit Visitor(clang::SourceManager& sm) : sm(sm) {}
  bool shouldVisitTemplateInstantiations() const { return true; }
  bool VisitDeclRefExpr(clang::DeclRefExpr* expr) {
    if (capsule(expr->getExprLoc()) && estimate(expr->getDecl()->getNameAsString()))
      problems.insert("reciprocal-estimate intrinsic reference");
    return true;
  }
  bool VisitAttr(clang::Attr* attr) {
    llvm::StringRef name(attr->getSpelling());
    if (capsule(attr->getLocation()) &&
        (name == "target" || name == "target_clones" || name == "optimize"))
      problems.insert("target/optimize attribute");
    return true;
  }
  bool VisitCastExpr(clang::CastExpr* expr) {
    if (!capsule(expr->getExprLoc()) || !expr->getType()->isFunctionPointerType()) return true;
    if (expr->getCastKind() == clang::CK_IntegralToPointer ||
        (expr->getCastKind() == clang::CK_BitCast &&
         !expr->getSubExpr()->getType()->isFunctionPointerType()))
      problems.insert("object/integer-to-function-pointer cast");
    return true;
  }
  bool VisitMSAsmStmt(clang::MSAsmStmt* stmt) {
    if (capsule(stmt->getAsmLoc())) problems.insert("MSAsmStmt");
    return true;
  }
  bool VisitFileScopeAsmDecl(clang::FileScopeAsmDecl* decl) {
    if (capsule(decl->getLocation())) problems.insert("FileScopeAsmDecl");
    return true;
  }
  bool VisitGCCAsmStmt(clang::GCCAsmStmt* stmt) {
    if (!capsule(stmt->getAsmLoc())) return true;
    if (stmt->isAsmGoto()) problems.insert("asm goto is not baseline assembly");
    llvm::json::Array outputs, inputs, clobbers;
    for (unsigned i = 0; i < stmt->getNumOutputs(); ++i)
      outputs.push_back(stmt->getOutputConstraint(i).str());
    for (unsigned i = 0; i < stmt->getNumInputs(); ++i)
      inputs.push_back(stmt->getInputConstraint(i).str());
    for (unsigned i = 0; i < stmt->getNumClobbers(); ++i)
      clobbers.push_back(stmt->getClobber(i).str());
    auto loc = sm.getExpansionLoc(stmt->getAsmLoc());
    assembly.push_back(llvm::json::Object{
      {"asm", stmt->getAsmString()->getString().str()},
      {"outputs", std::move(outputs)}, {"inputs", std::move(inputs)},
      {"clobbers", std::move(clobbers)}, {"volatile", stmt->isVolatile()},
      {"file", sm.getFilename(loc).str()}, {"line", sm.getSpellingLineNumber(loc)}});
    return true;
  }
};
class Consumer : public clang::ASTConsumer {
public:
  void HandleTranslationUnit(clang::ASTContext& ctx) override {
    Visitor visitor(ctx.getSourceManager());
    visitor.TraverseDecl(ctx.getTranslationUnitDecl());
  }
};
class Action : public clang::ASTFrontendAction {
  std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance&, llvm::StringRef) override {
    return std::make_unique<Consumer>();
  }
};
} // namespace

int main(int argc, char** argv) {
  if (argc < 5 || std::string(argv[3]) != "--") return 2;
  llvm::SmallString<256> root(argv[1]);
  if (llvm::sys::fs::make_absolute(root)) return 2;
  llvm::sys::path::remove_dots(root, true);
  capsuleRoot = root.str().str() + "/";
  std::vector<std::string> flags(argv + 4, argv + argc);
  flags.push_back("-Werror=unknown-attributes");
  clang::tooling::FixedCompilationDatabase db(root.str(), flags);
  clang::tooling::ClangTool tool(db, {argv[2]});
  int rc = tool.run(clang::tooling::newFrontendActionFactory<Action>().get());
  llvm::json::Array messages;
  for (const auto& problem : problems) messages.push_back(problem);
  llvm::outs() << llvm::json::Value(llvm::json::Object{
    {"problems", std::move(messages)}, {"assembly", std::move(assembly)}}) << "\n";
  return rc;
}
