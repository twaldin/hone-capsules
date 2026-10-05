	.text
	.file	"qmat_cpu.cpp"
	.section	.text._ZN3fx23opt19cpu_has_avx512_vnniEv,"ax",@progbits
	.globl	_ZN3fx23opt19cpu_has_avx512_vnniEv # -- Begin function _ZN3fx23opt19cpu_has_avx512_vnniEv
	.p2align	4, 0x90
	.type	_ZN3fx23opt19cpu_has_avx512_vnniEv,@function
_ZN3fx23opt19cpu_has_avx512_vnniEv:     # @_ZN3fx23opt19cpu_has_avx512_vnniEv
.Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, DW.ref.__gxx_personality_v0
	.cfi_lsda 27, .Lexception0
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movzbl	_ZGVZN3fx23opt19cpu_has_avx512_vnniEvE1v(%rip), %eax
	testb	%al, %al
	je	.LBB0_1
.LBB0_4:
	movzbl	_ZZN3fx23opt19cpu_has_avx512_vnniEvE1v(%rip), %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB0_1:
	.cfi_def_cfa_offset 16
	leaq	_ZGVZN3fx23opt19cpu_has_avx512_vnniEvE1v(%rip), %rdi
	callq	__cxa_guard_acquire@PLT
	testl	%eax, %eax
	je	.LBB0_4
# %bb.2:
.Ltmp0:
	callq	_ZN3fx23opt12_GLOBAL__N_16detectEv
.Ltmp1:
# %bb.3:
	movb	%al, _ZZN3fx23opt19cpu_has_avx512_vnniEvE1v(%rip)
	leaq	_ZGVZN3fx23opt19cpu_has_avx512_vnniEvE1v(%rip), %rdi
	callq	__cxa_guard_release@PLT
	movzbl	_ZZN3fx23opt19cpu_has_avx512_vnniEvE1v(%rip), %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB0_5:
	.cfi_def_cfa_offset 16
.Ltmp2:
	movq	%rax, %rbx
	leaq	_ZGVZN3fx23opt19cpu_has_avx512_vnniEvE1v(%rip), %rdi
	callq	__cxa_guard_abort@PLT
	movq	%rbx, %rdi
	callq	_Unwind_Resume@PLT
.Lfunc_end0:
	.size	_ZN3fx23opt19cpu_has_avx512_vnniEv, .Lfunc_end0-_ZN3fx23opt19cpu_has_avx512_vnniEv
	.cfi_endproc
	.section	.gcc_except_table._ZN3fx23opt19cpu_has_avx512_vnniEv,"a",@progbits
	.p2align	2, 0x0
GCC_except_table0:
.Lexception0:
	.byte	255                             # @LPStart Encoding = omit
	.byte	255                             # @TType Encoding = omit
	.byte	1                               # Call site Encoding = uleb128
	.uleb128 .Lcst_end0-.Lcst_begin0
.Lcst_begin0:
	.uleb128 .Ltmp0-.Lfunc_begin0           # >> Call Site 1 <<
	.uleb128 .Ltmp1-.Ltmp0                  #   Call between .Ltmp0 and .Ltmp1
	.uleb128 .Ltmp2-.Lfunc_begin0           #     jumps to .Ltmp2
	.byte	0                               #   On action: cleanup
	.uleb128 .Ltmp1-.Lfunc_begin0           # >> Call Site 2 <<
	.uleb128 .Lfunc_end0-.Ltmp1             #   Call between .Ltmp1 and .Lfunc_end0
	.byte	0                               #     has no landing pad
	.byte	0                               #   On action: cleanup
.Lcst_end0:
	.p2align	2, 0x0
                                        # -- End function
	.section	.text._ZN3fx23opt12_GLOBAL__N_16detectEv,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _ZN3fx23opt12_GLOBAL__N_16detectEv
	.type	_ZN3fx23opt12_GLOBAL__N_16detectEv,@function
_ZN3fx23opt12_GLOBAL__N_16detectEv:     # @_ZN3fx23opt12_GLOBAL__N_16detectEv
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	.L.str(%rip), %rdi
	callq	getenv@PLT
	testq	%rax, %rax
	je	.LBB1_3
# %bb.1:
	cmpb	$49, (%rax)
	jne	.LBB1_3
# %bb.2:
	xorl	%esi, %esi
.LBB1_9:
	movl	%esi, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.LBB1_3:
	.cfi_def_cfa_offset 16
	xorl	%esi, %esi
	xorl	%eax, %eax
	#APP
	xchgq	%rbx, %rdi
	cpuid
	xchgq	%rbx, %rdi
	#NO_APP
	testl	%eax, %eax
	je	.LBB1_9
# %bb.4:
	movl	%eax, %edi
	movl	$1, %eax
	#APP
	xchgq	%rbx, %rsi
	cpuid
	xchgq	%rbx, %rsi
	#NO_APP
	xorl	%esi, %esi
	testl	$134217728, %ecx                # imm = 0x8000000
	je	.LBB1_9
# %bb.5:
	xorl	%ecx, %ecx
	#APP
	xgetbv
	#NO_APP
	cmpl	$7, %edi
	jb	.LBB1_9
# %bb.6:
	andl	$230, %eax
	cmpl	$230, %eax
	jne	.LBB1_9
# %bb.7:
	xorl	%esi, %esi
	movl	$7, %eax
	xorl	%ecx, %ecx
	#APP
	xchgq	%rbx, %rdi
	cpuid
	xchgq	%rbx, %rdi
	#NO_APP
	movl	%edi, %eax
	notl	%eax
	testl	$1073807360, %eax               # imm = 0x40010000
	jne	.LBB1_9
# %bb.8:
	shrl	$11, %ecx
	andl	$1, %ecx
	testl	%edi, %edi
	sets	%sil
	andb	%cl, %sil
	movl	%esi, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	_ZN3fx23opt12_GLOBAL__N_16detectEv, .Lfunc_end1-_ZN3fx23opt12_GLOBAL__N_16detectEv
	.cfi_endproc
                                        # -- End function
	.type	_ZZN3fx23opt19cpu_has_avx512_vnniEvE1v,@object # @_ZZN3fx23opt19cpu_has_avx512_vnniEvE1v
	.section	.bss._ZZN3fx23opt19cpu_has_avx512_vnniEvE1v,"aw",@nobits
_ZZN3fx23opt19cpu_has_avx512_vnniEvE1v:
	.byte	0                               # 0x0
	.size	_ZZN3fx23opt19cpu_has_avx512_vnniEvE1v, 1

	.type	_ZGVZN3fx23opt19cpu_has_avx512_vnniEvE1v,@object # @_ZGVZN3fx23opt19cpu_has_avx512_vnniEvE1v
	.section	.bss._ZGVZN3fx23opt19cpu_has_avx512_vnniEvE1v,"aw",@nobits
	.p2align	3, 0x0
_ZGVZN3fx23opt19cpu_has_avx512_vnniEvE1v:
	.quad	0                               # 0x0
	.size	_ZGVZN3fx23opt19cpu_has_avx512_vnniEvE1v, 8

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"FX2_FORCE_AVX2"
	.size	.L.str, 15

	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.DW.ref.__gxx_personality_v0,"aGw",@progbits,DW.ref.__gxx_personality_v0,comdat
	.p2align	3, 0x0
	.type	DW.ref.__gxx_personality_v0,@object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.ident	"Debian clang version 17.0.6 (++20231208085813+6009708b4367-1~exp1~20231208085906.81)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __gxx_personality_v0
	.addrsig_sym _Unwind_Resume
	.addrsig_sym _ZZN3fx23opt19cpu_has_avx512_vnniEvE1v
	.addrsig_sym _ZGVZN3fx23opt19cpu_has_avx512_vnniEvE1v
