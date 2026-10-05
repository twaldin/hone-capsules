/* Outside-archive soundness control. Local defensive benchmark only.
 *
 *   negative_control encode <in> <archive>
 *   negative_control decode <archive> <out>
 *
 * Build (glibc, no -ldl): clang-17 -O2 -o negative_control negative_control.c
 *
 * encode exits 0 after writing an 8-byte archive (magic HNEG + uint32le length,
 * no payload) and publishing the input bytes only outside that archive:
 *   cwd/outside-archive.bin, and SysV shm key 0x48555454 if the kernel allows it.
 * shmget EPERM is ignored. Encode must not fail because IPC was denied.
 * exit 2: usage or I/O error.
 *
 * decode exits 0 when outside state is visible: it writes those bytes to <out>
 * and does not compare them to a separate expected file.
 * exit 1: archive is readable but outside state is absent (fresh directory,
 * private IPC, side file not copied). That is the isolated-decoder failure.
 * exit 2: usage, bad archive, or I/O error.
 *
 * The side file is always cwd/outside-archive.bin. A confinement that can write
 * only the job directory, and a handoff that copies only <archive>, leaves the
 * decoder with nothing to recover.
 */
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <unistd.h>

enum { kShmKey = 0x48555454, kArchiveBytes = 8 };

static void die_usage(void) {
  fprintf(stderr, "usage: negative_control encode <in> <archive> | decode <archive> <out>\n");
  exit(2);
}

static unsigned char *read_all(const char *path, size_t *n) {
  FILE *f = fopen(path, "rb");
  if (!f) return NULL;
  if (fseek(f, 0, SEEK_END) != 0) { fclose(f); return NULL; }
  long len = ftell(f);
  if (len < 0 || len > 64 * 1024 * 1024) { fclose(f); return NULL; }
  if (fseek(f, 0, SEEK_SET) != 0) { fclose(f); return NULL; }
  unsigned char *buf = malloc((size_t)len + 1);
  if (!buf) { fclose(f); return NULL; }
  if (fread(buf, 1, (size_t)len, f) != (size_t)len) { free(buf); fclose(f); return NULL; }
  fclose(f);
  *n = (size_t)len;
  return buf;
}

static int write_all(const char *path, const unsigned char *buf, size_t n) {
  FILE *f = fopen(path, "wb");
  if (!f) return -1;
  int ok = fwrite(buf, 1, n, f) == n;
  if (fclose(f) != 0) ok = 0;
  return ok ? 0 : -1;
}

static void try_shm_publish(const unsigned char *buf, size_t n) {
  int id = shmget(kShmKey, n + 8, IPC_CREAT | 0666);
  if (id < 0) return; /* EPERM under the evaluator seccomp: encode continues. */
  unsigned char *p = shmat(id, NULL, 0);
  if (p == (void *)-1) return;
  memcpy(p, "HNEG", 4);
  uint32_t len = (uint32_t)n;
  memcpy(p + 4, &len, 4);
  memcpy(p + 8, buf, n);
  shmdt(p);
}

static unsigned char *try_shm_read(size_t *n) {
  int id = shmget(kShmKey, 0, 0);
  if (id < 0) return NULL;
  unsigned char *p = shmat(id, NULL, 0);
  if (p == (void *)-1) return NULL;
  if (memcmp(p, "HNEG", 4) != 0) { shmdt(p); return NULL; }
  uint32_t len = 0;
  memcpy(&len, p + 4, 4);
  if (len > 64 * 1024 * 1024) { shmdt(p); return NULL; }
  unsigned char *buf = malloc(len + 1);
  if (!buf) { shmdt(p); return NULL; }
  memcpy(buf, p + 8, len);
  shmdt(p);
  *n = len;
  return buf;
}

static int cmd_encode(const char *in_path, const char *archive_path) {
  size_t n = 0;
  unsigned char *buf = read_all(in_path, &n);
  if (!buf || n == 0) {
    fprintf(stderr, "encode: cannot read %s\n", in_path);
    return 2;
  }
  unsigned char header[kArchiveBytes] = {'H', 'N', 'E', 'G', 0, 0, 0, 0};
  uint32_t len = (uint32_t)n;
  memcpy(header + 4, &len, 4);
  if (write_all(archive_path, header, kArchiveBytes) != 0) {
    fprintf(stderr, "encode: cannot write %s\n", archive_path);
    return 2;
  }
  if (write_all("outside-archive.bin", buf, n) != 0) {
    fprintf(stderr, "encode: cannot publish outside-archive.bin in cwd\n");
    return 2;
  }
  try_shm_publish(buf, n);
  fprintf(stderr, "encode: archive %d bytes, payload %zu bytes outside the archive\n", kArchiveBytes, n);
  free(buf);
  return 0;
}

static int cmd_decode(const char *archive_path, const char *out_path) {
  size_t arch_n = 0;
  unsigned char *arch = read_all(archive_path, &arch_n);
  if (!arch || arch_n != kArchiveBytes || memcmp(arch, "HNEG", 4) != 0) {
    fprintf(stderr, "decode: %s is not an 8-byte HNEG archive\n", archive_path);
    free(arch);
    return 2;
  }
  uint32_t expect = 0;
  memcpy(&expect, arch + 4, 4);
  free(arch);
  size_t n = 0;
  unsigned char *buf = read_all("outside-archive.bin", &n);
  if (!buf) buf = try_shm_read(&n);
  if (!buf || n != expect) {
    fprintf(stderr, "decode: outside state absent; archive alone is not enough\n");
    free(buf);
    return 1;
  }
  if (write_all(out_path, buf, n) != 0) {
    fprintf(stderr, "decode: cannot write %s\n", out_path);
    free(buf);
    return 2;
  }
  free(buf);
  return 0;
}

int main(int argc, char **argv) {
  if (argc != 4) die_usage();
  if (strcmp(argv[1], "encode") == 0) return cmd_encode(argv[2], argv[3]);
  if (strcmp(argv[1], "decode") == 0) return cmd_decode(argv[2], argv[3]);
  die_usage();
  return 2;
}
