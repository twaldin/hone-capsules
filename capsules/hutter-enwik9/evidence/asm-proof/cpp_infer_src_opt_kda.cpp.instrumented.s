	.text
	.file	"kda.cpp"
	.section	.text._ZN3fx23opt13kda_set_sweepENS0_8KdaSweepE,"ax",@progbits
	.globl	_ZN3fx23opt13kda_set_sweepENS0_8KdaSweepE # -- Begin function _ZN3fx23opt13kda_set_sweepENS0_8KdaSweepE
	.p2align	4, 0x90
	.type	_ZN3fx23opt13kda_set_sweepENS0_8KdaSweepE,@function
_ZN3fx23opt13kda_set_sweepENS0_8KdaSweepE: # @_ZN3fx23opt13kda_set_sweepENS0_8KdaSweepE
	.cfi_startproc
# %bb.0:
	movl	%edi, _ZN3fx23opt12_GLOBAL__N_17g_sweepE(%rip)
	retq
.Lfunc_end0:
	.size	_ZN3fx23opt13kda_set_sweepENS0_8KdaSweepE, .Lfunc_end0-_ZN3fx23opt13kda_set_sweepENS0_8KdaSweepE
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt13kda_get_sweepEv,"ax",@progbits
	.globl	_ZN3fx23opt13kda_get_sweepEv    # -- Begin function _ZN3fx23opt13kda_get_sweepEv
	.p2align	4, 0x90
	.type	_ZN3fx23opt13kda_get_sweepEv,@function
_ZN3fx23opt13kda_get_sweepEv:           # @_ZN3fx23opt13kda_get_sweepEv
	.cfi_startproc
# %bb.0:
	movl	_ZN3fx23opt12_GLOBAL__N_17g_sweepE(%rip), %eax
	retq
.Lfunc_end1:
	.size	_ZN3fx23opt13kda_get_sweepEv, .Lfunc_end1-_ZN3fx23opt13kda_get_sweepEv
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt15kda_set_pf_modeEi,"ax",@progbits
	.globl	_ZN3fx23opt15kda_set_pf_modeEi  # -- Begin function _ZN3fx23opt15kda_set_pf_modeEi
	.p2align	4, 0x90
	.type	_ZN3fx23opt15kda_set_pf_modeEi,@function
_ZN3fx23opt15kda_set_pf_modeEi:         # @_ZN3fx23opt15kda_set_pf_modeEi
	.cfi_startproc
# %bb.0:
	movl	%edi, _ZN3fx23opt12_GLOBAL__N_19g_pf_modeE(%rip)
	retq
.Lfunc_end2:
	.size	_ZN3fx23opt15kda_set_pf_modeEi, .Lfunc_end2-_ZN3fx23opt15kda_set_pf_modeEi
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt15kda_get_pf_modeEv,"ax",@progbits
	.globl	_ZN3fx23opt15kda_get_pf_modeEv  # -- Begin function _ZN3fx23opt15kda_get_pf_modeEv
	.p2align	4, 0x90
	.type	_ZN3fx23opt15kda_get_pf_modeEv,@function
_ZN3fx23opt15kda_get_pf_modeEv:         # @_ZN3fx23opt15kda_get_pf_modeEv
	.cfi_startproc
# %bb.0:
	movl	_ZN3fx23opt12_GLOBAL__N_19g_pf_modeE(%rip), %eax
	retq
.Lfunc_end3:
	.size	_ZN3fx23opt15kda_get_pf_modeEv, .Lfunc_end3-_ZN3fx23opt15kda_get_pf_modeEv
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt15kda_layer_resetERNS0_8KdaStateE,"ax",@progbits
	.globl	_ZN3fx23opt15kda_layer_resetERNS0_8KdaStateE # -- Begin function _ZN3fx23opt15kda_layer_resetERNS0_8KdaStateE
	.p2align	4, 0x90
	.type	_ZN3fx23opt15kda_layer_resetERNS0_8KdaStateE,@function
_ZN3fx23opt15kda_layer_resetERNS0_8KdaStateE: # @_ZN3fx23opt15kda_layer_resetERNS0_8KdaStateE
	.cfi_startproc
# %bb.0:
	movl	$58432, %edx                    # imm = 0xE440
	xorl	%esi, %esi
	jmp	memset@PLT                      # TAILCALL
.Lfunc_end4:
	.size	_ZN3fx23opt15kda_layer_resetERNS0_8KdaStateE, .Lfunc_end4-_ZN3fx23opt15kda_layer_resetERNS0_8KdaStateE
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt14kda_sweep_headEPfPKfS3_S3_fS3_S1_S3_NS0_8KdaSweepE,"ax",@progbits
	.globl	_ZN3fx23opt14kda_sweep_headEPfPKfS3_S3_fS3_S1_S3_NS0_8KdaSweepE # -- Begin function _ZN3fx23opt14kda_sweep_headEPfPKfS3_S3_fS3_S1_S3_NS0_8KdaSweepE
	.p2align	4, 0x90
	.type	_ZN3fx23opt14kda_sweep_headEPfPKfS3_S3_fS3_S1_S3_NS0_8KdaSweepE,@function
_ZN3fx23opt14kda_sweep_headEPfPKfS3_S3_fS3_S1_S3_NS0_8KdaSweepE: # @_ZN3fx23opt14kda_sweep_headEPfPKfS3_S3_fS3_S1_S3_NS0_8KdaSweepE
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	andq	$-32, %rsp
	subq	$320, %rsp                      # imm = 0x140
	.cfi_offset %rbx, -24
	movq	16(%rbp), %r10
	testq	%r10, %r10
	cmoveq	%rdi, %r10
	movl	24(%rbp), %eax
	movl	_ZN3fx23opt12_GLOBAL__N_19g_pf_modeE(%rip), %r11d
	decl	%r11d
	cmpl	$3, %r11d
	ja	.LBB5_59
# %bb.1:
	leaq	.LJTI5_0(%rip), %rbx
	movslq	(%rbx,%r11,4), %r11
	addq	%rbx, %r11
	jmpq	*%r11
.LBB5_2:
	testl	%eax, %eax
	je	.LBB5_3
# %bb.5:
	vmovaps	(%rdx), %ymm1
	vmulps	(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 32(%rsp)
	vmovaps	32(%rdx), %ymm1
	vmulps	32(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 64(%rsp)
	vmovaps	64(%rdx), %ymm1
	vmulps	64(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 96(%rsp)
	vmovaps	96(%rdx), %ymm1
	vmulps	96(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 128(%rsp)
	vmovaps	128(%rdx), %ymm1
	vmulps	128(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 160(%rsp)
	vmovaps	160(%rdx), %ymm1
	vmulps	160(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 192(%rsp)
	vmovaps	192(%rdx), %ymm1
	vmulps	192(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 224(%rsp)
	vmovaps	224(%rdx), %ymm1
	vmulps	224(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 256(%rsp)
	vxorps	%xmm1, %xmm1, %xmm1
	leaq	32(%rsp), %r11
	xorl	%ebx, %ebx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	.p2align	4, 0x90
.LBB5_6:                                # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%r11), %ymm9
	prefetcht0	(%r10,%rbx,4)
	prefetcht0	64(%r10,%rbx,4)
	prefetcht0	128(%r10,%rbx,4)
	prefetcht0	192(%r10,%rbx,4)
	vfmadd231ps	(%rdi,%rbx,4), %ymm9, %ymm8 # ymm8 = (ymm9 * mem) + ymm8
	vfmadd231ps	32(%rdi,%rbx,4), %ymm9, %ymm7 # ymm7 = (ymm9 * mem) + ymm7
	vfmadd231ps	64(%rdi,%rbx,4), %ymm9, %ymm6 # ymm6 = (ymm9 * mem) + ymm6
	vfmadd231ps	96(%rdi,%rbx,4), %ymm9, %ymm5 # ymm5 = (ymm9 * mem) + ymm5
	vfmadd231ps	128(%rdi,%rbx,4), %ymm9, %ymm4 # ymm4 = (ymm9 * mem) + ymm4
	vfmadd231ps	160(%rdi,%rbx,4), %ymm9, %ymm3 # ymm3 = (ymm9 * mem) + ymm3
	vfmadd231ps	192(%rdi,%rbx,4), %ymm9, %ymm2 # ymm2 = (ymm9 * mem) + ymm2
	vfmadd231ps	224(%rdi,%rbx,4), %ymm9, %ymm1 # ymm1 = (ymm9 * mem) + ymm1
	addq	$64, %rbx
	addq	$4, %r11
	cmpq	$4096, %rbx                     # imm = 0x1000
	jne	.LBB5_6
	jmp	.LBB5_7
.LBB5_59:
	testl	%eax, %eax
	je	.LBB5_60
# %bb.62:
	vmovaps	(%rdx), %ymm1
	vmulps	(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 32(%rsp)
	vmovaps	32(%rdx), %ymm1
	vmulps	32(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 64(%rsp)
	vmovaps	64(%rdx), %ymm1
	vmulps	64(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 96(%rsp)
	vmovaps	96(%rdx), %ymm1
	vmulps	96(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 128(%rsp)
	vmovaps	128(%rdx), %ymm1
	vmulps	128(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 160(%rsp)
	vmovaps	160(%rdx), %ymm1
	vmulps	160(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 192(%rsp)
	vmovaps	192(%rdx), %ymm1
	vmulps	192(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 224(%rsp)
	vmovaps	224(%rdx), %ymm1
	vmulps	224(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 256(%rsp)
	leaq	224(%rdi), %r10
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%r11d, %r11d
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	.p2align	4, 0x90
.LBB5_63:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	32(%rsp,%r11,4), %ymm9
	vfmadd231ps	-224(%r10), %ymm9, %ymm8 # ymm8 = (ymm9 * mem) + ymm8
	vfmadd231ps	-192(%r10), %ymm9, %ymm7 # ymm7 = (ymm9 * mem) + ymm7
	vfmadd231ps	-160(%r10), %ymm9, %ymm6 # ymm6 = (ymm9 * mem) + ymm6
	vfmadd231ps	-128(%r10), %ymm9, %ymm5 # ymm5 = (ymm9 * mem) + ymm5
	vfmadd231ps	-96(%r10), %ymm9, %ymm4 # ymm4 = (ymm9 * mem) + ymm4
	vfmadd231ps	-64(%r10), %ymm9, %ymm3 # ymm3 = (ymm9 * mem) + ymm3
	vfmadd231ps	-32(%r10), %ymm9, %ymm2 # ymm2 = (ymm9 * mem) + ymm2
	vfmadd231ps	(%r10), %ymm9, %ymm1    # ymm1 = (ymm9 * mem) + ymm1
	incq	%r11
	addq	$256, %r10                      # imm = 0x100
	cmpq	$64, %r11
	jne	.LBB5_63
	jmp	.LBB5_64
.LBB5_16:
	testl	%eax, %eax
	je	.LBB5_17
# %bb.19:
	vmovaps	(%rdx), %ymm1
	vmulps	(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 32(%rsp)
	vmovaps	32(%rdx), %ymm1
	vmulps	32(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 64(%rsp)
	vmovaps	64(%rdx), %ymm1
	vmulps	64(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 96(%rsp)
	vmovaps	96(%rdx), %ymm1
	vmulps	96(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 128(%rsp)
	vmovaps	128(%rdx), %ymm1
	vmulps	128(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 160(%rsp)
	vmovaps	160(%rdx), %ymm1
	vmulps	160(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 192(%rsp)
	vmovaps	192(%rdx), %ymm1
	vmulps	192(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 224(%rsp)
	vmovaps	224(%rdx), %ymm1
	vmulps	224(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 256(%rsp)
	vxorps	%xmm1, %xmm1, %xmm1
	leaq	32(%rsp), %r11
	xorl	%ebx, %ebx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	.p2align	4, 0x90
.LBB5_20:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%r11), %ymm9
	prefetcht1	(%r10,%rbx,4)
	prefetcht1	64(%r10,%rbx,4)
	prefetcht1	128(%r10,%rbx,4)
	prefetcht1	192(%r10,%rbx,4)
	vfmadd231ps	(%rdi,%rbx,4), %ymm9, %ymm8 # ymm8 = (ymm9 * mem) + ymm8
	vfmadd231ps	32(%rdi,%rbx,4), %ymm9, %ymm7 # ymm7 = (ymm9 * mem) + ymm7
	vfmadd231ps	64(%rdi,%rbx,4), %ymm9, %ymm6 # ymm6 = (ymm9 * mem) + ymm6
	vfmadd231ps	96(%rdi,%rbx,4), %ymm9, %ymm5 # ymm5 = (ymm9 * mem) + ymm5
	vfmadd231ps	128(%rdi,%rbx,4), %ymm9, %ymm4 # ymm4 = (ymm9 * mem) + ymm4
	vfmadd231ps	160(%rdi,%rbx,4), %ymm9, %ymm3 # ymm3 = (ymm9 * mem) + ymm3
	vfmadd231ps	192(%rdi,%rbx,4), %ymm9, %ymm2 # ymm2 = (ymm9 * mem) + ymm2
	vfmadd231ps	224(%rdi,%rbx,4), %ymm9, %ymm1 # ymm1 = (ymm9 * mem) + ymm1
	addq	$64, %rbx
	addq	$4, %r11
	cmpq	$4096, %rbx                     # imm = 0x1000
	jne	.LBB5_20
	jmp	.LBB5_21
.LBB5_30:
	testl	%eax, %eax
	je	.LBB5_31
# %bb.33:
	vmovaps	(%rdx), %ymm1
	vmulps	(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 32(%rsp)
	vmovaps	32(%rdx), %ymm1
	vmulps	32(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 64(%rsp)
	vmovaps	64(%rdx), %ymm1
	vmulps	64(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 96(%rsp)
	vmovaps	96(%rdx), %ymm1
	vmulps	96(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 128(%rsp)
	vmovaps	128(%rdx), %ymm1
	vmulps	128(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 160(%rsp)
	vmovaps	160(%rdx), %ymm1
	vmulps	160(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 192(%rsp)
	vmovaps	192(%rdx), %ymm1
	vmulps	192(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 224(%rsp)
	vmovaps	224(%rdx), %ymm1
	vmulps	224(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 256(%rsp)
	vxorps	%xmm1, %xmm1, %xmm1
	leaq	32(%rsp), %r11
	xorl	%ebx, %ebx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	.p2align	4, 0x90
.LBB5_34:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%r11), %ymm9
	prefetcht0	(%r10,%rbx,2)
	prefetcht0	64(%r10,%rbx,2)
	vfmadd231ps	(%rdi,%rbx,4), %ymm9, %ymm8 # ymm8 = (ymm9 * mem) + ymm8
	vfmadd231ps	32(%rdi,%rbx,4), %ymm9, %ymm7 # ymm7 = (ymm9 * mem) + ymm7
	vfmadd231ps	64(%rdi,%rbx,4), %ymm9, %ymm6 # ymm6 = (ymm9 * mem) + ymm6
	vfmadd231ps	96(%rdi,%rbx,4), %ymm9, %ymm5 # ymm5 = (ymm9 * mem) + ymm5
	vfmadd231ps	128(%rdi,%rbx,4), %ymm9, %ymm4 # ymm4 = (ymm9 * mem) + ymm4
	vfmadd231ps	160(%rdi,%rbx,4), %ymm9, %ymm3 # ymm3 = (ymm9 * mem) + ymm3
	vfmadd231ps	192(%rdi,%rbx,4), %ymm9, %ymm2 # ymm2 = (ymm9 * mem) + ymm2
	vfmadd231ps	224(%rdi,%rbx,4), %ymm9, %ymm1 # ymm1 = (ymm9 * mem) + ymm1
	addq	$64, %rbx
	addq	$4, %r11
	cmpq	$4096, %rbx                     # imm = 0x1000
	jne	.LBB5_34
	jmp	.LBB5_35
.LBB5_44:
	testl	%eax, %eax
	je	.LBB5_45
# %bb.47:
	vmovaps	(%rdx), %ymm1
	vmulps	(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 32(%rsp)
	vmovaps	32(%rdx), %ymm1
	vmulps	32(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 64(%rsp)
	vmovaps	64(%rdx), %ymm1
	vmulps	64(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 96(%rsp)
	vmovaps	96(%rdx), %ymm1
	vmulps	96(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 128(%rsp)
	vmovaps	128(%rdx), %ymm1
	vmulps	128(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 160(%rsp)
	vmovaps	160(%rdx), %ymm1
	vmulps	160(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 192(%rsp)
	vmovaps	192(%rdx), %ymm1
	vmulps	192(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 224(%rsp)
	vmovaps	224(%rdx), %ymm1
	vmulps	224(%rsi), %ymm1, %ymm1
	vmovaps	%ymm1, 256(%rsp)
	leaq	224(%rdi), %r11
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ebx, %ebx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	.p2align	4, 0x90
.LBB5_48:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	32(%rsp,%rbx,4), %ymm9
	vfmadd231ps	-224(%r11), %ymm9, %ymm8 # ymm8 = (ymm9 * mem) + ymm8
	vfmadd231ps	-192(%r11), %ymm9, %ymm7 # ymm7 = (ymm9 * mem) + ymm7
	vfmadd231ps	-160(%r11), %ymm9, %ymm6 # ymm6 = (ymm9 * mem) + ymm6
	vfmadd231ps	-128(%r11), %ymm9, %ymm5 # ymm5 = (ymm9 * mem) + ymm5
	vfmadd231ps	-96(%r11), %ymm9, %ymm4 # ymm4 = (ymm9 * mem) + ymm4
	vfmadd231ps	-64(%r11), %ymm9, %ymm3 # ymm3 = (ymm9 * mem) + ymm3
	vfmadd231ps	-32(%r11), %ymm9, %ymm2 # ymm2 = (ymm9 * mem) + ymm2
	vfmadd231ps	(%r11), %ymm9, %ymm1    # ymm1 = (ymm9 * mem) + ymm1
	incq	%rbx
	addq	$256, %r11                      # imm = 0x100
	cmpq	$64, %rbx
	jne	.LBB5_48
	jmp	.LBB5_49
.LBB5_3:
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%r11d, %r11d
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB5_4:                                # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rbx,4), %ymm10
	vbroadcastss	(%rdx,%rbx,4), %ymm9
	prefetcht0	(%r10,%r11)
	prefetcht0	64(%r10,%r11)
	prefetcht0	128(%r10,%r11)
	prefetcht0	192(%r10,%r11)
	vmulps	(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, (%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm8    # ymm8 = (ymm9 * ymm11) + ymm8
	vmulps	32(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, 32(%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm7    # ymm7 = (ymm9 * ymm11) + ymm7
	vmulps	64(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, 64(%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm6    # ymm6 = (ymm9 * ymm11) + ymm6
	vmulps	96(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, 96(%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm5    # ymm5 = (ymm9 * ymm11) + ymm5
	vmulps	128(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, 128(%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm4    # ymm4 = (ymm9 * ymm11) + ymm4
	vmulps	160(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, 160(%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm3    # ymm3 = (ymm9 * ymm11) + ymm3
	vmulps	192(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, 192(%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm2    # ymm2 = (ymm9 * ymm11) + ymm2
	vmulps	224(%rdi,%r11), %ymm10, %ymm10
	vmovaps	%ymm10, 224(%rdi,%r11)
	vfmadd231ps	%ymm10, %ymm9, %ymm1    # ymm1 = (ymm9 * ymm10) + ymm1
	incq	%rbx
	addq	$256, %r11                      # imm = 0x100
	cmpq	$64, %rbx
	jne	.LBB5_4
.LBB5_7:
	vbroadcastss	%xmm0, %ymm11
	vmovups	(%rcx), %ymm0
	vsubps	%ymm8, %ymm0, %ymm0
	vmovups	32(%rcx), %ymm8
	vsubps	%ymm7, %ymm8, %ymm7
	vmovups	64(%rcx), %ymm8
	vsubps	%ymm6, %ymm8, %ymm6
	vmovups	96(%rcx), %ymm8
	vsubps	%ymm5, %ymm8, %ymm5
	vmulps	%ymm0, %ymm11, %ymm0
	vmulps	%ymm7, %ymm11, %ymm8
	vmulps	%ymm6, %ymm11, %ymm9
	vmulps	%ymm5, %ymm11, %ymm10
	vmovups	128(%rcx), %ymm5
	vsubps	%ymm4, %ymm5, %ymm4
	vmulps	%ymm4, %ymm11, %ymm4
	vmovups	160(%rcx), %ymm5
	vsubps	%ymm3, %ymm5, %ymm3
	vmulps	%ymm3, %ymm11, %ymm5
	vmovups	192(%rcx), %ymm3
	vsubps	%ymm2, %ymm3, %ymm2
	vmulps	%ymm2, %ymm11, %ymm6
	vmovups	224(%rcx), %ymm2
	vsubps	%ymm1, %ymm2, %ymm1
	vmulps	%ymm1, %ymm11, %ymm7
	testl	%eax, %eax
	je	.LBB5_14
# %bb.8:
	vmovaps	%ymm4, (%rsp)                   # 32-byte Spill
	leaq	96(%rdi), %rax
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm11, %xmm11, %xmm11
	.p2align	4, 0x90
.LBB5_9:                                # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rcx,4), %ymm12
	vbroadcastss	(%rdx,%rcx,4), %ymm13
	vbroadcastss	(%r8,%rcx,4), %ymm14
	vmulps	-96(%rax), %ymm12, %ymm15
	vfmadd231ps	%ymm0, %ymm13, %ymm15   # ymm15 = (ymm13 * ymm0) + ymm15
	vmovaps	%ymm15, -96(%rax)
	vfmadd231ps	%ymm15, %ymm14, %ymm1   # ymm1 = (ymm14 * ymm15) + ymm1
	vmulps	-64(%rax), %ymm12, %ymm15
	vfmadd231ps	%ymm8, %ymm13, %ymm15   # ymm15 = (ymm13 * ymm8) + ymm15
	vmovaps	%ymm15, -64(%rax)
	vmulps	-32(%rax), %ymm12, %ymm4
	vfmadd231ps	%ymm15, %ymm14, %ymm2   # ymm2 = (ymm14 * ymm15) + ymm2
	vfmadd231ps	%ymm9, %ymm13, %ymm4    # ymm4 = (ymm13 * ymm9) + ymm4
	vmovaps	%ymm4, -32(%rax)
	vfmadd231ps	%ymm4, %ymm14, %ymm3    # ymm3 = (ymm14 * ymm4) + ymm3
	vmulps	(%rax), %ymm12, %ymm4
	vfmadd231ps	%ymm13, %ymm10, %ymm4   # ymm4 = (ymm10 * ymm13) + ymm4
	vmovaps	%ymm4, (%rax)
	vfmadd231ps	%ymm4, %ymm14, %ymm11   # ymm11 = (ymm14 * ymm4) + ymm11
	incq	%rcx
	addq	$256, %rax                      # imm = 0x100
	cmpq	$64, %rcx
	jne	.LBB5_9
# %bb.10:
	vmovaps	%ymm1, (%r9)
	vmovaps	%ymm2, 32(%r9)
	vmovaps	%ymm3, 64(%r9)
	vmovaps	%ymm11, 96(%r9)
	addq	$224, %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vmovaps	(%rsp), %ymm4                   # 32-byte Reload
	.p2align	4, 0x90
.LBB5_11:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rax,4), %ymm8
	vbroadcastss	(%rdx,%rax,4), %ymm9
	vbroadcastss	(%r8,%rax,4), %ymm10
	vmulps	-96(%rdi), %ymm8, %ymm11
	vfmadd231ps	%ymm4, %ymm9, %ymm11    # ymm11 = (ymm9 * ymm4) + ymm11
	vmovaps	%ymm11, -96(%rdi)
	vfmadd231ps	%ymm11, %ymm10, %ymm0   # ymm0 = (ymm10 * ymm11) + ymm0
	vmulps	-64(%rdi), %ymm8, %ymm11
	vfmadd231ps	%ymm5, %ymm9, %ymm11    # ymm11 = (ymm9 * ymm5) + ymm11
	vmovaps	%ymm11, -64(%rdi)
	vmulps	-32(%rdi), %ymm8, %ymm12
	vfmadd231ps	%ymm11, %ymm10, %ymm1   # ymm1 = (ymm10 * ymm11) + ymm1
	vfmadd231ps	%ymm6, %ymm9, %ymm12    # ymm12 = (ymm9 * ymm6) + ymm12
	vmovaps	%ymm12, -32(%rdi)
	vfmadd231ps	%ymm12, %ymm10, %ymm2   # ymm2 = (ymm10 * ymm12) + ymm2
	vmulps	(%rdi), %ymm8, %ymm8
	vfmadd231ps	%ymm9, %ymm7, %ymm8     # ymm8 = (ymm7 * ymm9) + ymm8
	vmovaps	%ymm8, (%rdi)
	vfmadd231ps	%ymm8, %ymm10, %ymm3    # ymm3 = (ymm10 * ymm8) + ymm3
	incq	%rax
	addq	$256, %rdi                      # imm = 0x100
	cmpq	$64, %rax
	jne	.LBB5_11
	jmp	.LBB5_54
.LBB5_60:
	leaq	224(%rdi), %r10
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%r11d, %r11d
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	.p2align	4, 0x90
.LBB5_61:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%r11,4), %ymm9
	vbroadcastss	(%rdx,%r11,4), %ymm10
	vmulps	-224(%r10), %ymm9, %ymm11
	vmovaps	%ymm11, -224(%r10)
	vfmadd231ps	%ymm11, %ymm10, %ymm8   # ymm8 = (ymm10 * ymm11) + ymm8
	vmulps	-192(%r10), %ymm9, %ymm11
	vmovaps	%ymm11, -192(%r10)
	vfmadd231ps	%ymm11, %ymm10, %ymm7   # ymm7 = (ymm10 * ymm11) + ymm7
	vmulps	-160(%r10), %ymm9, %ymm11
	vmovaps	%ymm11, -160(%r10)
	vfmadd231ps	%ymm11, %ymm10, %ymm6   # ymm6 = (ymm10 * ymm11) + ymm6
	vmulps	-128(%r10), %ymm9, %ymm11
	vmovaps	%ymm11, -128(%r10)
	vfmadd231ps	%ymm11, %ymm10, %ymm5   # ymm5 = (ymm10 * ymm11) + ymm5
	vmulps	-96(%r10), %ymm9, %ymm11
	vmovaps	%ymm11, -96(%r10)
	vfmadd231ps	%ymm11, %ymm10, %ymm4   # ymm4 = (ymm10 * ymm11) + ymm4
	vmulps	-64(%r10), %ymm9, %ymm11
	vmovaps	%ymm11, -64(%r10)
	vfmadd231ps	%ymm11, %ymm10, %ymm3   # ymm3 = (ymm10 * ymm11) + ymm3
	vmulps	-32(%r10), %ymm9, %ymm11
	vmovaps	%ymm11, -32(%r10)
	vfmadd231ps	%ymm11, %ymm10, %ymm2   # ymm2 = (ymm10 * ymm11) + ymm2
	vmulps	(%r10), %ymm9, %ymm9
	vmovaps	%ymm9, (%r10)
	vfmadd231ps	%ymm9, %ymm10, %ymm1    # ymm1 = (ymm10 * ymm9) + ymm1
	incq	%r11
	addq	$256, %r10                      # imm = 0x100
	cmpq	$64, %r11
	jne	.LBB5_61
.LBB5_64:
	vbroadcastss	%xmm0, %ymm11
	vmovups	(%rcx), %ymm0
	vsubps	%ymm8, %ymm0, %ymm0
	vmovups	32(%rcx), %ymm8
	vsubps	%ymm7, %ymm8, %ymm7
	vmovups	64(%rcx), %ymm8
	vsubps	%ymm6, %ymm8, %ymm6
	vmovups	96(%rcx), %ymm8
	vsubps	%ymm5, %ymm8, %ymm5
	vmulps	%ymm0, %ymm11, %ymm0
	vmulps	%ymm7, %ymm11, %ymm8
	vmulps	%ymm6, %ymm11, %ymm9
	vmulps	%ymm5, %ymm11, %ymm10
	vmovups	128(%rcx), %ymm5
	vsubps	%ymm4, %ymm5, %ymm4
	vmulps	%ymm4, %ymm11, %ymm4
	vmovups	160(%rcx), %ymm5
	vsubps	%ymm3, %ymm5, %ymm3
	vmulps	%ymm3, %ymm11, %ymm5
	vmovups	192(%rcx), %ymm3
	vsubps	%ymm2, %ymm3, %ymm2
	vmulps	%ymm2, %ymm11, %ymm6
	vmovups	224(%rcx), %ymm2
	vsubps	%ymm1, %ymm2, %ymm1
	vmulps	%ymm1, %ymm11, %ymm7
	testl	%eax, %eax
	je	.LBB5_71
# %bb.65:
	vmovaps	%ymm4, (%rsp)                   # 32-byte Spill
	leaq	96(%rdi), %rax
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm11, %xmm11, %xmm11
	.p2align	4, 0x90
.LBB5_66:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rcx,4), %ymm12
	vbroadcastss	(%rdx,%rcx,4), %ymm13
	vbroadcastss	(%r8,%rcx,4), %ymm14
	vmulps	-96(%rax), %ymm12, %ymm15
	vfmadd231ps	%ymm0, %ymm13, %ymm15   # ymm15 = (ymm13 * ymm0) + ymm15
	vmovaps	%ymm15, -96(%rax)
	vfmadd231ps	%ymm15, %ymm14, %ymm1   # ymm1 = (ymm14 * ymm15) + ymm1
	vmulps	-64(%rax), %ymm12, %ymm15
	vfmadd231ps	%ymm8, %ymm13, %ymm15   # ymm15 = (ymm13 * ymm8) + ymm15
	vmovaps	%ymm15, -64(%rax)
	vmulps	-32(%rax), %ymm12, %ymm4
	vfmadd231ps	%ymm15, %ymm14, %ymm2   # ymm2 = (ymm14 * ymm15) + ymm2
	vfmadd231ps	%ymm9, %ymm13, %ymm4    # ymm4 = (ymm13 * ymm9) + ymm4
	vmovaps	%ymm4, -32(%rax)
	vfmadd231ps	%ymm4, %ymm14, %ymm3    # ymm3 = (ymm14 * ymm4) + ymm3
	vmulps	(%rax), %ymm12, %ymm4
	vfmadd231ps	%ymm13, %ymm10, %ymm4   # ymm4 = (ymm10 * ymm13) + ymm4
	vmovaps	%ymm4, (%rax)
	vfmadd231ps	%ymm4, %ymm14, %ymm11   # ymm11 = (ymm14 * ymm4) + ymm11
	incq	%rcx
	addq	$256, %rax                      # imm = 0x100
	cmpq	$64, %rcx
	jne	.LBB5_66
# %bb.67:
	vmovaps	%ymm1, (%r9)
	vmovaps	%ymm2, 32(%r9)
	vmovaps	%ymm3, 64(%r9)
	vmovaps	%ymm11, 96(%r9)
	addq	$224, %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vmovaps	(%rsp), %ymm4                   # 32-byte Reload
	.p2align	4, 0x90
.LBB5_68:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rax,4), %ymm8
	vbroadcastss	(%rdx,%rax,4), %ymm9
	vbroadcastss	(%r8,%rax,4), %ymm10
	vmulps	-96(%rdi), %ymm8, %ymm11
	vfmadd231ps	%ymm4, %ymm9, %ymm11    # ymm11 = (ymm9 * ymm4) + ymm11
	vmovaps	%ymm11, -96(%rdi)
	vfmadd231ps	%ymm11, %ymm10, %ymm0   # ymm0 = (ymm10 * ymm11) + ymm0
	vmulps	-64(%rdi), %ymm8, %ymm11
	vfmadd231ps	%ymm5, %ymm9, %ymm11    # ymm11 = (ymm9 * ymm5) + ymm11
	vmovaps	%ymm11, -64(%rdi)
	vmulps	-32(%rdi), %ymm8, %ymm12
	vfmadd231ps	%ymm11, %ymm10, %ymm1   # ymm1 = (ymm10 * ymm11) + ymm1
	vfmadd231ps	%ymm6, %ymm9, %ymm12    # ymm12 = (ymm9 * ymm6) + ymm12
	vmovaps	%ymm12, -32(%rdi)
	vfmadd231ps	%ymm12, %ymm10, %ymm2   # ymm2 = (ymm10 * ymm12) + ymm2
	vmulps	(%rdi), %ymm8, %ymm8
	vfmadd231ps	%ymm9, %ymm7, %ymm8     # ymm8 = (ymm7 * ymm9) + ymm8
	vmovaps	%ymm8, (%rdi)
	vfmadd231ps	%ymm8, %ymm10, %ymm3    # ymm3 = (ymm10 * ymm8) + ymm3
	incq	%rax
	addq	$256, %rdi                      # imm = 0x100
	cmpq	$64, %rax
	jne	.LBB5_68
	jmp	.LBB5_54
.LBB5_17:
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%r11d, %r11d
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	xorl	%ebx, %ebx
	.p2align	4, 0x90
.LBB5_18:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rbx,4), %ymm10
	vbroadcastss	(%rdx,%rbx,4), %ymm9
	prefetcht1	(%r10,%r11)
	prefetcht1	64(%r10,%r11)
	prefetcht1	128(%r10,%r11)
	prefetcht1	192(%r10,%r11)
	vmulps	(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, (%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm8    # ymm8 = (ymm9 * ymm11) + ymm8
	vmulps	32(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, 32(%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm7    # ymm7 = (ymm9 * ymm11) + ymm7
	vmulps	64(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, 64(%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm6    # ymm6 = (ymm9 * ymm11) + ymm6
	vmulps	96(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, 96(%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm5    # ymm5 = (ymm9 * ymm11) + ymm5
	vmulps	128(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, 128(%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm4    # ymm4 = (ymm9 * ymm11) + ymm4
	vmulps	160(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, 160(%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm3    # ymm3 = (ymm9 * ymm11) + ymm3
	vmulps	192(%rdi,%r11), %ymm10, %ymm11
	vmovaps	%ymm11, 192(%rdi,%r11)
	vfmadd231ps	%ymm11, %ymm9, %ymm2    # ymm2 = (ymm9 * ymm11) + ymm2
	vmulps	224(%rdi,%r11), %ymm10, %ymm10
	vmovaps	%ymm10, 224(%rdi,%r11)
	vfmadd231ps	%ymm10, %ymm9, %ymm1    # ymm1 = (ymm9 * ymm10) + ymm1
	incq	%rbx
	addq	$256, %r11                      # imm = 0x100
	cmpq	$64, %rbx
	jne	.LBB5_18
.LBB5_21:
	vbroadcastss	%xmm0, %ymm11
	vmovups	(%rcx), %ymm0
	vsubps	%ymm8, %ymm0, %ymm0
	vmovups	32(%rcx), %ymm8
	vsubps	%ymm7, %ymm8, %ymm7
	vmovups	64(%rcx), %ymm8
	vsubps	%ymm6, %ymm8, %ymm6
	vmovups	96(%rcx), %ymm8
	vsubps	%ymm5, %ymm8, %ymm5
	vmulps	%ymm0, %ymm11, %ymm0
	vmulps	%ymm7, %ymm11, %ymm8
	vmulps	%ymm6, %ymm11, %ymm9
	vmulps	%ymm5, %ymm11, %ymm10
	vmovups	128(%rcx), %ymm5
	vsubps	%ymm4, %ymm5, %ymm4
	vmulps	%ymm4, %ymm11, %ymm4
	vmovups	160(%rcx), %ymm5
	vsubps	%ymm3, %ymm5, %ymm3
	vmulps	%ymm3, %ymm11, %ymm5
	vmovups	192(%rcx), %ymm3
	vsubps	%ymm2, %ymm3, %ymm2
	vmulps	%ymm2, %ymm11, %ymm6
	vmovups	224(%rcx), %ymm2
	vsubps	%ymm1, %ymm2, %ymm1
	vmulps	%ymm1, %ymm11, %ymm7
	testl	%eax, %eax
	je	.LBB5_28
# %bb.22:
	vmovaps	%ymm4, (%rsp)                   # 32-byte Spill
	leaq	96(%rdi), %rax
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm11, %xmm11, %xmm11
	.p2align	4, 0x90
.LBB5_23:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rcx,4), %ymm12
	vbroadcastss	(%rdx,%rcx,4), %ymm13
	vbroadcastss	(%r8,%rcx,4), %ymm14
	vmulps	-96(%rax), %ymm12, %ymm15
	vfmadd231ps	%ymm0, %ymm13, %ymm15   # ymm15 = (ymm13 * ymm0) + ymm15
	vmovaps	%ymm15, -96(%rax)
	vfmadd231ps	%ymm15, %ymm14, %ymm1   # ymm1 = (ymm14 * ymm15) + ymm1
	vmulps	-64(%rax), %ymm12, %ymm15
	vfmadd231ps	%ymm8, %ymm13, %ymm15   # ymm15 = (ymm13 * ymm8) + ymm15
	vmovaps	%ymm15, -64(%rax)
	vmulps	-32(%rax), %ymm12, %ymm4
	vfmadd231ps	%ymm15, %ymm14, %ymm2   # ymm2 = (ymm14 * ymm15) + ymm2
	vfmadd231ps	%ymm9, %ymm13, %ymm4    # ymm4 = (ymm13 * ymm9) + ymm4
	vmovaps	%ymm4, -32(%rax)
	vfmadd231ps	%ymm4, %ymm14, %ymm3    # ymm3 = (ymm14 * ymm4) + ymm3
	vmulps	(%rax), %ymm12, %ymm4
	vfmadd231ps	%ymm13, %ymm10, %ymm4   # ymm4 = (ymm10 * ymm13) + ymm4
	vmovaps	%ymm4, (%rax)
	vfmadd231ps	%ymm4, %ymm14, %ymm11   # ymm11 = (ymm14 * ymm4) + ymm11
	incq	%rcx
	addq	$256, %rax                      # imm = 0x100
	cmpq	$64, %rcx
	jne	.LBB5_23
# %bb.24:
	vmovaps	%ymm1, (%r9)
	vmovaps	%ymm2, 32(%r9)
	vmovaps	%ymm3, 64(%r9)
	vmovaps	%ymm11, 96(%r9)
	addq	$224, %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vmovaps	(%rsp), %ymm4                   # 32-byte Reload
	.p2align	4, 0x90
.LBB5_25:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rax,4), %ymm8
	vbroadcastss	(%rdx,%rax,4), %ymm9
	vbroadcastss	(%r8,%rax,4), %ymm10
	vmulps	-96(%rdi), %ymm8, %ymm11
	vfmadd231ps	%ymm4, %ymm9, %ymm11    # ymm11 = (ymm9 * ymm4) + ymm11
	vmovaps	%ymm11, -96(%rdi)
	vfmadd231ps	%ymm11, %ymm10, %ymm0   # ymm0 = (ymm10 * ymm11) + ymm0
	vmulps	-64(%rdi), %ymm8, %ymm11
	vfmadd231ps	%ymm5, %ymm9, %ymm11    # ymm11 = (ymm9 * ymm5) + ymm11
	vmovaps	%ymm11, -64(%rdi)
	vmulps	-32(%rdi), %ymm8, %ymm12
	vfmadd231ps	%ymm11, %ymm10, %ymm1   # ymm1 = (ymm10 * ymm11) + ymm1
	vfmadd231ps	%ymm6, %ymm9, %ymm12    # ymm12 = (ymm9 * ymm6) + ymm12
	vmovaps	%ymm12, -32(%rdi)
	vfmadd231ps	%ymm12, %ymm10, %ymm2   # ymm2 = (ymm10 * ymm12) + ymm2
	vmulps	(%rdi), %ymm8, %ymm8
	vfmadd231ps	%ymm9, %ymm7, %ymm8     # ymm8 = (ymm7 * ymm9) + ymm8
	vmovaps	%ymm8, (%rdi)
	vfmadd231ps	%ymm8, %ymm10, %ymm3    # ymm3 = (ymm10 * ymm8) + ymm3
	incq	%rax
	addq	$256, %rdi                      # imm = 0x100
	cmpq	$64, %rax
	jne	.LBB5_25
	jmp	.LBB5_54
.LBB5_31:
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%r11d, %r11d
	xorl	%ebx, %ebx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	.p2align	4, 0x90
.LBB5_32:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rbx), %ymm10
	vbroadcastss	(%rdx,%rbx), %ymm9
	prefetcht0	(%r10,%r11,2)
	prefetcht0	64(%r10,%r11,2)
	vmulps	(%rdi,%r11,4), %ymm10, %ymm11
	vmovaps	%ymm11, (%rdi,%r11,4)
	vfmadd231ps	%ymm11, %ymm9, %ymm8    # ymm8 = (ymm9 * ymm11) + ymm8
	vmulps	32(%rdi,%r11,4), %ymm10, %ymm11
	vmovaps	%ymm11, 32(%rdi,%r11,4)
	vfmadd231ps	%ymm11, %ymm9, %ymm7    # ymm7 = (ymm9 * ymm11) + ymm7
	vmulps	64(%rdi,%r11,4), %ymm10, %ymm11
	vmovaps	%ymm11, 64(%rdi,%r11,4)
	vfmadd231ps	%ymm11, %ymm9, %ymm6    # ymm6 = (ymm9 * ymm11) + ymm6
	vmulps	96(%rdi,%r11,4), %ymm10, %ymm11
	vmovaps	%ymm11, 96(%rdi,%r11,4)
	vfmadd231ps	%ymm11, %ymm9, %ymm5    # ymm5 = (ymm9 * ymm11) + ymm5
	vmulps	128(%rdi,%r11,4), %ymm10, %ymm11
	vmovaps	%ymm11, 128(%rdi,%r11,4)
	vfmadd231ps	%ymm11, %ymm9, %ymm4    # ymm4 = (ymm9 * ymm11) + ymm4
	vmulps	160(%rdi,%r11,4), %ymm10, %ymm11
	vmovaps	%ymm11, 160(%rdi,%r11,4)
	vfmadd231ps	%ymm11, %ymm9, %ymm3    # ymm3 = (ymm9 * ymm11) + ymm3
	vmulps	192(%rdi,%r11,4), %ymm10, %ymm11
	vmovaps	%ymm11, 192(%rdi,%r11,4)
	vfmadd231ps	%ymm11, %ymm9, %ymm2    # ymm2 = (ymm9 * ymm11) + ymm2
	vmulps	224(%rdi,%r11,4), %ymm10, %ymm10
	vmovaps	%ymm10, 224(%rdi,%r11,4)
	vfmadd231ps	%ymm10, %ymm9, %ymm1    # ymm1 = (ymm9 * ymm10) + ymm1
	addq	$4, %rbx
	addq	$64, %r11
	cmpq	$256, %rbx                      # imm = 0x100
	jne	.LBB5_32
.LBB5_35:
	vbroadcastss	%xmm0, %ymm11
	vmovups	(%rcx), %ymm0
	vsubps	%ymm8, %ymm0, %ymm0
	vmovups	32(%rcx), %ymm8
	vsubps	%ymm7, %ymm8, %ymm7
	vmovups	64(%rcx), %ymm8
	vsubps	%ymm6, %ymm8, %ymm6
	vmovups	96(%rcx), %ymm8
	vsubps	%ymm5, %ymm8, %ymm5
	vmulps	%ymm0, %ymm11, %ymm0
	vmulps	%ymm7, %ymm11, %ymm8
	vmulps	%ymm6, %ymm11, %ymm9
	vmulps	%ymm5, %ymm11, %ymm10
	vmovups	128(%rcx), %ymm5
	vsubps	%ymm4, %ymm5, %ymm4
	vmulps	%ymm4, %ymm11, %ymm4
	vmovups	160(%rcx), %ymm5
	vsubps	%ymm3, %ymm5, %ymm3
	vmulps	%ymm3, %ymm11, %ymm5
	vmovups	192(%rcx), %ymm3
	vsubps	%ymm2, %ymm3, %ymm2
	vmulps	%ymm2, %ymm11, %ymm6
	vmovups	224(%rcx), %ymm2
	vsubps	%ymm1, %ymm2, %ymm1
	vmulps	%ymm1, %ymm11, %ymm7
	testl	%eax, %eax
	je	.LBB5_42
# %bb.36:
	vmovaps	%ymm4, (%rsp)                   # 32-byte Spill
	leaq	96(%rdi), %rax
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm11, %xmm11, %xmm11
	.p2align	4, 0x90
.LBB5_37:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rcx,4), %ymm12
	vbroadcastss	(%rdx,%rcx,4), %ymm13
	vbroadcastss	(%r8,%rcx,4), %ymm14
	vmulps	-96(%rax), %ymm12, %ymm15
	vfmadd231ps	%ymm0, %ymm13, %ymm15   # ymm15 = (ymm13 * ymm0) + ymm15
	vmovaps	%ymm15, -96(%rax)
	vfmadd231ps	%ymm15, %ymm14, %ymm1   # ymm1 = (ymm14 * ymm15) + ymm1
	vmulps	-64(%rax), %ymm12, %ymm15
	vfmadd231ps	%ymm8, %ymm13, %ymm15   # ymm15 = (ymm13 * ymm8) + ymm15
	vmovaps	%ymm15, -64(%rax)
	vmulps	-32(%rax), %ymm12, %ymm4
	vfmadd231ps	%ymm15, %ymm14, %ymm2   # ymm2 = (ymm14 * ymm15) + ymm2
	vfmadd231ps	%ymm9, %ymm13, %ymm4    # ymm4 = (ymm13 * ymm9) + ymm4
	vmovaps	%ymm4, -32(%rax)
	vfmadd231ps	%ymm4, %ymm14, %ymm3    # ymm3 = (ymm14 * ymm4) + ymm3
	vmulps	(%rax), %ymm12, %ymm4
	vfmadd231ps	%ymm13, %ymm10, %ymm4   # ymm4 = (ymm10 * ymm13) + ymm4
	vmovaps	%ymm4, (%rax)
	vfmadd231ps	%ymm4, %ymm14, %ymm11   # ymm11 = (ymm14 * ymm4) + ymm11
	incq	%rcx
	addq	$256, %rax                      # imm = 0x100
	cmpq	$64, %rcx
	jne	.LBB5_37
# %bb.38:
	vmovaps	%ymm1, (%r9)
	vmovaps	%ymm2, 32(%r9)
	vmovaps	%ymm3, 64(%r9)
	vmovaps	%ymm11, 96(%r9)
	addq	$224, %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vmovaps	(%rsp), %ymm4                   # 32-byte Reload
	.p2align	4, 0x90
.LBB5_39:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rax,4), %ymm8
	vbroadcastss	(%rdx,%rax,4), %ymm9
	vbroadcastss	(%r8,%rax,4), %ymm10
	vmulps	-96(%rdi), %ymm8, %ymm11
	vfmadd231ps	%ymm4, %ymm9, %ymm11    # ymm11 = (ymm9 * ymm4) + ymm11
	vmovaps	%ymm11, -96(%rdi)
	vfmadd231ps	%ymm11, %ymm10, %ymm0   # ymm0 = (ymm10 * ymm11) + ymm0
	vmulps	-64(%rdi), %ymm8, %ymm11
	vfmadd231ps	%ymm5, %ymm9, %ymm11    # ymm11 = (ymm9 * ymm5) + ymm11
	vmovaps	%ymm11, -64(%rdi)
	vmulps	-32(%rdi), %ymm8, %ymm12
	vfmadd231ps	%ymm11, %ymm10, %ymm1   # ymm1 = (ymm10 * ymm11) + ymm1
	vfmadd231ps	%ymm6, %ymm9, %ymm12    # ymm12 = (ymm9 * ymm6) + ymm12
	vmovaps	%ymm12, -32(%rdi)
	vfmadd231ps	%ymm12, %ymm10, %ymm2   # ymm2 = (ymm10 * ymm12) + ymm2
	vmulps	(%rdi), %ymm8, %ymm8
	vfmadd231ps	%ymm9, %ymm7, %ymm8     # ymm8 = (ymm7 * ymm9) + ymm8
	vmovaps	%ymm8, (%rdi)
	vfmadd231ps	%ymm8, %ymm10, %ymm3    # ymm3 = (ymm10 * ymm8) + ymm3
	incq	%rax
	addq	$256, %rdi                      # imm = 0x100
	cmpq	$64, %rax
	jne	.LBB5_39
	jmp	.LBB5_54
.LBB5_45:
	leaq	224(%rdi), %r11
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ebx, %ebx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	.p2align	4, 0x90
.LBB5_46:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rbx,4), %ymm9
	vbroadcastss	(%rdx,%rbx,4), %ymm10
	vmulps	-224(%r11), %ymm9, %ymm11
	vmovaps	%ymm11, -224(%r11)
	vfmadd231ps	%ymm11, %ymm10, %ymm8   # ymm8 = (ymm10 * ymm11) + ymm8
	vmulps	-192(%r11), %ymm9, %ymm11
	vmovaps	%ymm11, -192(%r11)
	vfmadd231ps	%ymm11, %ymm10, %ymm7   # ymm7 = (ymm10 * ymm11) + ymm7
	vmulps	-160(%r11), %ymm9, %ymm11
	vmovaps	%ymm11, -160(%r11)
	vfmadd231ps	%ymm11, %ymm10, %ymm6   # ymm6 = (ymm10 * ymm11) + ymm6
	vmulps	-128(%r11), %ymm9, %ymm11
	vmovaps	%ymm11, -128(%r11)
	vfmadd231ps	%ymm11, %ymm10, %ymm5   # ymm5 = (ymm10 * ymm11) + ymm5
	vmulps	-96(%r11), %ymm9, %ymm11
	vmovaps	%ymm11, -96(%r11)
	vfmadd231ps	%ymm11, %ymm10, %ymm4   # ymm4 = (ymm10 * ymm11) + ymm4
	vmulps	-64(%r11), %ymm9, %ymm11
	vmovaps	%ymm11, -64(%r11)
	vfmadd231ps	%ymm11, %ymm10, %ymm3   # ymm3 = (ymm10 * ymm11) + ymm3
	vmulps	-32(%r11), %ymm9, %ymm11
	vmovaps	%ymm11, -32(%r11)
	vfmadd231ps	%ymm11, %ymm10, %ymm2   # ymm2 = (ymm10 * ymm11) + ymm2
	vmulps	(%r11), %ymm9, %ymm9
	vmovaps	%ymm9, (%r11)
	vfmadd231ps	%ymm9, %ymm10, %ymm1    # ymm1 = (ymm10 * ymm9) + ymm1
	incq	%rbx
	addq	$256, %r11                      # imm = 0x100
	cmpq	$64, %rbx
	jne	.LBB5_46
.LBB5_49:
	vbroadcastss	%xmm0, %ymm11
	vmovups	(%rcx), %ymm0
	vsubps	%ymm8, %ymm0, %ymm0
	vmovups	32(%rcx), %ymm8
	vsubps	%ymm7, %ymm8, %ymm7
	vmovups	64(%rcx), %ymm8
	vsubps	%ymm6, %ymm8, %ymm6
	vmovups	96(%rcx), %ymm8
	vsubps	%ymm5, %ymm8, %ymm5
	vmulps	%ymm0, %ymm11, %ymm0
	vmulps	%ymm7, %ymm11, %ymm8
	vmulps	%ymm6, %ymm11, %ymm9
	vmulps	%ymm5, %ymm11, %ymm10
	vmovups	128(%rcx), %ymm5
	vsubps	%ymm4, %ymm5, %ymm4
	vmulps	%ymm4, %ymm11, %ymm4
	vmovups	160(%rcx), %ymm5
	vsubps	%ymm3, %ymm5, %ymm3
	vmulps	%ymm3, %ymm11, %ymm5
	vmovups	192(%rcx), %ymm3
	vsubps	%ymm2, %ymm3, %ymm2
	vmulps	%ymm2, %ymm11, %ymm6
	vmovups	224(%rcx), %ymm2
	vsubps	%ymm1, %ymm2, %ymm1
	vmulps	%ymm1, %ymm11, %ymm7
	testl	%eax, %eax
	je	.LBB5_57
# %bb.50:
	vmovaps	%ymm4, (%rsp)                   # 32-byte Spill
	leaq	96(%rdi), %rax
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm11, %xmm11, %xmm11
	.p2align	4, 0x90
.LBB5_51:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rcx,4), %ymm12
	vbroadcastss	(%rdx,%rcx,4), %ymm13
	vbroadcastss	(%r8,%rcx,4), %ymm14
	vmulps	-96(%rax), %ymm12, %ymm15
	vfmadd231ps	%ymm0, %ymm13, %ymm15   # ymm15 = (ymm13 * ymm0) + ymm15
	vmovaps	%ymm15, -96(%rax)
	vfmadd231ps	%ymm15, %ymm14, %ymm1   # ymm1 = (ymm14 * ymm15) + ymm1
	vmulps	-64(%rax), %ymm12, %ymm15
	vfmadd231ps	%ymm8, %ymm13, %ymm15   # ymm15 = (ymm13 * ymm8) + ymm15
	vmovaps	%ymm15, -64(%rax)
	vmulps	-32(%rax), %ymm12, %ymm4
	vfmadd231ps	%ymm15, %ymm14, %ymm2   # ymm2 = (ymm14 * ymm15) + ymm2
	vfmadd231ps	%ymm9, %ymm13, %ymm4    # ymm4 = (ymm13 * ymm9) + ymm4
	vmovaps	%ymm4, -32(%rax)
	vfmadd231ps	%ymm4, %ymm14, %ymm3    # ymm3 = (ymm14 * ymm4) + ymm3
	vmulps	(%rax), %ymm12, %ymm4
	vfmadd231ps	%ymm13, %ymm10, %ymm4   # ymm4 = (ymm10 * ymm13) + ymm4
	vmovaps	%ymm4, (%rax)
	vfmadd231ps	%ymm4, %ymm14, %ymm11   # ymm11 = (ymm14 * ymm4) + ymm11
	incq	%rcx
	addq	$256, %rax                      # imm = 0x100
	cmpq	$64, %rcx
	jne	.LBB5_51
# %bb.52:
	vmovaps	%ymm1, (%r9)
	vmovaps	%ymm2, 32(%r9)
	vmovaps	%ymm3, 64(%r9)
	vmovaps	%ymm11, 96(%r9)
	addq	$224, %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vmovaps	(%rsp), %ymm4                   # 32-byte Reload
	.p2align	4, 0x90
.LBB5_53:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rsi,%rax,4), %ymm8
	vbroadcastss	(%rdx,%rax,4), %ymm9
	vbroadcastss	(%r8,%rax,4), %ymm10
	vmulps	-96(%rdi), %ymm8, %ymm11
	vfmadd231ps	%ymm4, %ymm9, %ymm11    # ymm11 = (ymm9 * ymm4) + ymm11
	vmovaps	%ymm11, -96(%rdi)
	vfmadd231ps	%ymm11, %ymm10, %ymm0   # ymm0 = (ymm10 * ymm11) + ymm0
	vmulps	-64(%rdi), %ymm8, %ymm11
	vfmadd231ps	%ymm5, %ymm9, %ymm11    # ymm11 = (ymm9 * ymm5) + ymm11
	vmovaps	%ymm11, -64(%rdi)
	vmulps	-32(%rdi), %ymm8, %ymm12
	vfmadd231ps	%ymm11, %ymm10, %ymm1   # ymm1 = (ymm10 * ymm11) + ymm1
	vfmadd231ps	%ymm6, %ymm9, %ymm12    # ymm12 = (ymm9 * ymm6) + ymm12
	vmovaps	%ymm12, -32(%rdi)
	vfmadd231ps	%ymm12, %ymm10, %ymm2   # ymm2 = (ymm10 * ymm12) + ymm2
	vmulps	(%rdi), %ymm8, %ymm8
	vfmadd231ps	%ymm9, %ymm7, %ymm8     # ymm8 = (ymm7 * ymm9) + ymm8
	vmovaps	%ymm8, (%rdi)
	vfmadd231ps	%ymm8, %ymm10, %ymm3    # ymm3 = (ymm10 * ymm8) + ymm3
	incq	%rax
	addq	$256, %rdi                      # imm = 0x100
	cmpq	$64, %rax
	jne	.LBB5_53
	jmp	.LBB5_54
.LBB5_14:
	leaq	96(%rdi), %rax
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm11, %xmm11, %xmm11
	.p2align	4, 0x90
.LBB5_15:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rdx,%rcx,4), %ymm12
	vbroadcastss	(%r8,%rcx,4), %ymm13
	vmovaps	-96(%rax), %ymm14
	vfmadd231ps	%ymm0, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm0) + ymm14
	vmovaps	%ymm14, -96(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm1   # ymm1 = (ymm13 * ymm14) + ymm1
	vmovaps	-64(%rax), %ymm14
	vfmadd231ps	%ymm8, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm8) + ymm14
	vmovaps	%ymm14, -64(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm2   # ymm2 = (ymm13 * ymm14) + ymm2
	vmovaps	-32(%rax), %ymm14
	vfmadd231ps	%ymm9, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm9) + ymm14
	vmovaps	%ymm14, -32(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm3   # ymm3 = (ymm13 * ymm14) + ymm3
	vfmadd213ps	(%rax), %ymm10, %ymm12  # ymm12 = (ymm10 * ymm12) + mem
	vmovaps	%ymm12, (%rax)
	vfmadd231ps	%ymm12, %ymm13, %ymm11  # ymm11 = (ymm13 * ymm12) + ymm11
	incq	%rcx
	addq	$256, %rax                      # imm = 0x100
	cmpq	$64, %rcx
	jne	.LBB5_15
# %bb.12:
	vmovaps	%ymm1, (%r9)
	vmovaps	%ymm2, 32(%r9)
	vmovaps	%ymm3, 64(%r9)
	vmovaps	%ymm11, 96(%r9)
	addq	$224, %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_13:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rdx,%rax,4), %ymm8
	vbroadcastss	(%r8,%rax,4), %ymm9
	vmovaps	-96(%rdi), %ymm10
	vfmadd231ps	%ymm4, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm4) + ymm10
	vmovaps	%ymm10, -96(%rdi)
	vfmadd231ps	%ymm10, %ymm9, %ymm0    # ymm0 = (ymm9 * ymm10) + ymm0
	vmovaps	-64(%rdi), %ymm10
	vfmadd231ps	%ymm5, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm5) + ymm10
	vmovaps	%ymm10, -64(%rdi)
	vfmadd231ps	%ymm10, %ymm9, %ymm1    # ymm1 = (ymm9 * ymm10) + ymm1
	vmovaps	-32(%rdi), %ymm10
	vfmadd231ps	%ymm6, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm6) + ymm10
	vmovaps	%ymm10, -32(%rdi)
	vfmadd231ps	%ymm10, %ymm9, %ymm2    # ymm2 = (ymm9 * ymm10) + ymm2
	vfmadd213ps	(%rdi), %ymm7, %ymm8    # ymm8 = (ymm7 * ymm8) + mem
	vmovaps	%ymm8, (%rdi)
	vfmadd231ps	%ymm8, %ymm9, %ymm3     # ymm3 = (ymm9 * ymm8) + ymm3
	incq	%rax
	addq	$256, %rdi                      # imm = 0x100
	cmpq	$64, %rax
	jne	.LBB5_13
	jmp	.LBB5_54
.LBB5_71:
	leaq	96(%rdi), %rax
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm11, %xmm11, %xmm11
	.p2align	4, 0x90
.LBB5_72:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rdx,%rcx,4), %ymm12
	vbroadcastss	(%r8,%rcx,4), %ymm13
	vmovaps	-96(%rax), %ymm14
	vfmadd231ps	%ymm0, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm0) + ymm14
	vmovaps	%ymm14, -96(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm1   # ymm1 = (ymm13 * ymm14) + ymm1
	vmovaps	-64(%rax), %ymm14
	vfmadd231ps	%ymm8, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm8) + ymm14
	vmovaps	%ymm14, -64(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm2   # ymm2 = (ymm13 * ymm14) + ymm2
	vmovaps	-32(%rax), %ymm14
	vfmadd231ps	%ymm9, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm9) + ymm14
	vmovaps	%ymm14, -32(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm3   # ymm3 = (ymm13 * ymm14) + ymm3
	vfmadd213ps	(%rax), %ymm10, %ymm12  # ymm12 = (ymm10 * ymm12) + mem
	vmovaps	%ymm12, (%rax)
	vfmadd231ps	%ymm12, %ymm13, %ymm11  # ymm11 = (ymm13 * ymm12) + ymm11
	incq	%rcx
	addq	$256, %rax                      # imm = 0x100
	cmpq	$64, %rcx
	jne	.LBB5_72
# %bb.69:
	vmovaps	%ymm1, (%r9)
	vmovaps	%ymm2, 32(%r9)
	vmovaps	%ymm3, 64(%r9)
	vmovaps	%ymm11, 96(%r9)
	addq	$224, %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_70:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rdx,%rax,4), %ymm8
	vbroadcastss	(%r8,%rax,4), %ymm9
	vmovaps	-96(%rdi), %ymm10
	vfmadd231ps	%ymm4, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm4) + ymm10
	vmovaps	%ymm10, -96(%rdi)
	vfmadd231ps	%ymm10, %ymm9, %ymm0    # ymm0 = (ymm9 * ymm10) + ymm0
	vmovaps	-64(%rdi), %ymm10
	vfmadd231ps	%ymm5, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm5) + ymm10
	vmovaps	%ymm10, -64(%rdi)
	vfmadd231ps	%ymm10, %ymm9, %ymm1    # ymm1 = (ymm9 * ymm10) + ymm1
	vmovaps	-32(%rdi), %ymm10
	vfmadd231ps	%ymm6, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm6) + ymm10
	vmovaps	%ymm10, -32(%rdi)
	vfmadd231ps	%ymm10, %ymm9, %ymm2    # ymm2 = (ymm9 * ymm10) + ymm2
	vfmadd213ps	(%rdi), %ymm7, %ymm8    # ymm8 = (ymm7 * ymm8) + mem
	vmovaps	%ymm8, (%rdi)
	vfmadd231ps	%ymm8, %ymm9, %ymm3     # ymm3 = (ymm9 * ymm8) + ymm3
	incq	%rax
	addq	$256, %rdi                      # imm = 0x100
	cmpq	$64, %rax
	jne	.LBB5_70
	jmp	.LBB5_54
.LBB5_28:
	leaq	96(%rdi), %rax
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm11, %xmm11, %xmm11
	.p2align	4, 0x90
.LBB5_29:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rdx,%rcx,4), %ymm12
	vbroadcastss	(%r8,%rcx,4), %ymm13
	vmovaps	-96(%rax), %ymm14
	vfmadd231ps	%ymm0, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm0) + ymm14
	vmovaps	%ymm14, -96(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm1   # ymm1 = (ymm13 * ymm14) + ymm1
	vmovaps	-64(%rax), %ymm14
	vfmadd231ps	%ymm8, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm8) + ymm14
	vmovaps	%ymm14, -64(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm2   # ymm2 = (ymm13 * ymm14) + ymm2
	vmovaps	-32(%rax), %ymm14
	vfmadd231ps	%ymm9, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm9) + ymm14
	vmovaps	%ymm14, -32(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm3   # ymm3 = (ymm13 * ymm14) + ymm3
	vfmadd213ps	(%rax), %ymm10, %ymm12  # ymm12 = (ymm10 * ymm12) + mem
	vmovaps	%ymm12, (%rax)
	vfmadd231ps	%ymm12, %ymm13, %ymm11  # ymm11 = (ymm13 * ymm12) + ymm11
	incq	%rcx
	addq	$256, %rax                      # imm = 0x100
	cmpq	$64, %rcx
	jne	.LBB5_29
# %bb.26:
	vmovaps	%ymm1, (%r9)
	vmovaps	%ymm2, 32(%r9)
	vmovaps	%ymm3, 64(%r9)
	vmovaps	%ymm11, 96(%r9)
	addq	$224, %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_27:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rdx,%rax,4), %ymm8
	vbroadcastss	(%r8,%rax,4), %ymm9
	vmovaps	-96(%rdi), %ymm10
	vfmadd231ps	%ymm4, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm4) + ymm10
	vmovaps	%ymm10, -96(%rdi)
	vfmadd231ps	%ymm10, %ymm9, %ymm0    # ymm0 = (ymm9 * ymm10) + ymm0
	vmovaps	-64(%rdi), %ymm10
	vfmadd231ps	%ymm5, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm5) + ymm10
	vmovaps	%ymm10, -64(%rdi)
	vfmadd231ps	%ymm10, %ymm9, %ymm1    # ymm1 = (ymm9 * ymm10) + ymm1
	vmovaps	-32(%rdi), %ymm10
	vfmadd231ps	%ymm6, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm6) + ymm10
	vmovaps	%ymm10, -32(%rdi)
	vfmadd231ps	%ymm10, %ymm9, %ymm2    # ymm2 = (ymm9 * ymm10) + ymm2
	vfmadd213ps	(%rdi), %ymm7, %ymm8    # ymm8 = (ymm7 * ymm8) + mem
	vmovaps	%ymm8, (%rdi)
	vfmadd231ps	%ymm8, %ymm9, %ymm3     # ymm3 = (ymm9 * ymm8) + ymm3
	incq	%rax
	addq	$256, %rdi                      # imm = 0x100
	cmpq	$64, %rax
	jne	.LBB5_27
	jmp	.LBB5_54
.LBB5_42:
	leaq	96(%rdi), %rax
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm11, %xmm11, %xmm11
	.p2align	4, 0x90
.LBB5_43:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rdx,%rcx,4), %ymm12
	vbroadcastss	(%r8,%rcx,4), %ymm13
	vmovaps	-96(%rax), %ymm14
	vfmadd231ps	%ymm0, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm0) + ymm14
	vmovaps	%ymm14, -96(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm1   # ymm1 = (ymm13 * ymm14) + ymm1
	vmovaps	-64(%rax), %ymm14
	vfmadd231ps	%ymm8, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm8) + ymm14
	vmovaps	%ymm14, -64(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm2   # ymm2 = (ymm13 * ymm14) + ymm2
	vmovaps	-32(%rax), %ymm14
	vfmadd231ps	%ymm9, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm9) + ymm14
	vmovaps	%ymm14, -32(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm3   # ymm3 = (ymm13 * ymm14) + ymm3
	vfmadd213ps	(%rax), %ymm10, %ymm12  # ymm12 = (ymm10 * ymm12) + mem
	vmovaps	%ymm12, (%rax)
	vfmadd231ps	%ymm12, %ymm13, %ymm11  # ymm11 = (ymm13 * ymm12) + ymm11
	incq	%rcx
	addq	$256, %rax                      # imm = 0x100
	cmpq	$64, %rcx
	jne	.LBB5_43
# %bb.40:
	vmovaps	%ymm1, (%r9)
	vmovaps	%ymm2, 32(%r9)
	vmovaps	%ymm3, 64(%r9)
	vmovaps	%ymm11, 96(%r9)
	addq	$224, %rdi
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_41:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rdx,%rax,4), %ymm8
	vbroadcastss	(%r8,%rax,4), %ymm9
	vmovaps	-96(%rdi), %ymm10
	vfmadd231ps	%ymm4, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm4) + ymm10
	vmovaps	%ymm10, -96(%rdi)
	vfmadd231ps	%ymm10, %ymm9, %ymm0    # ymm0 = (ymm9 * ymm10) + ymm0
	vmovaps	-64(%rdi), %ymm10
	vfmadd231ps	%ymm5, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm5) + ymm10
	vmovaps	%ymm10, -64(%rdi)
	vfmadd231ps	%ymm10, %ymm9, %ymm1    # ymm1 = (ymm9 * ymm10) + ymm1
	vmovaps	-32(%rdi), %ymm10
	vfmadd231ps	%ymm6, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm6) + ymm10
	vmovaps	%ymm10, -32(%rdi)
	vfmadd231ps	%ymm10, %ymm9, %ymm2    # ymm2 = (ymm9 * ymm10) + ymm2
	vfmadd213ps	(%rdi), %ymm7, %ymm8    # ymm8 = (ymm7 * ymm8) + mem
	vmovaps	%ymm8, (%rdi)
	vfmadd231ps	%ymm8, %ymm9, %ymm3     # ymm3 = (ymm9 * ymm8) + ymm3
	incq	%rax
	addq	$256, %rdi                      # imm = 0x100
	cmpq	$64, %rax
	jne	.LBB5_41
	jmp	.LBB5_54
.LBB5_57:
	leaq	96(%rdi), %rax
	addq	$64, %r10
	vxorps	%xmm1, %xmm1, %xmm1
	xorl	%ecx, %ecx
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm11, %xmm11, %xmm11
	.p2align	4, 0x90
.LBB5_58:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rdx,%rcx), %ymm12
	vbroadcastss	(%r8,%rcx), %ymm13
	prefetcht0	-64(%r10)
	prefetcht0	(%r10)
	vmovaps	-96(%rax), %ymm14
	vfmadd231ps	%ymm0, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm0) + ymm14
	vmovaps	%ymm14, -96(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm1   # ymm1 = (ymm13 * ymm14) + ymm1
	vmovaps	-64(%rax), %ymm14
	vfmadd231ps	%ymm8, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm8) + ymm14
	vmovaps	%ymm14, -64(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm2   # ymm2 = (ymm13 * ymm14) + ymm2
	vmovaps	-32(%rax), %ymm14
	vfmadd231ps	%ymm9, %ymm12, %ymm14   # ymm14 = (ymm12 * ymm9) + ymm14
	vmovaps	%ymm14, -32(%rax)
	vfmadd231ps	%ymm14, %ymm13, %ymm3   # ymm3 = (ymm13 * ymm14) + ymm3
	vfmadd213ps	(%rax), %ymm10, %ymm12  # ymm12 = (ymm10 * ymm12) + mem
	vmovaps	%ymm12, (%rax)
	vfmadd231ps	%ymm12, %ymm13, %ymm11  # ymm11 = (ymm13 * ymm12) + ymm11
	addq	$4, %rcx
	addq	$256, %rax                      # imm = 0x100
	subq	$-128, %r10
	cmpq	$256, %rcx                      # imm = 0x100
	jne	.LBB5_58
# %bb.55:
	vmovaps	%ymm1, (%r9)
	vmovaps	%ymm2, 32(%r9)
	vmovaps	%ymm3, 64(%r9)
	vmovaps	%ymm11, 96(%r9)
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_56:                               # =>This Inner Loop Header: Depth=1
	vbroadcastss	(%rdx,%rcx), %ymm8
	vbroadcastss	(%r8,%rcx), %ymm9
	prefetcht0	-64(%r10,%rax,2)
	prefetcht0	(%r10,%rax,2)
	vmovaps	128(%rdi,%rax,4), %ymm10
	vfmadd231ps	%ymm4, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm4) + ymm10
	vmovaps	%ymm10, 128(%rdi,%rax,4)
	vfmadd231ps	%ymm10, %ymm9, %ymm0    # ymm0 = (ymm9 * ymm10) + ymm0
	vmovaps	160(%rdi,%rax,4), %ymm10
	vfmadd231ps	%ymm5, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm5) + ymm10
	vmovaps	%ymm10, 160(%rdi,%rax,4)
	vfmadd231ps	%ymm10, %ymm9, %ymm1    # ymm1 = (ymm9 * ymm10) + ymm1
	vmovaps	192(%rdi,%rax,4), %ymm10
	vfmadd231ps	%ymm6, %ymm8, %ymm10    # ymm10 = (ymm8 * ymm6) + ymm10
	vmovaps	%ymm10, 192(%rdi,%rax,4)
	vfmadd231ps	%ymm10, %ymm9, %ymm2    # ymm2 = (ymm9 * ymm10) + ymm2
	vfmadd213ps	224(%rdi,%rax,4), %ymm7, %ymm8 # ymm8 = (ymm7 * ymm8) + mem
	vmovaps	%ymm8, 224(%rdi,%rax,4)
	vfmadd231ps	%ymm8, %ymm9, %ymm3     # ymm3 = (ymm9 * ymm8) + ymm3
	addq	$4, %rcx
	addq	$64, %rax
	cmpq	$256, %rcx                      # imm = 0x100
	jne	.LBB5_56
.LBB5_54:
	vmovaps	%ymm0, 128(%r9)
	vmovaps	%ymm1, 160(%r9)
	vmovaps	%ymm2, 192(%r9)
	vmovaps	%ymm3, 224(%r9)
	leaq	-8(%rbp), %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Lfunc_end5:
	.size	_ZN3fx23opt14kda_sweep_headEPfPKfS3_S3_fS3_S1_S3_NS0_8KdaSweepE, .Lfunc_end5-_ZN3fx23opt14kda_sweep_headEPfPKfS3_S3_fS3_S1_S3_NS0_8KdaSweepE
	.cfi_endproc
	.section	.rodata._ZN3fx23opt14kda_sweep_headEPfPKfS3_S3_fS3_S1_S3_NS0_8KdaSweepE,"a",@progbits
	.p2align	2, 0x0
.LJTI5_0:
	.long	.LBB5_2-.LJTI5_0
	.long	.LBB5_16-.LJTI5_0
	.long	.LBB5_30-.LJTI5_0
	.long	.LBB5_44-.LJTI5_0
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _ZN3fx23opt14kda_layer_stepERKNS0_10KdaWeightsERNS0_8KdaStateEPKfS7_S7_S7_S7_S7_PfPNS0_8KdaDebugEPNS0_10KdaProfileE
.LCPI6_0:
	.long	2147483648                      # 0x80000000
.LCPI6_1:
	.long	0x42b00000                      # float 88
.LCPI6_2:
	.long	0xc2aeac50                      # float -87.3365478
.LCPI6_3:
	.long	0x3f000000                      # float 0.5
.LCPI6_4:
	.long	0x3fb8aa3b                      # float 1.44269502
.LCPI6_5:
	.long	0xbf318000                      # float -0.693359375
.LCPI6_6:
	.long	0x395e8083                      # float 2.12194442E-4
.LCPI6_7:
	.long	0x3e2aaaaa                      # float 0.166666657
.LCPI6_8:
	.long	0x3d2aa9c1                      # float 0.0416657962
.LCPI6_9:
	.long	0x3c088908                      # float 0.00833345205
.LCPI6_10:
	.long	0x3ab743ce                      # float 0.00139819994
.LCPI6_11:
	.long	0x39506967                      # float 1.98756912E-4
.LCPI6_12:
	.long	0x3f800000                      # float 1
.LCPI6_13:
	.long	0x7fffffff                      # float NaN
.LCPI6_14:
	.long	0x3c800000                      # float 0.015625
.LCPI6_15:
	.long	0xbe800000                      # float -0.25
.LCPI6_16:
	.long	0x3e4ccccd                      # float 0.200000003
.LCPI6_17:
	.long	0x3eaaaaab                      # float 0.333333343
.LCPI6_18:
	.long	0xbf000000                      # float -0.5
.LCPI6_19:
	.long	0xbf800000                      # float -1
.LCPI6_20:
	.long	4294967170                      # 0xffffff82
.LCPI6_21:
	.long	8388607                         # 0x7fffff
.LCPI6_22:
	.long	0x3f3504f3                      # float 0.707106769
.LCPI6_23:
	.long	0x3eaaaaaa                      # float 0.333333313
.LCPI6_24:
	.long	0xbe7ffffc                      # float -0.24999994
.LCPI6_25:
	.long	0x3e4cceac                      # float 0.200007141
.LCPI6_26:
	.long	0xbe2aae50                      # float -0.166680574
.LCPI6_27:
	.long	0x3e11e9bf                      # float 0.142493233
.LCPI6_28:
	.long	0xbdfe5d4f                      # float -0.12420141
.LCPI6_29:
	.long	0x3def251a                      # float 0.116769984
.LCPI6_30:
	.long	0xbdebd1b8                      # float -0.115146101
.LCPI6_31:
	.long	0x3d9021bb                      # float 0.0703768358
.LCPI6_32:
	.long	0xb95e8083                      # float -2.12194442E-4
.LCPI6_33:
	.long	0x3f318000                      # float 0.693359375
.LCPI6_34:
	.long	0x41a00000                      # float 20
.LCPI6_35:
	.long	0xc2dc0000                      # float -110
.LCPI6_36:
	.long	0x358637bd                      # float 9.99999997E-7
.LCPI6_37:
	.long	0x3e000000                      # float 0.125
.LCPI6_38:
	.long	0x3727c5ac                      # float 9.99999974E-6
	.section	.text._ZN3fx23opt14kda_layer_stepERKNS0_10KdaWeightsERNS0_8KdaStateEPKfS7_S7_S7_S7_S7_PfPNS0_8KdaDebugEPNS0_10KdaProfileE,"ax",@progbits
	.globl	_ZN3fx23opt14kda_layer_stepERKNS0_10KdaWeightsERNS0_8KdaStateEPKfS7_S7_S7_S7_S7_PfPNS0_8KdaDebugEPNS0_10KdaProfileE
	.p2align	4, 0x90
	.type	_ZN3fx23opt14kda_layer_stepERKNS0_10KdaWeightsERNS0_8KdaStateEPKfS7_S7_S7_S7_S7_PfPNS0_8KdaDebugEPNS0_10KdaProfileE,@function
_ZN3fx23opt14kda_layer_stepERKNS0_10KdaWeightsERNS0_8KdaStateEPKfS7_S7_S7_S7_S7_PfPNS0_8KdaDebugEPNS0_10KdaProfileE: # @_ZN3fx23opt14kda_layer_stepERKNS0_10KdaWeightsERNS0_8KdaStateEPKfS7_S7_S7_S7_S7_PfPNS0_8KdaDebugEPNS0_10KdaProfileE
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-64, %rsp
	subq	$11264, %rsp                    # imm = 0x2C00
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r10
	movq	%rdi, (%rsp)                    # 8-byte Spill
	cmpq	$0, 48(%rbp)
	movq	%r9, 32(%rsp)                   # 8-byte Spill
	je	.LBB6_1
# %bb.2:
	#APP
hutblk_0_start:
	lfence
	rdtsc
hutblk_0_end:
	#NO_APP
                                        # kill: def $edx killed $edx def $rdx
	negl	%edx
	shlq	$32, %rdx
	movl	%eax, %eax
	subq	%rax, %rdx
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	jmp	.LBB6_3
.LBB6_1:
	xorl	%eax, %eax
	movq	%rax, 16(%rsp)                  # 8-byte Spill
.LBB6_3:
	movl	_ZN3fx23opt12_GLOBAL__N_19g_pf_modeE(%rip), %r14d
	leal	-5(%r14), %eax
	xorl	%edx, %edx
	cmpl	$2, %eax
	movl	$49152, %edi                    # imm = 0xC000
	cmovaeq	%rdx, %rdi
	movl	58368(%rsi), %ebx
	movl	%ebx, %r12d
	andl	$3, %r12d
	leal	1(%rbx), %eax
	andl	$3, %eax
	leal	2(%rbx), %edx
	andl	$3, %edx
	decl	%ebx
	andl	$3, %ebx
	leaq	(%rax,%rax,2), %rax
	shlq	$8, %rax
	movq	%rax, 128(%rsp)                 # 8-byte Spill
	leaq	(%rsi,%rax), %r13
	addq	$49152, %r13                    # imm = 0xC000
	leaq	(%rdx,%rdx,2), %rax
	shlq	$8, %rax
	movq	%rax, 64(%rsp)                  # 8-byte Spill
	leaq	(%rsi,%rax), %r11
	addq	$49152, %r11                    # imm = 0xC000
	leaq	(%rbx,%rbx,2), %rdx
	shlq	$8, %rdx
	leaq	(%rsi,%rdx), %rbx
	addq	$49152, %rbx                    # imm = 0xC000
	leaq	(%r12,%r12,2), %r12
	shlq	$8, %r12
	movq	%rsi, 24(%rsp)                  # 8-byte Spill
	leaq	(%rsi,%r12), %r15
	addq	$49152, %r15                    # imm = 0xC000
	movq	(%rsp), %rsi                    # 8-byte Reload
	movq	(%rsi), %rax
	movq	$-8, %r9
	.p2align	4, 0x90
.LBB6_4:                                # =>This Inner Loop Header: Depth=1
	vmovups	32(%r10,%r9,4), %ymm0
	vmovaps	%ymm0, 32(%r15,%r9,4)
	vmovups	32(%rax,%r9,4), %ymm1
	vmulps	32(%r13,%r9,4), %ymm1, %ymm1
	vmovups	800(%rax,%r9,4), %ymm2
	vfmadd132ps	32(%r11,%r9,4), %ymm1, %ymm2 # ymm2 = (ymm2 * mem) + ymm1
	vmovups	1568(%rax,%r9,4), %ymm1
	vfmadd132ps	32(%rbx,%r9,4), %ymm2, %ymm1 # ymm1 = (ymm1 * mem) + ymm2
	vfmadd231ps	2336(%rax,%r9,4), %ymm0, %ymm1 # ymm1 = (ymm0 * mem) + ymm1
	vmovaps	%ymm1, 8160(%rsp,%r9,4)
	addq	$8, %r9
	cmpq	$184, %r9
	jb	.LBB6_4
# %bb.5:
	movq	24(%rsp), %rax                  # 8-byte Reload
	movq	128(%rsp), %r13                 # 8-byte Reload
	leaq	(%rax,%r13), %r10
	addq	$52224, %r10                    # imm = 0xCC00
	movq	64(%rsp), %r9                   # 8-byte Reload
	leaq	52224(%rax,%r9), %r11
	leaq	(%rax,%rdx), %rbx
	addq	$52224, %rbx                    # imm = 0xCC00
	addq	%r12, %rax
	addq	$52224, %rax                    # imm = 0xCC00
	movq	8(%rsi), %r15
	movq	$-8, %r9
	.p2align	4, 0x90
.LBB6_6:                                # =>This Inner Loop Header: Depth=1
	vmovups	32(%rcx,%r9,4), %ymm0
	vmovaps	%ymm0, 32(%rax,%r9,4)
	vmovups	32(%r15,%r9,4), %ymm1
	vmulps	32(%r10,%r9,4), %ymm1, %ymm1
	vmovups	800(%r15,%r9,4), %ymm2
	vfmadd132ps	32(%r11,%r9,4), %ymm1, %ymm2 # ymm2 = (ymm2 * mem) + ymm1
	vmovups	1568(%r15,%r9,4), %ymm1
	vfmadd132ps	32(%rbx,%r9,4), %ymm2, %ymm1 # ymm1 = (ymm1 * mem) + ymm2
	vfmadd231ps	2336(%r15,%r9,4), %ymm0, %ymm1 # ymm1 = (ymm0 * mem) + ymm1
	vmovaps	%ymm1, 8928(%rsp,%r9,4)
	addq	$8, %r9
	cmpq	$184, %r9
	jb	.LBB6_6
# %bb.7:
	movq	24(%rsp), %rbx                  # 8-byte Reload
	leaq	(%rbx,%r13), %rax
	addq	$55296, %rax                    # imm = 0xD800
	movq	64(%rsp), %rcx                  # 8-byte Reload
	leaq	55296(%rbx,%rcx), %rcx
	addq	%rbx, %rdx
	addq	$55296, %rdx                    # imm = 0xD800
	leaq	(%rbx,%r12), %r9
	addq	$55296, %r9                     # imm = 0xD800
	movq	16(%rsi), %r10
	movq	$-8, %r11
	.p2align	4, 0x90
.LBB6_8:                                # =>This Inner Loop Header: Depth=1
	vmovups	32(%r8,%r11,4), %ymm0
	vmovaps	%ymm0, 32(%r9,%r11,4)
	vmovups	32(%r10,%r11,4), %ymm1
	vmulps	32(%rax,%r11,4), %ymm1, %ymm1
	vmovups	800(%r10,%r11,4), %ymm2
	vfmadd132ps	32(%rcx,%r11,4), %ymm1, %ymm2 # ymm2 = (ymm2 * mem) + ymm1
	vmovups	1568(%r10,%r11,4), %ymm1
	vfmadd132ps	32(%rdx,%r11,4), %ymm2, %ymm1 # ymm1 = (ymm1 * mem) + ymm2
	vfmadd231ps	2336(%r10,%r11,4), %ymm0, %ymm1 # ymm1 = (ymm0 * mem) + ymm1
	vmovaps	%ymm1, 9696(%rsp,%r11,4)
	addq	$8, %r11
	cmpq	$184, %r11
	jb	.LBB6_8
# %bb.9:
	addq	%rbx, %rdi
	vbroadcastss	.LCPI6_0(%rip), %ymm6   # ymm6 = [2147483648,2147483648,2147483648,2147483648,2147483648,2147483648,2147483648,2147483648]
	movq	$-8, %rax
	vbroadcastss	.LCPI6_1(%rip), %ymm7   # ymm7 = [8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1]
	vbroadcastss	.LCPI6_2(%rip), %ymm8   # ymm8 = [-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1]
	vbroadcastss	.LCPI6_3(%rip), %ymm9   # ymm9 = [5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1]
	vbroadcastss	.LCPI6_4(%rip), %ymm10  # ymm10 = [1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0]
	vbroadcastss	.LCPI6_5(%rip), %ymm11  # ymm11 = [-6.93359375E-1,-6.93359375E-1,-6.93359375E-1,-6.93359375E-1,-6.93359375E-1,-6.93359375E-1,-6.93359375E-1,-6.93359375E-1]
	vbroadcastss	.LCPI6_6(%rip), %ymm12  # ymm12 = [2.12194442E-4,2.12194442E-4,2.12194442E-4,2.12194442E-4,2.12194442E-4,2.12194442E-4,2.12194442E-4,2.12194442E-4]
	vbroadcastss	.LCPI6_7(%rip), %ymm13  # ymm13 = [1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1]
	vbroadcastss	.LCPI6_8(%rip), %ymm14  # ymm14 = [4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2]
	vbroadcastss	.LCPI6_9(%rip), %ymm0   # ymm0 = [8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3]
	vmovaps	%ymm0, 160(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_10(%rip), %ymm0  # ymm0 = [1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3]
	vmovaps	%ymm0, 512(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_11(%rip), %ymm0  # ymm0 = [1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4]
	vmovaps	%ymm0, 480(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_12(%rip), %ymm15 # ymm15 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vbroadcastss	.LCPI6_12(%rip), %ymm0  # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vmovaps	%ymm0, 128(%rsp)                # 32-byte Spill
	movq	%rbx, %rcx
	movq	48(%rbp), %r15
	movq	32(%rsp), %r11                  # 8-byte Reload
	jmp	.LBB6_10
	.p2align	4, 0x90
.LBB6_11:                               #   in Loop: Header=BB6_10 Depth=1
	vmovaps	160(%rsp), %ymm5                # 32-byte Reload
.LBB6_30:                               #   in Loop: Header=BB6_10 Depth=1
	vxorps	8160(%rsp,%rax,4), %ymm6, %ymm0
	vminps	%ymm7, %ymm0, %ymm0
	vmaxps	%ymm8, %ymm0, %ymm0
	vmovaps	%ymm10, %ymm1
	vfmadd213ps	%ymm9, %ymm0, %ymm1     # ymm1 = (ymm0 * ymm1) + ymm9
	vroundps	$1, %ymm1, %ymm1
	vfmadd231ps	%ymm11, %ymm1, %ymm0    # ymm0 = (ymm1 * ymm11) + ymm0
	vfmadd231ps	%ymm12, %ymm1, %ymm0    # ymm0 = (ymm1 * ymm12) + ymm0
	vmulps	%ymm0, %ymm0, %ymm2
	vmulps	%ymm2, %ymm2, %ymm3
	vmovaps	%ymm13, %ymm4
	vfmadd213ps	%ymm9, %ymm0, %ymm4     # ymm4 = (ymm0 * ymm4) + ymm9
	vfmadd213ps	%ymm14, %ymm0, %ymm5    # ymm5 = (ymm0 * ymm5) + ymm14
	vfmadd213ps	%ymm4, %ymm2, %ymm5     # ymm5 = (ymm2 * ymm5) + ymm4
	vmovaps	480(%rsp), %ymm4                # 32-byte Reload
	vfmadd213ps	512(%rsp), %ymm0, %ymm4 # 32-byte Folded Reload
                                        # ymm4 = (ymm0 * ymm4) + mem
	vfmadd231ps	%ymm4, %ymm3, %ymm5     # ymm5 = (ymm3 * ymm4) + ymm5
	vfmadd213ps	%ymm0, %ymm2, %ymm5     # ymm5 = (ymm2 * ymm5) + ymm0
	vaddps	%ymm5, %ymm15, %ymm0
	vcvtps2dq	%ymm1, %ymm1
	vpslld	$23, %ymm1, %ymm1
	vpaddd	128(%rsp), %ymm1, %ymm1         # 32-byte Folded Reload
	vmulps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, 5088(%rsp,%rax,4)
	addq	$8, %rax
	cmpq	$568, %rax                      # imm = 0x238
	jae	.LBB6_12
.LBB6_10:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_11
# %bb.26:                               #   in Loop: Header=BB6_10 Depth=1
	leaq	64(%rcx), %r9
	leaq	128(%rcx), %r8
	leaq	192(%rcx), %rdx
	cmpl	$6, %r14d
	vmovaps	160(%rsp), %ymm5                # 32-byte Reload
	jne	.LBB6_28
# %bb.27:                               #   in Loop: Header=BB6_10 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	(%r9)
	prefetcht1	(%r8)
	prefetcht1	(%rdx)
	jmp	.LBB6_29
	.p2align	4, 0x90
.LBB6_28:                               #   in Loop: Header=BB6_10 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	(%r9)
	prefetcht0	(%r8)
	prefetcht0	(%rdx)
.LBB6_29:                               #   in Loop: Header=BB6_10 Depth=1
	addq	$256, %rcx                      # imm = 0x100
	jmp	.LBB6_30
.LBB6_12:
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%ymm0, 1184(%rsp)
	vmovaps	%ymm0, 1152(%rsp)
	vmovaps	%ymm0, 1120(%rsp)
	vmovaps	%ymm0, 1024(%rsp)
	vmovaps	%ymm0, 1056(%rsp)
	vmovaps	%ymm0, 1088(%rsp)
	xorl	%eax, %eax
	cmpl	$6, %r14d
	je	.LBB6_31
	jmp	.LBB6_13
	.p2align	4, 0x90
.LBB6_33:                               #   in Loop: Header=BB6_31 Depth=1
	vaddps	5056(%rsp,%rax,4), %ymm15, %ymm0
	vmovaps	8128(%rsp,%rax,4), %ymm1
	vdivps	%ymm0, %ymm1, %ymm0
	vmovaps	%ymm0, 4288(%rsp,%rax,4)
	movl	%eax, %edx
	shrl	$6, %edx
	shlq	$5, %rdx
	vfmadd213ps	1120(%rsp,%rdx), %ymm0, %ymm0 # ymm0 = (ymm0 * ymm0) + mem
	vmovaps	%ymm0, 1120(%rsp,%rdx)
	leaq	8(%rax), %rdx
	cmpq	$184, %rax
	movq	%rdx, %rax
	jae	.LBB6_34
.LBB6_31:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_33
# %bb.32:                               #   in Loop: Header=BB6_31 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	64(%rcx)
	prefetcht1	128(%rcx)
	addq	$192, %rcx
	jmp	.LBB6_33
	.p2align	4, 0x90
.LBB6_15:                               #   in Loop: Header=BB6_13 Depth=1
	vaddps	5056(%rsp,%rax,4), %ymm15, %ymm0
	vmovaps	8128(%rsp,%rax,4), %ymm1
	vdivps	%ymm0, %ymm1, %ymm0
	vmovaps	%ymm0, 4288(%rsp,%rax,4)
	movl	%eax, %edx
	shrl	$6, %edx
	shlq	$5, %rdx
	vfmadd213ps	1120(%rsp,%rdx), %ymm0, %ymm0 # ymm0 = (ymm0 * ymm0) + mem
	vmovaps	%ymm0, 1120(%rsp,%rdx)
	leaq	8(%rax), %rdx
	cmpq	$184, %rax
	movq	%rdx, %rax
	jae	.LBB6_16
.LBB6_13:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_15
# %bb.14:                               #   in Loop: Header=BB6_13 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	addq	$192, %rcx
	jmp	.LBB6_15
.LBB6_34:
	xorl	%eax, %eax
	jmp	.LBB6_35
	.p2align	4, 0x90
.LBB6_37:                               #   in Loop: Header=BB6_35 Depth=1
	vaddps	5824(%rsp,%rax,4), %ymm15, %ymm0
	vmovaps	8896(%rsp,%rax,4), %ymm1
	vdivps	%ymm0, %ymm1, %ymm0
	vmovaps	%ymm0, 3520(%rsp,%rax,4)
	movl	%eax, %edx
	shrl	$6, %edx
	shlq	$5, %rdx
	vfmadd213ps	1024(%rsp,%rdx), %ymm0, %ymm0 # ymm0 = (ymm0 * ymm0) + mem
	vmovaps	%ymm0, 1024(%rsp,%rdx)
	leaq	8(%rax), %rdx
	cmpq	$184, %rax
	movq	%rdx, %rax
	jae	.LBB6_38
.LBB6_35:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_37
# %bb.36:                               #   in Loop: Header=BB6_35 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	64(%rcx)
	prefetcht1	128(%rcx)
	addq	$192, %rcx
	jmp	.LBB6_37
.LBB6_16:
	xorl	%eax, %eax
	jmp	.LBB6_17
	.p2align	4, 0x90
.LBB6_19:                               #   in Loop: Header=BB6_17 Depth=1
	vaddps	5824(%rsp,%rax,4), %ymm15, %ymm0
	vmovaps	8896(%rsp,%rax,4), %ymm1
	vdivps	%ymm0, %ymm1, %ymm0
	vmovaps	%ymm0, 3520(%rsp,%rax,4)
	movl	%eax, %edx
	shrl	$6, %edx
	shlq	$5, %rdx
	vfmadd213ps	1024(%rsp,%rdx), %ymm0, %ymm0 # ymm0 = (ymm0 * ymm0) + mem
	vmovaps	%ymm0, 1024(%rsp,%rdx)
	leaq	8(%rax), %rdx
	cmpq	$184, %rax
	movq	%rdx, %rax
	jae	.LBB6_20
.LBB6_17:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_19
# %bb.18:                               #   in Loop: Header=BB6_17 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	addq	$192, %rcx
	jmp	.LBB6_19
.LBB6_38:
	movq	$-8, %rax
	jmp	.LBB6_39
	.p2align	4, 0x90
.LBB6_43:                               #   in Loop: Header=BB6_39 Depth=1
	vaddps	6656(%rsp,%rax,4), %ymm15, %ymm0
	vmovaps	9728(%rsp,%rax,4), %ymm1
	vdivps	%ymm0, %ymm1, %ymm0
	vmovaps	%ymm0, 7424(%rsp,%rax,4)
	addq	$16, %rax
	cmpq	$184, %rax
	jae	.LBB6_44
.LBB6_39:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_41
# %bb.40:                               #   in Loop: Header=BB6_39 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	64(%rcx)
	prefetcht1	128(%rcx)
	addq	$192, %rcx
.LBB6_41:                               #   in Loop: Header=BB6_39 Depth=1
	vaddps	6624(%rsp,%rax,4), %ymm15, %ymm0
	vmovaps	9696(%rsp,%rax,4), %ymm1
	vdivps	%ymm0, %ymm1, %ymm0
	vmovaps	%ymm0, 7392(%rsp,%rax,4)
	cmpq	%rdi, %rcx
	jae	.LBB6_43
# %bb.42:                               #   in Loop: Header=BB6_39 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	64(%rcx)
	prefetcht1	128(%rcx)
	addq	$192, %rcx
	jmp	.LBB6_43
.LBB6_20:
	movq	$-8, %rax
	jmp	.LBB6_21
	.p2align	4, 0x90
.LBB6_25:                               #   in Loop: Header=BB6_21 Depth=1
	vaddps	6656(%rsp,%rax,4), %ymm15, %ymm0
	vmovaps	9728(%rsp,%rax,4), %ymm1
	vdivps	%ymm0, %ymm1, %ymm0
	vmovaps	%ymm0, 7424(%rsp,%rax,4)
	addq	$16, %rax
	cmpq	$184, %rax
	jae	.LBB6_44
.LBB6_21:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_23
# %bb.22:                               #   in Loop: Header=BB6_21 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	addq	$192, %rcx
.LBB6_23:                               #   in Loop: Header=BB6_21 Depth=1
	vaddps	6624(%rsp,%rax,4), %ymm15, %ymm0
	vmovaps	9696(%rsp,%rax,4), %ymm1
	vdivps	%ymm0, %ymm1, %ymm0
	vmovaps	%ymm0, 7392(%rsp,%rax,4)
	cmpq	%rdi, %rcx
	jae	.LBB6_25
# %bb.24:                               #   in Loop: Header=BB6_21 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	prefetcht0	128(%rcx)
	addq	$192, %rcx
	jmp	.LBB6_25
.LBB6_44:
	testq	%r15, %r15
	je	.LBB6_45
# %bb.46:
	#APP
hutblk_1_start:
	lfence
	rdtsc
hutblk_1_end:
	#NO_APP
                                        # kill: def $edx killed $edx def $rdx
	shlq	$32, %rdx
	movl	%eax, %eax
	orq	%rdx, %rax
	jmp	.LBB6_47
.LBB6_45:
	xorl	%eax, %eax
.LBB6_47:
	movq	%rax, 8(%rsp)                   # 8-byte Spill
	vmovaps	%ymm6, 992(%rsp)                # 32-byte Spill
	movq	24(%rsi), %rax
	movq	$-8, %rdx
	jmp	.LBB6_48
	.p2align	4, 0x90
.LBB6_51:                               #   in Loop: Header=BB6_48 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	(%r10)
	prefetcht0	(%r9)
	prefetcht0	(%r8)
.LBB6_52:                               #   in Loop: Header=BB6_48 Depth=1
	addq	$256, %rcx                      # imm = 0x100
.LBB6_53:                               #   in Loop: Header=BB6_48 Depth=1
	vmovups	32(%r11,%rdx,4), %ymm0
	vaddps	32(%rax,%rdx,4), %ymm0, %ymm0
	vminps	%ymm7, %ymm0, %ymm1
	vmaxps	%ymm8, %ymm1, %ymm1
	vmovaps	%ymm10, %ymm2
	vfmadd213ps	%ymm9, %ymm1, %ymm2     # ymm2 = (ymm1 * ymm2) + ymm9
	vroundps	$1, %ymm2, %ymm2
	vfmadd231ps	%ymm11, %ymm2, %ymm1    # ymm1 = (ymm2 * ymm11) + ymm1
	vfmadd231ps	%ymm12, %ymm2, %ymm1    # ymm1 = (ymm2 * ymm12) + ymm1
	vmulps	%ymm1, %ymm1, %ymm3
	vmulps	%ymm3, %ymm3, %ymm4
	vmovaps	%ymm13, %ymm5
	vfmadd213ps	%ymm9, %ymm1, %ymm5     # ymm5 = (ymm1 * ymm5) + ymm9
	vmovaps	160(%rsp), %ymm6                # 32-byte Reload
	vfmadd213ps	%ymm14, %ymm1, %ymm6    # ymm6 = (ymm1 * ymm6) + ymm14
	vfmadd213ps	%ymm5, %ymm3, %ymm6     # ymm6 = (ymm3 * ymm6) + ymm5
	vmovaps	480(%rsp), %ymm5                # 32-byte Reload
	vfmadd213ps	512(%rsp), %ymm1, %ymm5 # 32-byte Folded Reload
                                        # ymm5 = (ymm1 * ymm5) + mem
	vfmadd231ps	%ymm5, %ymm4, %ymm6     # ymm6 = (ymm4 * ymm5) + ymm6
	vfmadd213ps	%ymm1, %ymm3, %ymm6     # ymm6 = (ymm3 * ymm6) + ymm1
	vmovaps	%ymm0, 8160(%rsp,%rdx,4)
	vaddps	%ymm6, %ymm15, %ymm0
	vcvtps2dq	%ymm2, %ymm1
	vpslld	$23, %ymm1, %ymm1
	vpaddd	128(%rsp), %ymm1, %ymm1         # 32-byte Folded Reload
	vmulps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, 5088(%rsp,%rdx,4)
	addq	$8, %rdx
	cmpq	$184, %rdx
	jae	.LBB6_54
.LBB6_48:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_53
# %bb.49:                               #   in Loop: Header=BB6_48 Depth=1
	leaq	64(%rcx), %r10
	leaq	128(%rcx), %r9
	leaq	192(%rcx), %r8
	cmpl	$6, %r14d
	jne	.LBB6_51
# %bb.50:                               #   in Loop: Header=BB6_48 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	(%r10)
	prefetcht1	(%r9)
	prefetcht1	(%r8)
	jmp	.LBB6_52
.LBB6_54:
	vmovaps	%ymm8, 736(%rsp)                # 32-byte Spill
	vmovaps	%ymm7, 960(%rsp)                # 32-byte Spill
	vbroadcastss	40(%rsi), %ymm0
	vmovaps	%ymm0, 192(%rsp)                # 32-byte Spill
	movq	$-8, %rax
	vbroadcastss	.LCPI6_13(%rip), %ymm0  # ymm0 = [NaN,NaN,NaN,NaN,NaN,NaN,NaN,NaN]
	vmovaps	%ymm0, 32(%rsp)                 # 32-byte Spill
	vbroadcastss	.LCPI6_14(%rip), %ymm0  # ymm0 = [1.5625E-2,1.5625E-2,1.5625E-2,1.5625E-2,1.5625E-2,1.5625E-2,1.5625E-2,1.5625E-2]
	vmovaps	%ymm0, 96(%rsp)                 # 32-byte Spill
	vbroadcastss	.LCPI6_15(%rip), %ymm0  # ymm0 = [-2.5E-1,-2.5E-1,-2.5E-1,-2.5E-1,-2.5E-1,-2.5E-1,-2.5E-1,-2.5E-1]
	vmovaps	%ymm0, 448(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_16(%rip), %ymm0  # ymm0 = [2.00000003E-1,2.00000003E-1,2.00000003E-1,2.00000003E-1,2.00000003E-1,2.00000003E-1,2.00000003E-1,2.00000003E-1]
	vmovaps	%ymm0, 416(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_17(%rip), %ymm0  # ymm0 = [3.33333343E-1,3.33333343E-1,3.33333343E-1,3.33333343E-1,3.33333343E-1,3.33333343E-1,3.33333343E-1,3.33333343E-1]
	vmovaps	%ymm0, 384(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_18(%rip), %ymm6  # ymm6 = [-5.0E-1,-5.0E-1,-5.0E-1,-5.0E-1,-5.0E-1,-5.0E-1,-5.0E-1,-5.0E-1]
	vbroadcastss	.LCPI6_20(%rip), %ymm0  # ymm0 = [4294967170,4294967170,4294967170,4294967170,4294967170,4294967170,4294967170,4294967170]
	vmovaps	%ymm0, 352(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_21(%rip), %ymm0  # ymm0 = [8388607,8388607,8388607,8388607,8388607,8388607,8388607,8388607]
	vmovaps	%ymm0, 320(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_19(%rip), %ymm0  # ymm0 = [-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0,-1.0E+0]
	vbroadcastss	.LCPI6_3(%rip), %ymm1   # ymm1 = [5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1]
	vmovaps	%ymm1, 288(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_22(%rip), %ymm1  # ymm1 = [7.07106769E-1,7.07106769E-1,7.07106769E-1,7.07106769E-1,7.07106769E-1,7.07106769E-1,7.07106769E-1,7.07106769E-1]
	vmovaps	%ymm1, 256(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_23(%rip), %ymm1  # ymm1 = [3.33333313E-1,3.33333313E-1,3.33333313E-1,3.33333313E-1,3.33333313E-1,3.33333313E-1,3.33333313E-1,3.33333313E-1]
	vmovaps	%ymm1, 224(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_24(%rip), %ymm1  # ymm1 = [-2.4999994E-1,-2.4999994E-1,-2.4999994E-1,-2.4999994E-1,-2.4999994E-1,-2.4999994E-1,-2.4999994E-1,-2.4999994E-1]
	vmovaps	%ymm1, 704(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_25(%rip), %ymm1  # ymm1 = [2.00007141E-1,2.00007141E-1,2.00007141E-1,2.00007141E-1,2.00007141E-1,2.00007141E-1,2.00007141E-1,2.00007141E-1]
	vmovaps	%ymm1, 672(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_26(%rip), %ymm1  # ymm1 = [-1.66680574E-1,-1.66680574E-1,-1.66680574E-1,-1.66680574E-1,-1.66680574E-1,-1.66680574E-1,-1.66680574E-1,-1.66680574E-1]
	vmovaps	%ymm1, 640(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_27(%rip), %ymm1  # ymm1 = [1.42493233E-1,1.42493233E-1,1.42493233E-1,1.42493233E-1,1.42493233E-1,1.42493233E-1,1.42493233E-1,1.42493233E-1]
	vmovaps	%ymm1, 608(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_28(%rip), %ymm5  # ymm5 = [-1.2420141E-1,-1.2420141E-1,-1.2420141E-1,-1.2420141E-1,-1.2420141E-1,-1.2420141E-1,-1.2420141E-1,-1.2420141E-1]
	vbroadcastss	.LCPI6_29(%rip), %ymm1  # ymm1 = [1.16769984E-1,1.16769984E-1,1.16769984E-1,1.16769984E-1,1.16769984E-1,1.16769984E-1,1.16769984E-1,1.16769984E-1]
	vmovaps	%ymm1, 576(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_30(%rip), %ymm3  # ymm3 = [-1.15146101E-1,-1.15146101E-1,-1.15146101E-1,-1.15146101E-1,-1.15146101E-1,-1.15146101E-1,-1.15146101E-1,-1.15146101E-1]
	vbroadcastss	.LCPI6_31(%rip), %ymm1  # ymm1 = [7.03768358E-2,7.03768358E-2,7.03768358E-2,7.03768358E-2,7.03768358E-2,7.03768358E-2,7.03768358E-2,7.03768358E-2]
	vmovaps	%ymm1, 544(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI6_32(%rip), %ymm4  # ymm4 = [-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4]
	vbroadcastss	.LCPI6_33(%rip), %ymm7  # ymm7 = [6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1]
	vbroadcastss	.LCPI6_34(%rip), %ymm8  # ymm8 = [2.0E+1,2.0E+1,2.0E+1,2.0E+1,2.0E+1,2.0E+1,2.0E+1,2.0E+1]
	vmovaps	%ymm9, 928(%rsp)                # 32-byte Spill
	vmovaps	%ymm10, 896(%rsp)               # 32-byte Spill
	vmovaps	%ymm11, 864(%rsp)               # 32-byte Spill
	vmovaps	%ymm12, 832(%rsp)               # 32-byte Spill
	vmovaps	%ymm13, 800(%rsp)               # 32-byte Spill
	vmovaps	%ymm14, 768(%rsp)               # 32-byte Spill
	vmovaps	%ymm15, 64(%rsp)                # 32-byte Spill
	jmp	.LBB6_55
	.p2align	4, 0x90
.LBB6_76:                               #   in Loop: Header=BB6_55 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	(%rdx)
.LBB6_77:                               #   in Loop: Header=BB6_55 Depth=1
	subq	$-128, %rcx
.LBB6_78:                               #   in Loop: Header=BB6_55 Depth=1
	vmovaps	5088(%rsp,%rax,4), %ymm9
	vmovaps	416(%rsp), %ymm1                # 32-byte Reload
	vfmadd213ps	448(%rsp), %ymm9, %ymm1 # 32-byte Folded Reload
                                        # ymm1 = (ymm9 * ymm1) + mem
	vfmadd213ps	384(%rsp), %ymm9, %ymm1 # 32-byte Folded Reload
                                        # ymm1 = (ymm9 * ymm1) + mem
	vfmadd213ps	%ymm6, %ymm9, %ymm1     # ymm1 = (ymm9 * ymm1) + ymm6
	vmulps	%ymm9, %ymm9, %ymm10
	vfmadd213ps	%ymm9, %ymm1, %ymm10    # ymm10 = (ymm1 * ymm10) + ymm9
	vaddps	%ymm15, %ymm9, %ymm11
	vandps	320(%rsp), %ymm11, %ymm1        # 32-byte Folded Reload
	vorps	288(%rsp), %ymm1, %ymm1         # 32-byte Folded Reload
	vcmpltps	256(%rsp), %ymm1, %ymm2         # 32-byte Folded Reload
	vandps	%ymm1, %ymm2, %ymm12
	vaddps	%ymm1, %ymm12, %ymm1
	vaddps	%ymm0, %ymm1, %ymm1
	vmulps	%ymm1, %ymm1, %ymm12
	vmovaps	704(%rsp), %ymm13               # 32-byte Reload
	vfmadd213ps	224(%rsp), %ymm1, %ymm13 # 32-byte Folded Reload
                                        # ymm13 = (ymm1 * ymm13) + mem
	vmovaps	640(%rsp), %ymm14               # 32-byte Reload
	vfmadd213ps	672(%rsp), %ymm1, %ymm14 # 32-byte Folded Reload
                                        # ymm14 = (ymm1 * ymm14) + mem
	vmovaps	%ymm5, %ymm15
	vfmadd213ps	608(%rsp), %ymm1, %ymm15 # 32-byte Folded Reload
                                        # ymm15 = (ymm1 * ymm15) + mem
	vfmadd213ps	%ymm13, %ymm12, %ymm14  # ymm14 = (ymm12 * ymm14) + ymm13
	vmovaps	%ymm3, %ymm13
	vfmadd213ps	576(%rsp), %ymm1, %ymm13 # 32-byte Folded Reload
                                        # ymm13 = (ymm1 * ymm13) + mem
	vfmadd231ps	544(%rsp), %ymm12, %ymm13 # 32-byte Folded Reload
                                        # ymm13 = (ymm12 * mem) + ymm13
	vfmadd213ps	%ymm15, %ymm12, %ymm13  # ymm13 = (ymm12 * ymm13) + ymm15
	vmulps	%ymm12, %ymm12, %ymm15
	vfmadd213ps	%ymm14, %ymm15, %ymm13  # ymm13 = (ymm15 * ymm13) + ymm14
	vaddps	%ymm0, %ymm11, %ymm14
	vsubps	%ymm14, %ymm9, %ymm15
	vdivps	%ymm14, %ymm15, %ymm14
	vmovaps	64(%rsp), %ymm15                # 32-byte Reload
	vpsrld	$23, %ymm11, %ymm11
	vpaddd	352(%rsp), %ymm11, %ymm11       # 32-byte Folded Reload
	vcvtdq2ps	%ymm11, %ymm11
	vandps	%ymm2, %ymm15, %ymm2
	vsubps	%ymm2, %ymm11, %ymm2
	vmulps	%ymm1, %ymm12, %ymm11
	vmulps	%ymm13, %ymm11, %ymm11
	vfmadd231ps	%ymm4, %ymm2, %ymm11    # ymm11 = (ymm2 * ymm4) + ymm11
	vfmadd231ps	%ymm12, %ymm6, %ymm11   # ymm11 = (ymm6 * ymm12) + ymm11
	vaddps	%ymm1, %ymm11, %ymm1
	vfmadd231ps	%ymm2, %ymm7, %ymm1     # ymm1 = (ymm7 * ymm2) + ymm1
	vfmadd231ps	%ymm1, %ymm14, %ymm1    # ymm1 = (ymm14 * ymm1) + ymm1
	vandps	32(%rsp), %ymm9, %ymm2          # 32-byte Folded Reload
	vcmpltps	96(%rsp), %ymm2, %ymm2          # 32-byte Folded Reload
	vblendvps	%ymm2, %ymm10, %ymm1, %ymm1
	vmovaps	8160(%rsp,%rax,4), %ymm2
	vcmpltps	%ymm2, %ymm8, %ymm9
	vblendvps	%ymm9, %ymm2, %ymm1, %ymm1
	vmulps	192(%rsp), %ymm1, %ymm1         # 32-byte Folded Reload
	vmovaps	%ymm1, 8160(%rsp,%rax,4)
	addq	$8, %rax
	cmpq	$56, %rax
	jae	.LBB6_58
.LBB6_55:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_78
# %bb.56:                               #   in Loop: Header=BB6_55 Depth=1
	leaq	64(%rcx), %rdx
	cmpl	$6, %r14d
	jne	.LBB6_76
# %bb.57:                               #   in Loop: Header=BB6_55 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	(%rdx)
	jmp	.LBB6_77
.LBB6_58:
	vbroadcastss	44(%rsi), %ymm1
	vmovaps	%ymm1, 192(%rsp)                # 32-byte Spill
	movl	$56, %eax
	jmp	.LBB6_59
	.p2align	4, 0x90
.LBB6_62:                               #   in Loop: Header=BB6_59 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	(%rdx)
.LBB6_63:                               #   in Loop: Header=BB6_59 Depth=1
	subq	$-128, %rcx
.LBB6_64:                               #   in Loop: Header=BB6_59 Depth=1
	vmovaps	5088(%rsp,%rax,4), %ymm9
	vmovaps	416(%rsp), %ymm11               # 32-byte Reload
	vfmadd213ps	448(%rsp), %ymm9, %ymm11 # 32-byte Folded Reload
                                        # ymm11 = (ymm9 * ymm11) + mem
	vfmadd213ps	384(%rsp), %ymm9, %ymm11 # 32-byte Folded Reload
                                        # ymm11 = (ymm9 * ymm11) + mem
	vfmadd213ps	%ymm6, %ymm9, %ymm11    # ymm11 = (ymm9 * ymm11) + ymm6
	vmulps	%ymm9, %ymm9, %ymm10
	vfmadd213ps	%ymm9, %ymm11, %ymm10   # ymm10 = (ymm11 * ymm10) + ymm9
	vaddps	%ymm15, %ymm9, %ymm11
	vandps	320(%rsp), %ymm11, %ymm13       # 32-byte Folded Reload
	vorps	288(%rsp), %ymm13, %ymm13       # 32-byte Folded Reload
	vcmpltps	256(%rsp), %ymm13, %ymm15       # 32-byte Folded Reload
	vandps	%ymm13, %ymm15, %ymm12
	vaddps	%ymm13, %ymm12, %ymm12
	vaddps	%ymm0, %ymm12, %ymm12
	vmulps	%ymm12, %ymm12, %ymm13
	vmovaps	704(%rsp), %ymm2                # 32-byte Reload
	vfmadd213ps	224(%rsp), %ymm12, %ymm2 # 32-byte Folded Reload
                                        # ymm2 = (ymm12 * ymm2) + mem
	vmovaps	640(%rsp), %ymm14               # 32-byte Reload
	vfmadd213ps	672(%rsp), %ymm12, %ymm14 # 32-byte Folded Reload
                                        # ymm14 = (ymm12 * ymm14) + mem
	vmovaps	%ymm5, %ymm1
	vfmadd213ps	608(%rsp), %ymm12, %ymm1 # 32-byte Folded Reload
                                        # ymm1 = (ymm12 * ymm1) + mem
	vfmadd213ps	%ymm2, %ymm13, %ymm14   # ymm14 = (ymm13 * ymm14) + ymm2
	vmovaps	%ymm3, %ymm2
	vfmadd213ps	576(%rsp), %ymm12, %ymm2 # 32-byte Folded Reload
                                        # ymm2 = (ymm12 * ymm2) + mem
	vfmadd231ps	544(%rsp), %ymm13, %ymm2 # 32-byte Folded Reload
                                        # ymm2 = (ymm13 * mem) + ymm2
	vfmadd213ps	%ymm1, %ymm13, %ymm2    # ymm2 = (ymm13 * ymm2) + ymm1
	vmulps	%ymm13, %ymm13, %ymm1
	vfmadd213ps	%ymm14, %ymm1, %ymm2    # ymm2 = (ymm1 * ymm2) + ymm14
	vaddps	%ymm0, %ymm11, %ymm1
	vsubps	%ymm1, %ymm9, %ymm14
	vdivps	%ymm1, %ymm14, %ymm1
	vpsrld	$23, %ymm11, %ymm11
	vpaddd	352(%rsp), %ymm11, %ymm11       # 32-byte Folded Reload
	vcvtdq2ps	%ymm11, %ymm11
	vandps	64(%rsp), %ymm15, %ymm14        # 32-byte Folded Reload
	vmovaps	64(%rsp), %ymm15                # 32-byte Reload
	vsubps	%ymm14, %ymm11, %ymm11
	vmulps	%ymm13, %ymm12, %ymm14
	vmulps	%ymm2, %ymm14, %ymm2
	vfmadd231ps	%ymm4, %ymm11, %ymm2    # ymm2 = (ymm11 * ymm4) + ymm2
	vfmadd231ps	%ymm13, %ymm6, %ymm2    # ymm2 = (ymm6 * ymm13) + ymm2
	vaddps	%ymm2, %ymm12, %ymm2
	vfmadd231ps	%ymm11, %ymm7, %ymm2    # ymm2 = (ymm7 * ymm11) + ymm2
	vfmadd231ps	%ymm2, %ymm1, %ymm2     # ymm2 = (ymm1 * ymm2) + ymm2
	vandps	32(%rsp), %ymm9, %ymm1          # 32-byte Folded Reload
	vcmpltps	96(%rsp), %ymm1, %ymm1          # 32-byte Folded Reload
	vblendvps	%ymm1, %ymm10, %ymm2, %ymm1
	vmovaps	8160(%rsp,%rax,4), %ymm2
	vcmpltps	%ymm2, %ymm8, %ymm9
	vblendvps	%ymm9, %ymm2, %ymm1, %ymm1
	vmulps	192(%rsp), %ymm1, %ymm1         # 32-byte Folded Reload
	vmovaps	%ymm1, 8160(%rsp,%rax,4)
	addq	$8, %rax
	cmpq	$120, %rax
	jae	.LBB6_65
.LBB6_59:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_64
# %bb.60:                               #   in Loop: Header=BB6_59 Depth=1
	leaq	64(%rcx), %rdx
	cmpl	$6, %r14d
	je	.LBB6_62
# %bb.61:                               #   in Loop: Header=BB6_59 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	(%rdx)
	jmp	.LBB6_63
.LBB6_65:
	vbroadcastss	48(%rsi), %ymm1
	vmovaps	%ymm1, 192(%rsp)                # 32-byte Spill
	movl	$120, %eax
	jmp	.LBB6_66
	.p2align	4, 0x90
.LBB6_69:                               #   in Loop: Header=BB6_66 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	(%rdx)
.LBB6_70:                               #   in Loop: Header=BB6_66 Depth=1
	subq	$-128, %rcx
.LBB6_71:                               #   in Loop: Header=BB6_66 Depth=1
	vmovaps	5088(%rsp,%rax,4), %ymm9
	vmovaps	416(%rsp), %ymm1                # 32-byte Reload
	vfmadd213ps	448(%rsp), %ymm9, %ymm1 # 32-byte Folded Reload
                                        # ymm1 = (ymm9 * ymm1) + mem
	vfmadd213ps	384(%rsp), %ymm9, %ymm1 # 32-byte Folded Reload
                                        # ymm1 = (ymm9 * ymm1) + mem
	vfmadd213ps	%ymm6, %ymm9, %ymm1     # ymm1 = (ymm9 * ymm1) + ymm6
	vmulps	%ymm9, %ymm9, %ymm10
	vfmadd213ps	%ymm9, %ymm1, %ymm10    # ymm10 = (ymm1 * ymm10) + ymm9
	vaddps	%ymm15, %ymm9, %ymm11
	vandps	320(%rsp), %ymm11, %ymm1        # 32-byte Folded Reload
	vorps	288(%rsp), %ymm1, %ymm1         # 32-byte Folded Reload
	vcmpltps	256(%rsp), %ymm1, %ymm2         # 32-byte Folded Reload
	vandps	%ymm1, %ymm2, %ymm12
	vaddps	%ymm1, %ymm12, %ymm1
	vaddps	%ymm0, %ymm1, %ymm1
	vmulps	%ymm1, %ymm1, %ymm12
	vmovaps	704(%rsp), %ymm13               # 32-byte Reload
	vfmadd213ps	224(%rsp), %ymm1, %ymm13 # 32-byte Folded Reload
                                        # ymm13 = (ymm1 * ymm13) + mem
	vmovaps	640(%rsp), %ymm14               # 32-byte Reload
	vfmadd213ps	672(%rsp), %ymm1, %ymm14 # 32-byte Folded Reload
                                        # ymm14 = (ymm1 * ymm14) + mem
	vmovaps	%ymm5, %ymm15
	vfmadd213ps	608(%rsp), %ymm1, %ymm15 # 32-byte Folded Reload
                                        # ymm15 = (ymm1 * ymm15) + mem
	vfmadd213ps	%ymm13, %ymm12, %ymm14  # ymm14 = (ymm12 * ymm14) + ymm13
	vmovaps	%ymm3, %ymm13
	vfmadd213ps	576(%rsp), %ymm1, %ymm13 # 32-byte Folded Reload
                                        # ymm13 = (ymm1 * ymm13) + mem
	vfmadd231ps	544(%rsp), %ymm12, %ymm13 # 32-byte Folded Reload
                                        # ymm13 = (ymm12 * mem) + ymm13
	vfmadd213ps	%ymm15, %ymm12, %ymm13  # ymm13 = (ymm12 * ymm13) + ymm15
	vmulps	%ymm12, %ymm12, %ymm15
	vfmadd213ps	%ymm14, %ymm15, %ymm13  # ymm13 = (ymm15 * ymm13) + ymm14
	vaddps	%ymm0, %ymm11, %ymm14
	vsubps	%ymm14, %ymm9, %ymm15
	vdivps	%ymm14, %ymm15, %ymm14
	vmovaps	64(%rsp), %ymm15                # 32-byte Reload
	vpsrld	$23, %ymm11, %ymm11
	vpaddd	352(%rsp), %ymm11, %ymm11       # 32-byte Folded Reload
	vcvtdq2ps	%ymm11, %ymm11
	vandps	%ymm2, %ymm15, %ymm2
	vsubps	%ymm2, %ymm11, %ymm2
	vmulps	%ymm1, %ymm12, %ymm11
	vmulps	%ymm13, %ymm11, %ymm11
	vfmadd231ps	%ymm4, %ymm2, %ymm11    # ymm11 = (ymm2 * ymm4) + ymm11
	vfmadd231ps	%ymm12, %ymm6, %ymm11   # ymm11 = (ymm6 * ymm12) + ymm11
	vaddps	%ymm1, %ymm11, %ymm1
	vfmadd231ps	%ymm2, %ymm7, %ymm1     # ymm1 = (ymm7 * ymm2) + ymm1
	vfmadd231ps	%ymm1, %ymm14, %ymm1    # ymm1 = (ymm14 * ymm1) + ymm1
	vandps	32(%rsp), %ymm9, %ymm2          # 32-byte Folded Reload
	vcmpltps	96(%rsp), %ymm2, %ymm2          # 32-byte Folded Reload
	vblendvps	%ymm2, %ymm10, %ymm1, %ymm1
	vmovaps	8160(%rsp,%rax,4), %ymm2
	vcmpltps	%ymm2, %ymm8, %ymm9
	vblendvps	%ymm9, %ymm2, %ymm1, %ymm1
	vmulps	192(%rsp), %ymm1, %ymm1         # 32-byte Folded Reload
	vmovaps	%ymm1, 8160(%rsp,%rax,4)
	addq	$8, %rax
	cmpq	$184, %rax
	vmovaps	928(%rsp), %ymm9                # 32-byte Reload
	vmovaps	896(%rsp), %ymm10               # 32-byte Reload
	vmovaps	864(%rsp), %ymm11               # 32-byte Reload
	vmovaps	832(%rsp), %ymm12               # 32-byte Reload
	vmovaps	800(%rsp), %ymm13               # 32-byte Reload
	vmovaps	768(%rsp), %ymm14               # 32-byte Reload
	jae	.LBB6_72
.LBB6_66:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_71
# %bb.67:                               #   in Loop: Header=BB6_66 Depth=1
	leaq	64(%rcx), %rdx
	cmpl	$6, %r14d
	je	.LBB6_69
# %bb.68:                               #   in Loop: Header=BB6_66 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	(%rdx)
	jmp	.LBB6_70
.LBB6_72:
	movq	$-8, %rax
	vbroadcastss	.LCPI6_35(%rip), %ymm1  # ymm1 = [-1.1E+2,-1.1E+2,-1.1E+2,-1.1E+2,-1.1E+2,-1.1E+2,-1.1E+2,-1.1E+2]
	vmovaps	960(%rsp), %ymm8                # 32-byte Reload
	jmp	.LBB6_73
	.p2align	4, 0x90
.LBB6_79:                               #   in Loop: Header=BB6_73 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	(%r9)
	prefetcht0	(%r8)
	prefetcht0	(%rdx)
.LBB6_80:                               #   in Loop: Header=BB6_73 Depth=1
	addq	$256, %rcx                      # imm = 0x100
.LBB6_81:                               #   in Loop: Header=BB6_73 Depth=1
	vmovaps	8160(%rsp,%rax,4), %ymm2
	vminps	%ymm8, %ymm2, %ymm2
	vmaxps	%ymm1, %ymm2, %ymm2
	vmovaps	%ymm10, %ymm3
	vfmadd213ps	%ymm9, %ymm2, %ymm3     # ymm3 = (ymm2 * ymm3) + ymm9
	vroundps	$1, %ymm3, %ymm3
	vfmadd231ps	%ymm11, %ymm3, %ymm2    # ymm2 = (ymm3 * ymm11) + ymm2
	vfmadd231ps	%ymm12, %ymm3, %ymm2    # ymm2 = (ymm3 * ymm12) + ymm2
	vmulps	%ymm2, %ymm2, %ymm4
	vmulps	%ymm4, %ymm4, %ymm5
	vmovaps	%ymm13, %ymm6
	vfmadd213ps	%ymm9, %ymm2, %ymm6     # ymm6 = (ymm2 * ymm6) + ymm9
	vmovaps	160(%rsp), %ymm7                # 32-byte Reload
	vfmadd213ps	%ymm14, %ymm2, %ymm7    # ymm7 = (ymm2 * ymm7) + ymm14
	vfmadd213ps	%ymm6, %ymm4, %ymm7     # ymm7 = (ymm4 * ymm7) + ymm6
	vmovaps	480(%rsp), %ymm6                # 32-byte Reload
	vfmadd213ps	512(%rsp), %ymm2, %ymm6 # 32-byte Folded Reload
                                        # ymm6 = (ymm2 * ymm6) + mem
	vfmadd231ps	%ymm6, %ymm5, %ymm7     # ymm7 = (ymm5 * ymm6) + ymm7
	vfmadd213ps	%ymm2, %ymm4, %ymm7     # ymm7 = (ymm4 * ymm7) + ymm2
	vaddps	%ymm7, %ymm15, %ymm2
	vcvtps2dq	%ymm3, %ymm3
	vpsrad	$1, %ymm3, %ymm4
	vpsubd	%ymm4, %ymm3, %ymm3
	vpslld	$23, %ymm4, %ymm4
	vmovdqa	128(%rsp), %ymm5                # 32-byte Reload
	vpaddd	%ymm5, %ymm4, %ymm4
	vmulps	%ymm4, %ymm2, %ymm2
	vpslld	$23, %ymm3, %ymm3
	vpaddd	%ymm5, %ymm3, %ymm3
	vmulps	%ymm3, %ymm2, %ymm2
	vmovaps	%ymm2, 10464(%rsp,%rax,4)
	addq	$8, %rax
	cmpq	$184, %rax
	jae	.LBB6_82
.LBB6_73:                               # =>This Inner Loop Header: Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_81
# %bb.74:                               #   in Loop: Header=BB6_73 Depth=1
	leaq	64(%rcx), %r9
	leaq	128(%rcx), %r8
	leaq	192(%rcx), %rdx
	cmpl	$6, %r14d
	jne	.LBB6_79
# %bb.75:                               #   in Loop: Header=BB6_73 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	(%r9)
	prefetcht1	(%r8)
	prefetcht1	(%rdx)
	jmp	.LBB6_80
.LBB6_82:
	movq	24(%rbp), %rax
	vmovss	(%rax), %xmm1                   # xmm1 = mem[0],zero,zero,zero
	vmovsd	4(%rax), %xmm2                  # xmm2 = mem[0],zero
	vshufps	$208, %xmm2, %xmm2, %xmm2       # xmm2 = xmm2[0,0,1,3]
	vblendps	$6, %ymm2, %ymm1, %ymm1         # ymm1 = ymm1[0],ymm2[1,2],ymm1[3,4,5,6,7]
	vorps	992(%rsp), %ymm1, %ymm2         # 32-byte Folded Reload
	vminps	%ymm8, %ymm2, %ymm2
	vmaxps	736(%rsp), %ymm2, %ymm2         # 32-byte Folded Reload
	vmovaps	%ymm10, %ymm3
	vfmadd213ps	%ymm9, %ymm2, %ymm3     # ymm3 = (ymm2 * ymm3) + ymm9
	vroundps	$1, %ymm3, %ymm3
	vfmadd231ps	%ymm11, %ymm3, %ymm2    # ymm2 = (ymm3 * ymm11) + ymm2
	vfmadd231ps	%ymm12, %ymm3, %ymm2    # ymm2 = (ymm3 * ymm12) + ymm2
	vmulps	%ymm2, %ymm2, %ymm4
	vmulps	%ymm4, %ymm4, %ymm5
	vmovaps	%ymm13, %ymm6
	vfmadd213ps	%ymm9, %ymm2, %ymm6     # ymm6 = (ymm2 * ymm6) + ymm9
	vmovaps	160(%rsp), %ymm7                # 32-byte Reload
	vfmadd213ps	%ymm14, %ymm2, %ymm7    # ymm7 = (ymm2 * ymm7) + ymm14
	vfmadd213ps	%ymm6, %ymm4, %ymm7     # ymm7 = (ymm4 * ymm7) + ymm6
	vmovaps	480(%rsp), %ymm6                # 32-byte Reload
	vfmadd213ps	512(%rsp), %ymm2, %ymm6 # 32-byte Folded Reload
                                        # ymm6 = (ymm2 * ymm6) + mem
	vfmadd231ps	%ymm6, %ymm5, %ymm7     # ymm7 = (ymm5 * ymm6) + ymm7
	vfmadd213ps	%ymm2, %ymm4, %ymm7     # ymm7 = (ymm4 * ymm7) + ymm2
	vaddps	%ymm7, %ymm15, %ymm2
	vcvtps2dq	%ymm3, %ymm3
	vpslld	$23, %ymm3, %ymm3
	vpaddd	128(%rsp), %ymm3, %ymm3         # 32-byte Folded Reload
	vmulps	%ymm3, %ymm2, %ymm2
	vaddps	%ymm2, %ymm15, %ymm3
	vaddps	%ymm0, %ymm3, %ymm0
	vxorps	%xmm4, %xmm4, %xmm4
	vcmpltps	%ymm4, %ymm1, %ymm1
	vblendvps	%ymm1, %ymm2, %ymm15, %ymm1
	vsubps	%ymm0, %ymm2, %ymm0
	vdivps	%ymm3, %ymm0, %ymm2
	vdivps	%ymm3, %ymm1, %ymm0
	vfnmadd231ps	%ymm0, %ymm2, %ymm0     # ymm0 = -(ymm2 * ymm0) + ymm0
	vmovshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
	vmovaps	%xmm1, 96(%rsp)                 # 16-byte Spill
	vshufpd	$1, %xmm0, %xmm0, %xmm1         # xmm1 = xmm0[1,0]
	vmovapd	%xmm1, 32(%rsp)                 # 16-byte Spill
	xorl	%eax, %eax
	vmovss	.LCPI6_36(%rip), %xmm1          # xmm1 = mem[0],zero,zero,zero
	vbroadcastss	.LCPI6_37(%rip), %ymm2  # ymm2 = [1.25E-1,1.25E-1,1.25E-1,1.25E-1,1.25E-1,1.25E-1,1.25E-1,1.25E-1]
	jmp	.LBB6_83
	.p2align	4, 0x90
.LBB6_118:                              #   in Loop: Header=BB6_83 Depth=1
	subq	$-128, %rcx
.LBB6_119:                              #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4512(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm4
	vmulps	%ymm2, %ymm4, %ymm4
	vmovaps	3744(%rsp,%rax,8), %ymm5
	vdivps	%ymm3, %ymm5, %ymm3
	vmovaps	%ymm4, 2208(%rsp,%rax,8)
	vmovaps	%ymm3, 2976(%rsp,%rax,8)
	addq	$32, %rax
	cmpq	$96, %rax
	je	.LBB6_100
.LBB6_83:                               # =>This Inner Loop Header: Depth=1
	vmovaps	1120(%rsp,%rax), %xmm3
	vaddps	1136(%rsp,%rax), %xmm3, %xmm3
	vshufpd	$1, %xmm3, %xmm3, %xmm4         # xmm4 = xmm3[1,0]
	vaddps	%xmm4, %xmm3, %xmm3
	vmovshdup	%xmm3, %xmm4            # xmm4 = xmm3[1,1,3,3]
	vaddss	%xmm4, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm3
	vsqrtss	%xmm3, %xmm3, %xmm3
	vmovaps	1024(%rsp,%rax), %xmm4
	vaddps	1040(%rsp,%rax), %xmm4, %xmm4
	vshufpd	$1, %xmm4, %xmm4, %xmm5         # xmm5 = xmm4[1,0]
	vaddps	%xmm5, %xmm4, %xmm4
	vmovshdup	%xmm4, %xmm5            # xmm5 = xmm4[1,1,3,3]
	vaddss	%xmm5, %xmm4, %xmm4
	vaddss	%xmm1, %xmm4, %xmm4
	vsqrtss	%xmm4, %xmm4, %xmm5
	vbroadcastss	%xmm3, %ymm4
	vbroadcastss	%xmm5, %ymm3
	cmpl	$6, %r14d
	jne	.LBB6_84
# %bb.102:                              #   in Loop: Header=BB6_83 Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_104
# %bb.103:                              #   in Loop: Header=BB6_83 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	64(%rcx)
	subq	$-128, %rcx
.LBB6_104:                              #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4288(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3520(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 1984(%rsp,%rax,8)
	vmovaps	%ymm6, 2752(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_106
# %bb.105:                              #   in Loop: Header=BB6_83 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	64(%rcx)
	subq	$-128, %rcx
.LBB6_106:                              #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4320(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3552(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 2016(%rsp,%rax,8)
	vmovaps	%ymm6, 2784(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_108
# %bb.107:                              #   in Loop: Header=BB6_83 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	64(%rcx)
	subq	$-128, %rcx
.LBB6_108:                              #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4352(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3584(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 2048(%rsp,%rax,8)
	vmovaps	%ymm6, 2816(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_110
# %bb.109:                              #   in Loop: Header=BB6_83 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	64(%rcx)
	subq	$-128, %rcx
.LBB6_110:                              #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4384(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3616(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 2080(%rsp,%rax,8)
	vmovaps	%ymm6, 2848(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_112
# %bb.111:                              #   in Loop: Header=BB6_83 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	64(%rcx)
	subq	$-128, %rcx
.LBB6_112:                              #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4416(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3648(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 2112(%rsp,%rax,8)
	vmovaps	%ymm6, 2880(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_114
# %bb.113:                              #   in Loop: Header=BB6_83 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	64(%rcx)
	subq	$-128, %rcx
.LBB6_114:                              #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4448(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3680(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 2144(%rsp,%rax,8)
	vmovaps	%ymm6, 2912(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_116
# %bb.115:                              #   in Loop: Header=BB6_83 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	64(%rcx)
	subq	$-128, %rcx
.LBB6_116:                              #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4480(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3712(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 2176(%rsp,%rax,8)
	vmovaps	%ymm6, 2944(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_119
# %bb.117:                              #   in Loop: Header=BB6_83 Depth=1
	prefetcht1	(%rcx)
	prefetcht1	64(%rcx)
	jmp	.LBB6_118
	.p2align	4, 0x90
.LBB6_84:                               #   in Loop: Header=BB6_83 Depth=1
	cmpq	%rdi, %rcx
	jae	.LBB6_86
# %bb.85:                               #   in Loop: Header=BB6_83 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	subq	$-128, %rcx
.LBB6_86:                               #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4288(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3520(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 1984(%rsp,%rax,8)
	vmovaps	%ymm6, 2752(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_88
# %bb.87:                               #   in Loop: Header=BB6_83 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	subq	$-128, %rcx
.LBB6_88:                               #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4320(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3552(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 2016(%rsp,%rax,8)
	vmovaps	%ymm6, 2784(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_90
# %bb.89:                               #   in Loop: Header=BB6_83 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	subq	$-128, %rcx
.LBB6_90:                               #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4352(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3584(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 2048(%rsp,%rax,8)
	vmovaps	%ymm6, 2816(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_92
# %bb.91:                               #   in Loop: Header=BB6_83 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	subq	$-128, %rcx
.LBB6_92:                               #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4384(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3616(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 2080(%rsp,%rax,8)
	vmovaps	%ymm6, 2848(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_94
# %bb.93:                               #   in Loop: Header=BB6_83 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	subq	$-128, %rcx
.LBB6_94:                               #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4416(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3648(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 2112(%rsp,%rax,8)
	vmovaps	%ymm6, 2880(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_96
# %bb.95:                               #   in Loop: Header=BB6_83 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	subq	$-128, %rcx
.LBB6_96:                               #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4448(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3680(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 2144(%rsp,%rax,8)
	vmovaps	%ymm6, 2912(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_98
# %bb.97:                               #   in Loop: Header=BB6_83 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	subq	$-128, %rcx
.LBB6_98:                               #   in Loop: Header=BB6_83 Depth=1
	vmovaps	4480(%rsp,%rax,8), %ymm5
	vdivps	%ymm4, %ymm5, %ymm5
	vmovaps	3712(%rsp,%rax,8), %ymm6
	vdivps	%ymm3, %ymm6, %ymm6
	vmulps	%ymm2, %ymm5, %ymm5
	vmovaps	%ymm5, 2176(%rsp,%rax,8)
	vmovaps	%ymm6, 2944(%rsp,%rax,8)
	cmpq	%rdi, %rcx
	jae	.LBB6_119
# %bb.99:                               #   in Loop: Header=BB6_83 Depth=1
	prefetcht0	(%rcx)
	prefetcht0	64(%rcx)
	jmp	.LBB6_118
.LBB6_100:
	testq	%r15, %r15
	je	.LBB6_101
# %bb.120:
	#APP
hutblk_2_start:
	lfence
	rdtsc
hutblk_2_end:
	#NO_APP
                                        # kill: def $edx killed $edx def $rdx
	shlq	$32, %rdx
	movl	%eax, %r14d
	orq	%rdx, %r14
	jmp	.LBB6_121
.LBB6_101:
	xorl	%r14d, %r14d
.LBB6_121:
	leaq	16384(%rbx), %r13
	movl	_ZN3fx23opt12_GLOBAL__N_17g_sweepE(%rip), %eax
	leaq	10432(%rsp), %rsi
	leaq	2752(%rsp), %rdx
	leaq	7360(%rsp), %rcx
	leaq	1984(%rsp), %r8
	leaq	1216(%rsp), %r9
	movq	%rbx, %rdi
                                        # kill: def $xmm0 killed $xmm0 killed $ymm0
	pushq	%rax
	pushq	%r13
	vzeroupper
	callq	_ZN3fx23opt14kda_sweep_headEPfPKfS3_S3_fS3_S1_S3_NS0_8KdaSweepE
	addq	$16, %rsp
	leaq	32768(%rbx), %r12
	leaq	10688(%rsp), %rsi
	leaq	3008(%rsp), %rdx
	leaq	7616(%rsp), %rcx
	leaq	2240(%rsp), %r8
	leaq	1472(%rsp), %r9
	movl	_ZN3fx23opt12_GLOBAL__N_17g_sweepE(%rip), %eax
	movq	%r13, %rdi
	vmovaps	96(%rsp), %xmm0                 # 16-byte Reload
	pushq	%rax
	pushq	%r12
	callq	_ZN3fx23opt14kda_sweep_headEPfPKfS3_S3_fS3_S1_S3_NS0_8KdaSweepE
	addq	$16, %rsp
	leaq	10944(%rsp), %rsi
	leaq	3264(%rsp), %rdx
	leaq	7872(%rsp), %rcx
	leaq	2496(%rsp), %r8
	leaq	1728(%rsp), %r9
	movl	_ZN3fx23opt12_GLOBAL__N_17g_sweepE(%rip), %eax
	movq	%r12, %rdi
	vmovaps	32(%rsp), %xmm0                 # 16-byte Reload
	pushq	%rax
	pushq	%r12
	callq	_ZN3fx23opt14kda_sweep_headEPfPKfS3_S3_fS3_S1_S3_NS0_8KdaSweepE
	addq	$16, %rsp
	testq	%r15, %r15
	je	.LBB6_122
# %bb.123:
	#APP
hutblk_3_start:
	lfence
	rdtsc
hutblk_3_end:
	#NO_APP
                                        # kill: def $edx killed $edx def $rdx
	shlq	$32, %rdx
	movl	%eax, %ecx
	orq	%rdx, %rcx
	jmp	.LBB6_124
.LBB6_122:
	xorl	%ecx, %ecx
.LBB6_124:
	movq	(%rsp), %rdx                    # 8-byte Reload
	movq	16(%rbp), %rsi
	vmovaps	1216(%rsp), %ymm0
	vmovaps	1248(%rsp), %ymm4
	vmovaps	1280(%rsp), %ymm2
	vmovaps	1312(%rsp), %ymm1
	vxorps	%xmm3, %xmm3, %xmm3
	vmovaps	%ymm0, 384(%rsp)                # 32-byte Spill
	vfmadd213ps	%ymm3, %ymm0, %ymm0     # ymm0 = (ymm0 * ymm0) + ymm3
	vmovaps	1472(%rsp), %ymm5
	vfmadd213ps	%ymm3, %ymm5, %ymm5     # ymm5 = (ymm5 * ymm5) + ymm3
	vmovaps	1728(%rsp), %ymm6
	vfmadd213ps	%ymm3, %ymm6, %ymm6     # ymm6 = (ymm6 * ymm6) + ymm3
	vmovaps	%ymm4, 416(%rsp)                # 32-byte Spill
	vfmadd231ps	%ymm4, %ymm4, %ymm0     # ymm0 = (ymm4 * ymm4) + ymm0
	vmovaps	1504(%rsp), %ymm3
	vfmadd213ps	%ymm5, %ymm3, %ymm3     # ymm3 = (ymm3 * ymm3) + ymm5
	vmovaps	1760(%rsp), %ymm5
	vfmadd213ps	%ymm6, %ymm5, %ymm5     # ymm5 = (ymm5 * ymm5) + ymm6
	vmovaps	%ymm2, 448(%rsp)                # 32-byte Spill
	vfmadd231ps	%ymm2, %ymm2, %ymm0     # ymm0 = (ymm2 * ymm2) + ymm0
	vmovaps	1536(%rsp), %ymm6
	vfmadd213ps	%ymm3, %ymm6, %ymm6     # ymm6 = (ymm6 * ymm6) + ymm3
	vmovaps	1792(%rsp), %ymm3
	vfmadd213ps	%ymm5, %ymm3, %ymm3     # ymm3 = (ymm3 * ymm3) + ymm5
	vmovaps	%ymm1, 96(%rsp)                 # 32-byte Spill
	vfmadd231ps	%ymm1, %ymm1, %ymm0     # ymm0 = (ymm1 * ymm1) + ymm0
	vmovaps	1568(%rsp), %ymm5
	vfmadd213ps	%ymm6, %ymm5, %ymm5     # ymm5 = (ymm5 * ymm5) + ymm6
	vmovaps	1824(%rsp), %ymm6
	vfmadd213ps	%ymm3, %ymm6, %ymm6     # ymm6 = (ymm6 * ymm6) + ymm3
	vmovaps	1344(%rsp), %ymm1
	vmovaps	%ymm1, 352(%rsp)                # 32-byte Spill
	vfmadd231ps	%ymm1, %ymm1, %ymm0     # ymm0 = (ymm1 * ymm1) + ymm0
	vmovaps	1600(%rsp), %ymm3
	vfmadd213ps	%ymm5, %ymm3, %ymm3     # ymm3 = (ymm3 * ymm3) + ymm5
	vmovaps	1856(%rsp), %ymm5
	vfmadd213ps	%ymm6, %ymm5, %ymm5     # ymm5 = (ymm5 * ymm5) + ymm6
	vmovaps	1376(%rsp), %ymm1
	vmovaps	%ymm1, 320(%rsp)                # 32-byte Spill
	vfmadd231ps	%ymm1, %ymm1, %ymm0     # ymm0 = (ymm1 * ymm1) + ymm0
	vmovaps	1632(%rsp), %ymm6
	vfmadd213ps	%ymm3, %ymm6, %ymm6     # ymm6 = (ymm6 * ymm6) + ymm3
	vmovaps	1888(%rsp), %ymm3
	vfmadd213ps	%ymm5, %ymm3, %ymm3     # ymm3 = (ymm3 * ymm3) + ymm5
	vmovaps	1408(%rsp), %ymm1
	vmovaps	%ymm1, 256(%rsp)                # 32-byte Spill
	vfmadd231ps	%ymm1, %ymm1, %ymm0     # ymm0 = (ymm1 * ymm1) + ymm0
	vmovaps	1664(%rsp), %ymm5
	vfmadd213ps	%ymm6, %ymm5, %ymm5     # ymm5 = (ymm5 * ymm5) + ymm6
	vmovaps	1920(%rsp), %ymm6
	vfmadd213ps	%ymm3, %ymm6, %ymm6     # ymm6 = (ymm6 * ymm6) + ymm3
	vmovaps	1440(%rsp), %ymm1
	vfmadd213ps	%ymm0, %ymm1, %ymm1     # ymm1 = (ymm1 * ymm1) + ymm0
	vmovaps	%ymm1, 224(%rsp)                # 32-byte Spill
	vmovaps	1696(%rsp), %ymm0
	vfmadd213ps	%ymm5, %ymm0, %ymm0     # ymm0 = (ymm0 * ymm0) + ymm5
	vmovaps	%ymm0, 288(%rsp)                # 32-byte Spill
	vmovaps	1952(%rsp), %ymm0
	vfmadd213ps	%ymm6, %ymm0, %ymm0     # ymm0 = (ymm0 * ymm0) + ymm6
	vmovaps	%ymm0, 32(%rsp)                 # 32-byte Spill
	movq	$-8, %rax
	vmovaps	736(%rsp), %ymm4                # 32-byte Reload
	vmovaps	928(%rsp), %ymm7                # 32-byte Reload
	vmovaps	896(%rsp), %ymm8                # 32-byte Reload
	vmovaps	864(%rsp), %ymm9                # 32-byte Reload
	vmovaps	832(%rsp), %ymm11               # 32-byte Reload
	vmovaps	800(%rsp), %ymm0                # 32-byte Reload
	vmovaps	768(%rsp), %ymm10               # 32-byte Reload
	vmovaps	160(%rsp), %ymm3                # 32-byte Reload
	vmovaps	512(%rsp), %ymm1                # 32-byte Reload
	vmovaps	480(%rsp), %ymm2                # 32-byte Reload
	.p2align	4, 0x90
.LBB6_125:                              # =>This Inner Loop Header: Depth=1
	vmovaps	992(%rsp), %ymm5                # 32-byte Reload
	vxorps	32(%rsi,%rax,4), %ymm5, %ymm5
	vminps	960(%rsp), %ymm5, %ymm5         # 32-byte Folded Reload
	vmaxps	%ymm4, %ymm5, %ymm5
	vmovaps	%ymm8, %ymm6
	vfmadd213ps	%ymm7, %ymm5, %ymm6     # ymm6 = (ymm5 * ymm6) + ymm7
	vroundps	$1, %ymm6, %ymm6
	vfmadd231ps	%ymm9, %ymm6, %ymm5     # ymm5 = (ymm6 * ymm9) + ymm5
	vfmadd231ps	%ymm11, %ymm6, %ymm5    # ymm5 = (ymm6 * ymm11) + ymm5
	vmulps	%ymm5, %ymm5, %ymm12
	vmulps	%ymm12, %ymm12, %ymm13
	vmovaps	%ymm0, %ymm14
	vfmadd213ps	%ymm7, %ymm5, %ymm14    # ymm14 = (ymm5 * ymm14) + ymm7
	vmovaps	%ymm3, %ymm15
	vfmadd213ps	%ymm10, %ymm5, %ymm15   # ymm15 = (ymm5 * ymm15) + ymm10
	vfmadd213ps	%ymm14, %ymm12, %ymm15  # ymm15 = (ymm12 * ymm15) + ymm14
	vmovaps	%ymm2, %ymm14
	vfmadd213ps	%ymm1, %ymm5, %ymm14    # ymm14 = (ymm5 * ymm14) + ymm1
	vfmadd231ps	%ymm14, %ymm13, %ymm15  # ymm15 = (ymm13 * ymm14) + ymm15
	vfmadd213ps	%ymm5, %ymm12, %ymm15   # ymm15 = (ymm12 * ymm15) + ymm5
	vaddps	64(%rsp), %ymm15, %ymm5         # 32-byte Folded Reload
	vmovaps	64(%rsp), %ymm14                # 32-byte Reload
	vcvtps2dq	%ymm6, %ymm6
	vpslld	$23, %ymm6, %ymm6
	vpaddd	128(%rsp), %ymm6, %ymm6         # 32-byte Folded Reload
	vmulps	%ymm6, %ymm5, %ymm5
	vmovaps	%ymm5, 5088(%rsp,%rax,4)
	addq	$8, %rax
	cmpq	$184, %rax
	jb	.LBB6_125
# %bb.126:
	vmovaps	224(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm5
	vaddps	%xmm5, %xmm0, %xmm3
	vshufpd	$1, %xmm3, %xmm3, %xmm5         # xmm5 = xmm3[1,0]
	vaddps	%xmm5, %xmm3, %xmm3
	vmovshdup	%xmm3, %xmm5            # xmm5 = xmm3[1,1,3,3]
	vaddss	%xmm5, %xmm3, %xmm3
	vmovss	.LCPI6_14(%rip), %xmm5          # xmm5 = mem[0],zero,zero,zero
	vmulss	%xmm5, %xmm3, %xmm3
	vmovss	.LCPI6_38(%rip), %xmm6          # xmm6 = mem[0],zero,zero,zero
	vaddss	%xmm6, %xmm3, %xmm3
	vsqrtss	%xmm3, %xmm3, %xmm12
	vmovss	.LCPI6_12(%rip), %xmm3          # xmm3 = mem[0],zero,zero,zero
	vdivss	%xmm12, %xmm3, %xmm12
	vaddps	5056(%rsp), %ymm14, %ymm13
	vbroadcastss	%xmm12, %ymm12
	vdivps	%ymm13, %ymm14, %ymm13
	vmulps	384(%rsp), %ymm12, %ymm7        # 32-byte Folded Reload
	movq	32(%rdx), %rax
	vmulps	(%rax), %ymm7, %ymm7
	vmulps	%ymm7, %ymm13, %ymm7
	movq	32(%rbp), %rsi
	vmovups	%ymm7, (%rsi)
	vaddps	5088(%rsp), %ymm14, %ymm7
	vdivps	%ymm7, %ymm14, %ymm7
	vmulps	416(%rsp), %ymm12, %ymm4        # 32-byte Folded Reload
	movq	32(%rdx), %rax
	vmulps	32(%rax), %ymm4, %ymm4
	vmulps	%ymm4, %ymm7, %ymm4
	vmovups	%ymm4, 32(%rsi)
	vaddps	5120(%rsp), %ymm14, %ymm4
	vdivps	%ymm4, %ymm14, %ymm4
	vmulps	448(%rsp), %ymm12, %ymm2        # 32-byte Folded Reload
	movq	32(%rdx), %rax
	vmulps	64(%rax), %ymm2, %ymm2
	vmulps	%ymm2, %ymm4, %ymm2
	vmovups	%ymm2, 64(%rsi)
	vaddps	5152(%rsp), %ymm14, %ymm2
	vdivps	%ymm2, %ymm14, %ymm2
	vmulps	96(%rsp), %ymm12, %ymm1         # 32-byte Folded Reload
	movq	32(%rdx), %rax
	vmulps	96(%rax), %ymm1, %ymm1
	vmulps	%ymm1, %ymm2, %ymm1
	vmovups	%ymm1, 96(%rsi)
	vaddps	5184(%rsp), %ymm14, %ymm1
	vdivps	%ymm1, %ymm14, %ymm1
	vmulps	352(%rsp), %ymm12, %ymm2        # 32-byte Folded Reload
	movq	32(%rdx), %rax
	vmulps	128(%rax), %ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovups	%ymm1, 128(%rsi)
	vaddps	5216(%rsp), %ymm14, %ymm1
	vdivps	%ymm1, %ymm14, %ymm1
	vmulps	320(%rsp), %ymm12, %ymm2        # 32-byte Folded Reload
	movq	32(%rdx), %rax
	vmulps	160(%rax), %ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovups	%ymm1, 160(%rsi)
	vaddps	5248(%rsp), %ymm14, %ymm1
	vdivps	%ymm1, %ymm14, %ymm1
	vmulps	256(%rsp), %ymm12, %ymm2        # 32-byte Folded Reload
	movq	32(%rdx), %rax
	vmulps	192(%rax), %ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovups	%ymm1, 192(%rsi)
	vaddps	5280(%rsp), %ymm14, %ymm1
	vdivps	%ymm1, %ymm14, %ymm1
	vmulps	1440(%rsp), %ymm12, %ymm2
	movq	32(%rdx), %rax
	vmulps	224(%rax), %ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovups	%ymm1, 224(%rsi)
	vmovaps	288(%rsp), %ymm0                # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm1
	vaddps	%xmm1, %xmm0, %xmm1
	vshufpd	$1, %xmm1, %xmm1, %xmm2         # xmm2 = xmm1[1,0]
	vaddps	%xmm2, %xmm1, %xmm1
	vmovshdup	%xmm1, %xmm2            # xmm2 = xmm1[1,1,3,3]
	vaddss	%xmm2, %xmm1, %xmm1
	vmulss	%xmm5, %xmm1, %xmm1
	vaddss	%xmm6, %xmm1, %xmm1
	vaddps	5312(%rsp), %ymm14, %ymm2
	vsqrtss	%xmm1, %xmm1, %xmm1
	vdivps	%ymm2, %ymm14, %ymm2
	vdivss	%xmm1, %xmm3, %xmm1
	vbroadcastss	%xmm1, %ymm1
	vmulps	1472(%rsp), %ymm1, %ymm4
	movq	32(%rdx), %rax
	vmulps	(%rax), %ymm4, %ymm4
	vmulps	%ymm4, %ymm2, %ymm2
	vmovups	%ymm2, 256(%rsi)
	vaddps	5344(%rsp), %ymm14, %ymm2
	vdivps	%ymm2, %ymm14, %ymm2
	vmulps	1504(%rsp), %ymm1, %ymm4
	movq	32(%rdx), %rax
	vmulps	32(%rax), %ymm4, %ymm4
	vmulps	%ymm4, %ymm2, %ymm2
	vmovups	%ymm2, 288(%rsi)
	vaddps	5376(%rsp), %ymm14, %ymm2
	vdivps	%ymm2, %ymm14, %ymm2
	vmulps	1536(%rsp), %ymm1, %ymm4
	movq	32(%rdx), %rax
	vmulps	64(%rax), %ymm4, %ymm4
	vmulps	%ymm4, %ymm2, %ymm2
	vmovups	%ymm2, 320(%rsi)
	vaddps	5408(%rsp), %ymm14, %ymm2
	vdivps	%ymm2, %ymm14, %ymm2
	vmulps	1568(%rsp), %ymm1, %ymm4
	movq	32(%rdx), %rax
	vmulps	96(%rax), %ymm4, %ymm4
	vmulps	%ymm4, %ymm2, %ymm2
	vmovups	%ymm2, 352(%rsi)
	vaddps	5440(%rsp), %ymm14, %ymm2
	vdivps	%ymm2, %ymm14, %ymm2
	vmulps	1600(%rsp), %ymm1, %ymm4
	movq	32(%rdx), %rax
	vmulps	128(%rax), %ymm4, %ymm4
	vmulps	%ymm4, %ymm2, %ymm2
	vmovups	%ymm2, 384(%rsi)
	vaddps	5472(%rsp), %ymm14, %ymm2
	vdivps	%ymm2, %ymm14, %ymm2
	vmulps	1632(%rsp), %ymm1, %ymm4
	movq	32(%rdx), %rax
	vmulps	160(%rax), %ymm4, %ymm4
	vmulps	%ymm4, %ymm2, %ymm2
	vmovups	%ymm2, 416(%rsi)
	vaddps	5504(%rsp), %ymm14, %ymm2
	vdivps	%ymm2, %ymm14, %ymm2
	vmulps	1664(%rsp), %ymm1, %ymm4
	movq	32(%rdx), %rax
	vmulps	192(%rax), %ymm4, %ymm4
	vmulps	%ymm4, %ymm2, %ymm2
	vmovups	%ymm2, 448(%rsi)
	vaddps	5536(%rsp), %ymm14, %ymm2
	vdivps	%ymm2, %ymm14, %ymm2
	vmulps	1696(%rsp), %ymm1, %ymm1
	movq	32(%rdx), %rax
	vmulps	224(%rax), %ymm1, %ymm1
	vmulps	%ymm1, %ymm2, %ymm1
	vmovups	%ymm1, 480(%rsi)
	vmovaps	32(%rsp), %ymm0                 # 32-byte Reload
	vextractf128	$1, %ymm0, %xmm1
	vaddps	%xmm1, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1         # xmm1 = xmm0[1,0]
	vaddps	%xmm1, %xmm0, %xmm0
	vmovshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm5, %xmm0, %xmm0
	vaddss	%xmm6, %xmm0, %xmm0
	vaddps	5568(%rsp), %ymm14, %ymm1
	vsqrtss	%xmm0, %xmm0, %xmm0
	vdivps	%ymm1, %ymm14, %ymm1
	vdivss	%xmm0, %xmm3, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vmulps	1728(%rsp), %ymm0, %ymm2
	movq	32(%rdx), %rax
	vmulps	(%rax), %ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovups	%ymm1, 512(%rsi)
	vaddps	5600(%rsp), %ymm14, %ymm1
	vdivps	%ymm1, %ymm14, %ymm1
	vmulps	1760(%rsp), %ymm0, %ymm2
	movq	32(%rdx), %rax
	vmulps	32(%rax), %ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovups	%ymm1, 544(%rsi)
	vaddps	5632(%rsp), %ymm14, %ymm1
	vdivps	%ymm1, %ymm14, %ymm1
	vmulps	1792(%rsp), %ymm0, %ymm2
	movq	32(%rdx), %rax
	vmulps	64(%rax), %ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovups	%ymm1, 576(%rsi)
	vaddps	5664(%rsp), %ymm14, %ymm1
	vdivps	%ymm1, %ymm14, %ymm1
	vmulps	1824(%rsp), %ymm0, %ymm2
	movq	32(%rdx), %rax
	vmulps	96(%rax), %ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovups	%ymm1, 608(%rsi)
	vaddps	5696(%rsp), %ymm14, %ymm1
	vdivps	%ymm1, %ymm14, %ymm1
	vmulps	1856(%rsp), %ymm0, %ymm2
	movq	32(%rdx), %rax
	vmulps	128(%rax), %ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovups	%ymm1, 640(%rsi)
	vaddps	5728(%rsp), %ymm14, %ymm1
	vdivps	%ymm1, %ymm14, %ymm1
	vmulps	1888(%rsp), %ymm0, %ymm2
	movq	32(%rdx), %rax
	vmulps	160(%rax), %ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovups	%ymm1, 672(%rsi)
	vaddps	5760(%rsp), %ymm14, %ymm1
	vdivps	%ymm1, %ymm14, %ymm1
	vmulps	1920(%rsp), %ymm0, %ymm2
	movq	32(%rdx), %rax
	vmulps	192(%rax), %ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovups	%ymm1, 704(%rsi)
	vaddps	5792(%rsp), %ymm14, %ymm1
	vdivps	%ymm1, %ymm14, %ymm1
	vmulps	1952(%rsp), %ymm0, %ymm0
	movq	32(%rdx), %rax
	vmulps	224(%rax), %ymm0, %ymm0
	vmulps	%ymm0, %ymm1, %ymm0
	vmovups	%ymm0, 736(%rsi)
	testq	%r15, %r15
	je	.LBB6_128
# %bb.127:
	#APP
hutblk_4_start:
	lfence
	rdtsc
hutblk_4_end:
	#NO_APP
                                        # kill: def $edx killed $edx def $rdx
	movq	16(%rsp), %rsi                  # 8-byte Reload
	movq	8(%rsp), %rdi                   # 8-byte Reload
	addq	%rdi, %rsi
	addq	%rsi, (%r15)
	movl	%eax, %eax
	subq	%rcx, %rax
	subq	%r14, %rcx
	subq	%rdi, %r14
	addq	%r14, 8(%r15)
	shlq	$32, %rdx
	addq	%rcx, 16(%r15)
	addq	%rdx, %rax
	addq	%rax, 24(%r15)
.LBB6_128:
	movq	40(%rbp), %r14
	testq	%r14, %r14
	je	.LBB6_137
# %bb.129:
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	.LBB6_131
# %bb.130:
	leaq	4288(%rsp), %rsi
	movl	$768, %edx                      # imm = 0x300
	vzeroupper
	callq	memcpy@PLT
.LBB6_131:
	movq	8(%r14), %rdi
	testq	%rdi, %rdi
	je	.LBB6_133
# %bb.132:
	leaq	3520(%rsp), %rsi
	movl	$768, %edx                      # imm = 0x300
	vzeroupper
	callq	memcpy@PLT
.LBB6_133:
	movq	16(%r14), %rdi
	testq	%rdi, %rdi
	je	.LBB6_135
# %bb.134:
	leaq	7360(%rsp), %rsi
	movl	$768, %edx                      # imm = 0x300
	vzeroupper
	callq	memcpy@PLT
.LBB6_135:
	movq	24(%r14), %rdi
	testq	%rdi, %rdi
	je	.LBB6_137
# %bb.136:
	leaq	1216(%rsp), %rsi
	movl	$768, %edx                      # imm = 0x300
	vzeroupper
	callq	memcpy@PLT
.LBB6_137:
	incl	58368(%rbx)
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	vzeroupper
	retq
.Lfunc_end6:
	.size	_ZN3fx23opt14kda_layer_stepERKNS0_10KdaWeightsERNS0_8KdaStateEPKfS7_S7_S7_S7_S7_PfPNS0_8KdaDebugEPNS0_10KdaProfileE, .Lfunc_end6-_ZN3fx23opt14kda_layer_stepERKNS0_10KdaWeightsERNS0_8KdaStateEPKfS7_S7_S7_S7_S7_PfPNS0_8KdaDebugEPNS0_10KdaProfileE
	.cfi_endproc
                                        # -- End function
	.type	_ZN3fx23opt12_GLOBAL__N_17g_sweepE,@object # @_ZN3fx23opt12_GLOBAL__N_17g_sweepE
	.section	.bss._ZN3fx23opt12_GLOBAL__N_17g_sweepE,"aw",@nobits
	.p2align	2, 0x0
_ZN3fx23opt12_GLOBAL__N_17g_sweepE:
	.long	0                               # 0x0
	.size	_ZN3fx23opt12_GLOBAL__N_17g_sweepE, 4

	.type	_ZN3fx23opt12_GLOBAL__N_19g_pf_modeE,@object # @_ZN3fx23opt12_GLOBAL__N_19g_pf_modeE
	.section	.data._ZN3fx23opt12_GLOBAL__N_19g_pf_modeE,"aw",@progbits
	.p2align	2, 0x0
_ZN3fx23opt12_GLOBAL__N_19g_pf_modeE:
	.long	5                               # 0x5
	.size	_ZN3fx23opt12_GLOBAL__N_19g_pf_modeE, 4

	.ident	"Debian clang version 17.0.6 (++20231208085813+6009708b4367-1~exp1~20231208085906.81)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
