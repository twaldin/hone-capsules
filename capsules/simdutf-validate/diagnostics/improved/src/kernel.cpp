// IMPROVED diagnostic control: genuine, observation-preserving work reduction.
// The redundant utf16-length pre-scan is dropped while the optimized validating
// conversion remains. The driver therefore walks the buffer once to establish
// the verdict and once to transcode, rather than validate + length + convert.
// This path is portable across native SIMD implementations: on AMD64 the
// explicitly non-validating conversion falls back to a slower kernel, while
// the validating conversion uses the active implementation. Output and verdict
// remain byte-identical to baseline, which the trusted parent verifies on every
// timed iteration.
#include "simdutf.h"
#include <cstddef>
#include <cstdint>
#include <string>

extern "C" {

const char *hone_impl_name() {
  static std::string cached = simdutf::get_active_implementation()->name();
  return cached.c_str();
}

long hone_process(const char *buf, size_t len, char16_t *out, int *verdict) {
  if (!simdutf::validate_utf8(buf, len)) {   // verdict
    *verdict = 0;
    return 0;
  }
  size_t n = simdutf::convert_utf8_to_utf16le(buf, len, out);
  *verdict = 1;
  return static_cast<long>(n);
}

}  // extern "C"
