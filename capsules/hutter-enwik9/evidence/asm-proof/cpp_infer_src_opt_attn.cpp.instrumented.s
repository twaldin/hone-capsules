	.text
	.file	"attn.cpp"
	.section	.text._ZN3fx23opt14attn_kv_insertERNS0_7AttnKVTILi1024EEEiPKaS5_,"ax",@progbits
	.globl	_ZN3fx23opt14attn_kv_insertERNS0_7AttnKVTILi1024EEEiPKaS5_ # -- Begin function _ZN3fx23opt14attn_kv_insertERNS0_7AttnKVTILi1024EEEiPKaS5_
	.p2align	4, 0x90
	.type	_ZN3fx23opt14attn_kv_insertERNS0_7AttnKVTILi1024EEEiPKaS5_,@function
_ZN3fx23opt14attn_kv_insertERNS0_7AttnKVTILi1024EEEiPKaS5_: # @_ZN3fx23opt14attn_kv_insertERNS0_7AttnKVTILi1024EEEiPKaS5_
	.cfi_startproc
# %bb.0:
                                        # kill: def $esi killed $esi def $rsi
	movl	%esi, %eax
	sarl	$4, %eax
	movslq	%eax, %r8
	movslq	%esi, %rax
	andl	$15, %esi
	leaq	(%rdi,%rsi,2), %rsi
	shlq	$10, %r8
	movzwl	(%rdx), %r9d
	movw	%r9w, (%r8,%rsi)
	movzwl	2(%rdx), %r9d
	movw	%r9w, 32(%r8,%rsi)
	movzwl	4(%rdx), %r9d
	movw	%r9w, 64(%r8,%rsi)
	movzwl	6(%rdx), %r9d
	movw	%r9w, 96(%r8,%rsi)
	movzwl	8(%rdx), %r9d
	movw	%r9w, 128(%r8,%rsi)
	movzwl	10(%rdx), %r9d
	movw	%r9w, 160(%r8,%rsi)
	movzwl	12(%rdx), %r9d
	movw	%r9w, 192(%r8,%rsi)
	movzwl	14(%rdx), %r9d
	movw	%r9w, 224(%r8,%rsi)
	movzwl	16(%rdx), %r9d
	movw	%r9w, 256(%r8,%rsi)
	movzwl	18(%rdx), %r9d
	movw	%r9w, 288(%r8,%rsi)
	movzwl	20(%rdx), %r9d
	movw	%r9w, 320(%r8,%rsi)
	movzwl	22(%rdx), %r9d
	movw	%r9w, 352(%r8,%rsi)
	movzwl	24(%rdx), %r9d
	movw	%r9w, 384(%r8,%rsi)
	movzwl	26(%rdx), %r9d
	movw	%r9w, 416(%r8,%rsi)
	movzwl	28(%rdx), %r9d
	movw	%r9w, 448(%r8,%rsi)
	movzwl	30(%rdx), %r9d
	movw	%r9w, 480(%r8,%rsi)
	movzwl	32(%rdx), %r9d
	movw	%r9w, 512(%r8,%rsi)
	movzwl	34(%rdx), %r9d
	movw	%r9w, 544(%r8,%rsi)
	movzwl	36(%rdx), %r9d
	movw	%r9w, 576(%r8,%rsi)
	movzwl	38(%rdx), %r9d
	movw	%r9w, 608(%r8,%rsi)
	movzwl	40(%rdx), %r9d
	movw	%r9w, 640(%r8,%rsi)
	movzwl	42(%rdx), %r9d
	movw	%r9w, 672(%r8,%rsi)
	movzwl	44(%rdx), %r9d
	movw	%r9w, 704(%r8,%rsi)
	movzwl	46(%rdx), %r9d
	movw	%r9w, 736(%r8,%rsi)
	movzwl	48(%rdx), %r9d
	movw	%r9w, 768(%r8,%rsi)
	movzwl	50(%rdx), %r9d
	movw	%r9w, 800(%r8,%rsi)
	movzwl	52(%rdx), %r9d
	movw	%r9w, 832(%r8,%rsi)
	movzwl	54(%rdx), %r9d
	movw	%r9w, 864(%r8,%rsi)
	movzwl	56(%rdx), %r9d
	movw	%r9w, 896(%r8,%rsi)
	movzwl	58(%rdx), %r9d
	movw	%r9w, 928(%r8,%rsi)
	movzwl	60(%rdx), %r9d
	movw	%r9w, 960(%r8,%rsi)
	movzwl	62(%rdx), %r9d
	movw	%r9w, 992(%r8,%rsi)
	shlq	$6, %rax
	vmovups	(%rcx), %ymm0
	vmovups	32(%rcx), %ymm1
	vmovups	%ymm1, 196640(%rdi,%rax)
	vmovups	%ymm0, 196608(%rdi,%rax)
	movzwl	64(%rdx), %r9d
	movw	%r9w, 65536(%r8,%rsi)
	movzwl	66(%rdx), %r9d
	movw	%r9w, 65568(%r8,%rsi)
	movzwl	68(%rdx), %r9d
	movw	%r9w, 65600(%r8,%rsi)
	movzwl	70(%rdx), %r9d
	movw	%r9w, 65632(%r8,%rsi)
	movzwl	72(%rdx), %r9d
	movw	%r9w, 65664(%r8,%rsi)
	movzwl	74(%rdx), %r9d
	movw	%r9w, 65696(%r8,%rsi)
	movzwl	76(%rdx), %r9d
	movw	%r9w, 65728(%r8,%rsi)
	movzwl	78(%rdx), %r9d
	movw	%r9w, 65760(%r8,%rsi)
	movzwl	80(%rdx), %r9d
	movw	%r9w, 65792(%r8,%rsi)
	movzwl	82(%rdx), %r9d
	movw	%r9w, 65824(%r8,%rsi)
	movzwl	84(%rdx), %r9d
	movw	%r9w, 65856(%r8,%rsi)
	movzwl	86(%rdx), %r9d
	movw	%r9w, 65888(%r8,%rsi)
	movzwl	88(%rdx), %r9d
	movw	%r9w, 65920(%r8,%rsi)
	movzwl	90(%rdx), %r9d
	movw	%r9w, 65952(%r8,%rsi)
	movzwl	92(%rdx), %r9d
	movw	%r9w, 65984(%r8,%rsi)
	movzwl	94(%rdx), %r9d
	movw	%r9w, 66016(%r8,%rsi)
	movzwl	96(%rdx), %r9d
	movw	%r9w, 66048(%r8,%rsi)
	movzwl	98(%rdx), %r9d
	movw	%r9w, 66080(%r8,%rsi)
	movzwl	100(%rdx), %r9d
	movw	%r9w, 66112(%r8,%rsi)
	movzwl	102(%rdx), %r9d
	movw	%r9w, 66144(%r8,%rsi)
	movzwl	104(%rdx), %r9d
	movw	%r9w, 66176(%r8,%rsi)
	movzwl	106(%rdx), %r9d
	movw	%r9w, 66208(%r8,%rsi)
	movzwl	108(%rdx), %r9d
	movw	%r9w, 66240(%r8,%rsi)
	movzwl	110(%rdx), %r9d
	movw	%r9w, 66272(%r8,%rsi)
	movzwl	112(%rdx), %r9d
	movw	%r9w, 66304(%r8,%rsi)
	movzwl	114(%rdx), %r9d
	movw	%r9w, 66336(%r8,%rsi)
	movzwl	116(%rdx), %r9d
	movw	%r9w, 66368(%r8,%rsi)
	movzwl	118(%rdx), %r9d
	movw	%r9w, 66400(%r8,%rsi)
	movzwl	120(%rdx), %r9d
	movw	%r9w, 66432(%r8,%rsi)
	movzwl	122(%rdx), %r9d
	movw	%r9w, 66464(%r8,%rsi)
	movzwl	124(%rdx), %r9d
	movw	%r9w, 66496(%r8,%rsi)
	movzwl	126(%rdx), %r9d
	movw	%r9w, 66528(%r8,%rsi)
	vmovups	64(%rcx), %ymm0
	vmovups	96(%rcx), %ymm1
	vmovups	%ymm1, 262176(%rdi,%rax)
	vmovups	%ymm0, 262144(%rdi,%rax)
	movzwl	128(%rdx), %r9d
	movw	%r9w, 131072(%r8,%rsi)
	movzwl	130(%rdx), %r9d
	movw	%r9w, 131104(%r8,%rsi)
	movzwl	132(%rdx), %r9d
	movw	%r9w, 131136(%r8,%rsi)
	movzwl	134(%rdx), %r9d
	movw	%r9w, 131168(%r8,%rsi)
	movzwl	136(%rdx), %r9d
	movw	%r9w, 131200(%r8,%rsi)
	movzwl	138(%rdx), %r9d
	movw	%r9w, 131232(%r8,%rsi)
	movzwl	140(%rdx), %r9d
	movw	%r9w, 131264(%r8,%rsi)
	movzwl	142(%rdx), %r9d
	movw	%r9w, 131296(%r8,%rsi)
	movzwl	144(%rdx), %r9d
	movw	%r9w, 131328(%r8,%rsi)
	movzwl	146(%rdx), %r9d
	movw	%r9w, 131360(%r8,%rsi)
	movzwl	148(%rdx), %r9d
	movw	%r9w, 131392(%r8,%rsi)
	movzwl	150(%rdx), %r9d
	movw	%r9w, 131424(%r8,%rsi)
	movzwl	152(%rdx), %r9d
	movw	%r9w, 131456(%r8,%rsi)
	movzwl	154(%rdx), %r9d
	movw	%r9w, 131488(%r8,%rsi)
	movzwl	156(%rdx), %r9d
	movw	%r9w, 131520(%r8,%rsi)
	movzwl	158(%rdx), %r9d
	movw	%r9w, 131552(%r8,%rsi)
	movzwl	160(%rdx), %r9d
	movw	%r9w, 131584(%r8,%rsi)
	movzwl	162(%rdx), %r9d
	movw	%r9w, 131616(%r8,%rsi)
	movzwl	164(%rdx), %r9d
	movw	%r9w, 131648(%r8,%rsi)
	movzwl	166(%rdx), %r9d
	movw	%r9w, 131680(%r8,%rsi)
	movzwl	168(%rdx), %r9d
	movw	%r9w, 131712(%r8,%rsi)
	movzwl	170(%rdx), %r9d
	movw	%r9w, 131744(%r8,%rsi)
	movzwl	172(%rdx), %r9d
	movw	%r9w, 131776(%r8,%rsi)
	movzwl	174(%rdx), %r9d
	movw	%r9w, 131808(%r8,%rsi)
	movzwl	176(%rdx), %r9d
	movw	%r9w, 131840(%r8,%rsi)
	movzwl	178(%rdx), %r9d
	movw	%r9w, 131872(%r8,%rsi)
	movzwl	180(%rdx), %r9d
	movw	%r9w, 131904(%r8,%rsi)
	movzwl	182(%rdx), %r9d
	movw	%r9w, 131936(%r8,%rsi)
	movzwl	184(%rdx), %r9d
	movw	%r9w, 131968(%r8,%rsi)
	movzwl	186(%rdx), %r9d
	movw	%r9w, 132000(%r8,%rsi)
	movzwl	188(%rdx), %r9d
	movw	%r9w, 132032(%r8,%rsi)
	movzwl	190(%rdx), %edx
	movw	%dx, 132064(%r8,%rsi)
	vmovups	128(%rcx), %ymm0
	vmovups	160(%rcx), %ymm1
	vmovups	%ymm1, 327712(%rdi,%rax)
	vmovups	%ymm0, 327680(%rdi,%rax)
	vzeroupper
	retq
.Lfunc_end0:
	.size	_ZN3fx23opt14attn_kv_insertERNS0_7AttnKVTILi1024EEEiPKaS5_, .Lfunc_end0-_ZN3fx23opt14attn_kv_insertERNS0_7AttnKVTILi1024EEEiPKaS5_
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt14attn_kv_insertERNS0_9AttnKV16TILi1024EEEiPKaS5_,"ax",@progbits
	.globl	_ZN3fx23opt14attn_kv_insertERNS0_9AttnKV16TILi1024EEEiPKaS5_ # -- Begin function _ZN3fx23opt14attn_kv_insertERNS0_9AttnKV16TILi1024EEEiPKaS5_
	.p2align	4, 0x90
	.type	_ZN3fx23opt14attn_kv_insertERNS0_9AttnKV16TILi1024EEEiPKaS5_,@function
_ZN3fx23opt14attn_kv_insertERNS0_9AttnKV16TILi1024EEEiPKaS5_: # @_ZN3fx23opt14attn_kv_insertERNS0_9AttnKV16TILi1024EEEiPKaS5_
	.cfi_startproc
# %bb.0:
                                        # kill: def $esi killed $esi def $rsi
	leal	(%rsi,%rsi), %r8d
	movl	%esi, %eax
	sarl	$4, %eax
	cltq
	andl	$30, %r8d
	leaq	(%rdi,%r8,2), %r8
	vpmovsxbw	(%rdx), %ymm1
	vpmovsxbw	16(%rdx), %ymm2
	vpmovsxbw	32(%rdx), %ymm3
	shlq	$11, %rax
	vpmovsxbw	48(%rdx), %ymm0
	vmovd	%xmm1, (%rax,%r8)
	vpextrd	$1, %xmm1, 64(%rax,%r8)
	vpextrd	$2, %xmm1, 128(%rax,%r8)
	vpextrd	$3, %xmm1, 192(%rax,%r8)
	vextracti128	$1, %ymm1, %xmm1
	vmovd	%xmm1, 256(%rax,%r8)
	vpextrd	$1, %xmm1, 320(%rax,%r8)
	vpextrd	$2, %xmm1, 384(%rax,%r8)
	vpextrd	$3, %xmm1, 448(%rax,%r8)
	vmovd	%xmm2, 512(%rax,%r8)
	vpextrd	$1, %xmm2, 576(%rax,%r8)
	vpextrd	$2, %xmm2, 640(%rax,%r8)
	vpextrd	$3, %xmm2, 704(%rax,%r8)
	vextracti128	$1, %ymm2, %xmm1
	vmovd	%xmm1, 768(%rax,%r8)
	vpextrd	$1, %xmm1, 832(%rax,%r8)
	vpextrd	$2, %xmm1, 896(%rax,%r8)
	vpextrd	$3, %xmm1, 960(%rax,%r8)
	vmovd	%xmm3, 1024(%rax,%r8)
	vpextrd	$1, %xmm3, 1088(%rax,%r8)
	vpextrd	$2, %xmm3, 1152(%rax,%r8)
	vpextrd	$3, %xmm3, 1216(%rax,%r8)
	vextracti128	$1, %ymm3, %xmm1
	vmovd	%xmm1, 1280(%rax,%r8)
	vpextrd	$1, %xmm1, 1344(%rax,%r8)
	vpextrd	$2, %xmm1, 1408(%rax,%r8)
	vpextrd	$3, %xmm1, 1472(%rax,%r8)
	vmovd	%xmm0, 1536(%rax,%r8)
	vpextrd	$1, %xmm0, 1600(%rax,%r8)
	vpextrd	$2, %xmm0, 1664(%rax,%r8)
	vpextrd	$3, %xmm0, 1728(%rax,%r8)
	vextracti128	$1, %ymm0, %xmm0
	vmovd	%xmm0, 1792(%rax,%r8)
	vpextrd	$1, %xmm0, 1856(%rax,%r8)
	vpextrd	$2, %xmm0, 1920(%rax,%r8)
	vpextrd	$3, %xmm0, 1984(%rax,%r8)
	movslq	%esi, %rsi
	shlq	$6, %rsi
	vmovups	(%rcx), %ymm0
	vmovups	32(%rcx), %ymm1
	vmovups	%ymm1, 393248(%rdi,%rsi)
	vmovups	%ymm0, 393216(%rdi,%rsi)
	vpmovsxbw	64(%rdx), %ymm1
	vpmovsxbw	80(%rdx), %ymm2
	vpmovsxbw	96(%rdx), %ymm3
	vpmovsxbw	112(%rdx), %ymm0
	vmovd	%xmm1, 131072(%rax,%r8)
	vpextrd	$1, %xmm1, 131136(%rax,%r8)
	vpextrd	$2, %xmm1, 131200(%rax,%r8)
	vpextrd	$3, %xmm1, 131264(%rax,%r8)
	vextracti128	$1, %ymm1, %xmm1
	vmovd	%xmm1, 131328(%rax,%r8)
	vpextrd	$1, %xmm1, 131392(%rax,%r8)
	vpextrd	$2, %xmm1, 131456(%rax,%r8)
	vpextrd	$3, %xmm1, 131520(%rax,%r8)
	vmovd	%xmm2, 131584(%rax,%r8)
	vpextrd	$1, %xmm2, 131648(%rax,%r8)
	vpextrd	$2, %xmm2, 131712(%rax,%r8)
	vpextrd	$3, %xmm2, 131776(%rax,%r8)
	vextracti128	$1, %ymm2, %xmm1
	vmovd	%xmm1, 131840(%rax,%r8)
	vpextrd	$1, %xmm1, 131904(%rax,%r8)
	vpextrd	$2, %xmm1, 131968(%rax,%r8)
	vpextrd	$3, %xmm1, 132032(%rax,%r8)
	vmovd	%xmm3, 132096(%rax,%r8)
	vpextrd	$1, %xmm3, 132160(%rax,%r8)
	vpextrd	$2, %xmm3, 132224(%rax,%r8)
	vpextrd	$3, %xmm3, 132288(%rax,%r8)
	vextracti128	$1, %ymm3, %xmm1
	vmovd	%xmm1, 132352(%rax,%r8)
	vpextrd	$1, %xmm1, 132416(%rax,%r8)
	vpextrd	$2, %xmm1, 132480(%rax,%r8)
	vpextrd	$3, %xmm1, 132544(%rax,%r8)
	vmovd	%xmm0, 132608(%rax,%r8)
	vpextrd	$1, %xmm0, 132672(%rax,%r8)
	vpextrd	$2, %xmm0, 132736(%rax,%r8)
	vpextrd	$3, %xmm0, 132800(%rax,%r8)
	vextracti128	$1, %ymm0, %xmm0
	vmovd	%xmm0, 132864(%rax,%r8)
	vpextrd	$1, %xmm0, 132928(%rax,%r8)
	vpextrd	$2, %xmm0, 132992(%rax,%r8)
	vpextrd	$3, %xmm0, 133056(%rax,%r8)
	vmovups	64(%rcx), %ymm0
	vmovups	96(%rcx), %ymm1
	vmovups	%ymm1, 458784(%rdi,%rsi)
	vmovups	%ymm0, 458752(%rdi,%rsi)
	vpmovsxbw	128(%rdx), %ymm1
	vpmovsxbw	144(%rdx), %ymm2
	vpmovsxbw	160(%rdx), %ymm3
	vpmovsxbw	176(%rdx), %ymm0
	vmovd	%xmm1, 262144(%rax,%r8)
	vpextrd	$1, %xmm1, 262208(%rax,%r8)
	vpextrd	$2, %xmm1, 262272(%rax,%r8)
	vpextrd	$3, %xmm1, 262336(%rax,%r8)
	vextracti128	$1, %ymm1, %xmm1
	vmovd	%xmm1, 262400(%rax,%r8)
	vpextrd	$1, %xmm1, 262464(%rax,%r8)
	vpextrd	$2, %xmm1, 262528(%rax,%r8)
	vpextrd	$3, %xmm1, 262592(%rax,%r8)
	vmovd	%xmm2, 262656(%rax,%r8)
	vpextrd	$1, %xmm2, 262720(%rax,%r8)
	vpextrd	$2, %xmm2, 262784(%rax,%r8)
	vpextrd	$3, %xmm2, 262848(%rax,%r8)
	vextracti128	$1, %ymm2, %xmm1
	vmovd	%xmm1, 262912(%rax,%r8)
	vpextrd	$1, %xmm1, 262976(%rax,%r8)
	vpextrd	$2, %xmm1, 263040(%rax,%r8)
	vpextrd	$3, %xmm1, 263104(%rax,%r8)
	vmovd	%xmm3, 263168(%rax,%r8)
	vpextrd	$1, %xmm3, 263232(%rax,%r8)
	vpextrd	$2, %xmm3, 263296(%rax,%r8)
	vpextrd	$3, %xmm3, 263360(%rax,%r8)
	vextracti128	$1, %ymm3, %xmm1
	vmovd	%xmm1, 263424(%rax,%r8)
	vpextrd	$1, %xmm1, 263488(%rax,%r8)
	vpextrd	$2, %xmm1, 263552(%rax,%r8)
	vpextrd	$3, %xmm1, 263616(%rax,%r8)
	vmovd	%xmm0, 263680(%rax,%r8)
	vpextrd	$1, %xmm0, 263744(%rax,%r8)
	vpextrd	$2, %xmm0, 263808(%rax,%r8)
	vpextrd	$3, %xmm0, 263872(%rax,%r8)
	vextracti128	$1, %ymm0, %xmm0
	vmovd	%xmm0, 263936(%rax,%r8)
	vpextrd	$1, %xmm0, 264000(%rax,%r8)
	vpextrd	$2, %xmm0, 264064(%rax,%r8)
	vpextrd	$3, %xmm0, 264128(%rax,%r8)
	vmovups	128(%rcx), %ymm0
	vmovups	160(%rcx), %ymm1
	vmovups	%ymm1, 524320(%rdi,%rsi)
	vmovups	%ymm0, 524288(%rdi,%rsi)
	vzeroupper
	retq
.Lfunc_end1:
	.size	_ZN3fx23opt14attn_kv_insertERNS0_9AttnKV16TILi1024EEEiPKaS5_, .Lfunc_end1-_ZN3fx23opt14attn_kv_insertERNS0_9AttnKV16TILi1024EEEiPKaS5_
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt14attn_kv_insertERNS0_10AttnKVF32TILi1024EEEiPKaS5_,"ax",@progbits
	.globl	_ZN3fx23opt14attn_kv_insertERNS0_10AttnKVF32TILi1024EEEiPKaS5_ # -- Begin function _ZN3fx23opt14attn_kv_insertERNS0_10AttnKVF32TILi1024EEEiPKaS5_
	.p2align	4, 0x90
	.type	_ZN3fx23opt14attn_kv_insertERNS0_10AttnKVF32TILi1024EEEiPKaS5_,@function
_ZN3fx23opt14attn_kv_insertERNS0_10AttnKVF32TILi1024EEEiPKaS5_: # @_ZN3fx23opt14attn_kv_insertERNS0_10AttnKVF32TILi1024EEEiPKaS5_
	.cfi_startproc
# %bb.0:
                                        # kill: def $esi killed $esi def $rsi
	movl	%esi, %eax
	sarl	$4, %eax
	movslq	%eax, %r8
	movslq	%esi, %rax
	andl	$15, %esi
	leaq	(%rdi,%rsi,2), %rsi
	shlq	$10, %r8
	movzwl	(%rdx), %r9d
	movw	%r9w, (%r8,%rsi)
	movzwl	2(%rdx), %r9d
	movw	%r9w, 32(%r8,%rsi)
	movzwl	4(%rdx), %r9d
	movw	%r9w, 64(%r8,%rsi)
	movzwl	6(%rdx), %r9d
	movw	%r9w, 96(%r8,%rsi)
	movzwl	8(%rdx), %r9d
	movw	%r9w, 128(%r8,%rsi)
	movzwl	10(%rdx), %r9d
	movw	%r9w, 160(%r8,%rsi)
	movzwl	12(%rdx), %r9d
	movw	%r9w, 192(%r8,%rsi)
	movzwl	14(%rdx), %r9d
	movw	%r9w, 224(%r8,%rsi)
	movzwl	16(%rdx), %r9d
	movw	%r9w, 256(%r8,%rsi)
	movzwl	18(%rdx), %r9d
	movw	%r9w, 288(%r8,%rsi)
	movzwl	20(%rdx), %r9d
	movw	%r9w, 320(%r8,%rsi)
	movzwl	22(%rdx), %r9d
	movw	%r9w, 352(%r8,%rsi)
	movzwl	24(%rdx), %r9d
	movw	%r9w, 384(%r8,%rsi)
	movzwl	26(%rdx), %r9d
	movw	%r9w, 416(%r8,%rsi)
	movzwl	28(%rdx), %r9d
	movw	%r9w, 448(%r8,%rsi)
	movzwl	30(%rdx), %r9d
	movw	%r9w, 480(%r8,%rsi)
	movzwl	32(%rdx), %r9d
	movw	%r9w, 512(%r8,%rsi)
	movzwl	34(%rdx), %r9d
	movw	%r9w, 544(%r8,%rsi)
	movzwl	36(%rdx), %r9d
	movw	%r9w, 576(%r8,%rsi)
	movzwl	38(%rdx), %r9d
	movw	%r9w, 608(%r8,%rsi)
	movzwl	40(%rdx), %r9d
	movw	%r9w, 640(%r8,%rsi)
	movzwl	42(%rdx), %r9d
	movw	%r9w, 672(%r8,%rsi)
	movzwl	44(%rdx), %r9d
	movw	%r9w, 704(%r8,%rsi)
	movzwl	46(%rdx), %r9d
	movw	%r9w, 736(%r8,%rsi)
	movzwl	48(%rdx), %r9d
	movw	%r9w, 768(%r8,%rsi)
	movzwl	50(%rdx), %r9d
	movw	%r9w, 800(%r8,%rsi)
	movzwl	52(%rdx), %r9d
	movw	%r9w, 832(%r8,%rsi)
	movzwl	54(%rdx), %r9d
	movw	%r9w, 864(%r8,%rsi)
	movzwl	56(%rdx), %r9d
	movw	%r9w, 896(%r8,%rsi)
	movzwl	58(%rdx), %r9d
	movw	%r9w, 928(%r8,%rsi)
	movzwl	60(%rdx), %r9d
	movw	%r9w, 960(%r8,%rsi)
	movzwl	62(%rdx), %r9d
	movw	%r9w, 992(%r8,%rsi)
	shlq	$8, %rax
	vpmovsxbd	(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196608(%rdi,%rax)
	vpmovsxbd	8(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196640(%rdi,%rax)
	vpmovsxbd	16(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196672(%rdi,%rax)
	vpmovsxbd	24(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196704(%rdi,%rax)
	vpmovsxbd	32(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196736(%rdi,%rax)
	vpmovsxbd	40(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196768(%rdi,%rax)
	vpmovsxbd	48(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196800(%rdi,%rax)
	vpmovsxbd	56(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196832(%rdi,%rax)
	movzwl	64(%rdx), %r9d
	movw	%r9w, 65536(%r8,%rsi)
	movzwl	66(%rdx), %r9d
	movw	%r9w, 65568(%r8,%rsi)
	movzwl	68(%rdx), %r9d
	movw	%r9w, 65600(%r8,%rsi)
	movzwl	70(%rdx), %r9d
	movw	%r9w, 65632(%r8,%rsi)
	movzwl	72(%rdx), %r9d
	movw	%r9w, 65664(%r8,%rsi)
	movzwl	74(%rdx), %r9d
	movw	%r9w, 65696(%r8,%rsi)
	movzwl	76(%rdx), %r9d
	movw	%r9w, 65728(%r8,%rsi)
	movzwl	78(%rdx), %r9d
	movw	%r9w, 65760(%r8,%rsi)
	movzwl	80(%rdx), %r9d
	movw	%r9w, 65792(%r8,%rsi)
	movzwl	82(%rdx), %r9d
	movw	%r9w, 65824(%r8,%rsi)
	movzwl	84(%rdx), %r9d
	movw	%r9w, 65856(%r8,%rsi)
	movzwl	86(%rdx), %r9d
	movw	%r9w, 65888(%r8,%rsi)
	movzwl	88(%rdx), %r9d
	movw	%r9w, 65920(%r8,%rsi)
	movzwl	90(%rdx), %r9d
	movw	%r9w, 65952(%r8,%rsi)
	movzwl	92(%rdx), %r9d
	movw	%r9w, 65984(%r8,%rsi)
	movzwl	94(%rdx), %r9d
	movw	%r9w, 66016(%r8,%rsi)
	movzwl	96(%rdx), %r9d
	movw	%r9w, 66048(%r8,%rsi)
	movzwl	98(%rdx), %r9d
	movw	%r9w, 66080(%r8,%rsi)
	movzwl	100(%rdx), %r9d
	movw	%r9w, 66112(%r8,%rsi)
	movzwl	102(%rdx), %r9d
	movw	%r9w, 66144(%r8,%rsi)
	movzwl	104(%rdx), %r9d
	movw	%r9w, 66176(%r8,%rsi)
	movzwl	106(%rdx), %r9d
	movw	%r9w, 66208(%r8,%rsi)
	movzwl	108(%rdx), %r9d
	movw	%r9w, 66240(%r8,%rsi)
	movzwl	110(%rdx), %r9d
	movw	%r9w, 66272(%r8,%rsi)
	movzwl	112(%rdx), %r9d
	movw	%r9w, 66304(%r8,%rsi)
	movzwl	114(%rdx), %r9d
	movw	%r9w, 66336(%r8,%rsi)
	movzwl	116(%rdx), %r9d
	movw	%r9w, 66368(%r8,%rsi)
	movzwl	118(%rdx), %r9d
	movw	%r9w, 66400(%r8,%rsi)
	movzwl	120(%rdx), %r9d
	movw	%r9w, 66432(%r8,%rsi)
	movzwl	122(%rdx), %r9d
	movw	%r9w, 66464(%r8,%rsi)
	movzwl	124(%rdx), %r9d
	movw	%r9w, 66496(%r8,%rsi)
	movzwl	126(%rdx), %r9d
	movw	%r9w, 66528(%r8,%rsi)
	vpmovsxbd	64(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458752(%rdi,%rax)
	vpmovsxbd	72(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458784(%rdi,%rax)
	vpmovsxbd	80(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458816(%rdi,%rax)
	vpmovsxbd	88(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458848(%rdi,%rax)
	vpmovsxbd	96(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458880(%rdi,%rax)
	vpmovsxbd	104(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458912(%rdi,%rax)
	vpmovsxbd	112(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458944(%rdi,%rax)
	vpmovsxbd	120(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458976(%rdi,%rax)
	movzwl	128(%rdx), %r9d
	movw	%r9w, 131072(%r8,%rsi)
	movzwl	130(%rdx), %r9d
	movw	%r9w, 131104(%r8,%rsi)
	movzwl	132(%rdx), %r9d
	movw	%r9w, 131136(%r8,%rsi)
	movzwl	134(%rdx), %r9d
	movw	%r9w, 131168(%r8,%rsi)
	movzwl	136(%rdx), %r9d
	movw	%r9w, 131200(%r8,%rsi)
	movzwl	138(%rdx), %r9d
	movw	%r9w, 131232(%r8,%rsi)
	movzwl	140(%rdx), %r9d
	movw	%r9w, 131264(%r8,%rsi)
	movzwl	142(%rdx), %r9d
	movw	%r9w, 131296(%r8,%rsi)
	movzwl	144(%rdx), %r9d
	movw	%r9w, 131328(%r8,%rsi)
	movzwl	146(%rdx), %r9d
	movw	%r9w, 131360(%r8,%rsi)
	movzwl	148(%rdx), %r9d
	movw	%r9w, 131392(%r8,%rsi)
	movzwl	150(%rdx), %r9d
	movw	%r9w, 131424(%r8,%rsi)
	movzwl	152(%rdx), %r9d
	movw	%r9w, 131456(%r8,%rsi)
	movzwl	154(%rdx), %r9d
	movw	%r9w, 131488(%r8,%rsi)
	movzwl	156(%rdx), %r9d
	movw	%r9w, 131520(%r8,%rsi)
	movzwl	158(%rdx), %r9d
	movw	%r9w, 131552(%r8,%rsi)
	movzwl	160(%rdx), %r9d
	movw	%r9w, 131584(%r8,%rsi)
	movzwl	162(%rdx), %r9d
	movw	%r9w, 131616(%r8,%rsi)
	movzwl	164(%rdx), %r9d
	movw	%r9w, 131648(%r8,%rsi)
	movzwl	166(%rdx), %r9d
	movw	%r9w, 131680(%r8,%rsi)
	movzwl	168(%rdx), %r9d
	movw	%r9w, 131712(%r8,%rsi)
	movzwl	170(%rdx), %r9d
	movw	%r9w, 131744(%r8,%rsi)
	movzwl	172(%rdx), %r9d
	movw	%r9w, 131776(%r8,%rsi)
	movzwl	174(%rdx), %r9d
	movw	%r9w, 131808(%r8,%rsi)
	movzwl	176(%rdx), %r9d
	movw	%r9w, 131840(%r8,%rsi)
	movzwl	178(%rdx), %r9d
	movw	%r9w, 131872(%r8,%rsi)
	movzwl	180(%rdx), %r9d
	movw	%r9w, 131904(%r8,%rsi)
	movzwl	182(%rdx), %r9d
	movw	%r9w, 131936(%r8,%rsi)
	movzwl	184(%rdx), %r9d
	movw	%r9w, 131968(%r8,%rsi)
	movzwl	186(%rdx), %r9d
	movw	%r9w, 132000(%r8,%rsi)
	movzwl	188(%rdx), %r9d
	movw	%r9w, 132032(%r8,%rsi)
	movzwl	190(%rdx), %edx
	movw	%dx, 132064(%r8,%rsi)
	vpmovsxbd	128(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 720896(%rdi,%rax)
	vpmovsxbd	136(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 720928(%rdi,%rax)
	vpmovsxbd	144(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 720960(%rdi,%rax)
	vpmovsxbd	152(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 720992(%rdi,%rax)
	vpmovsxbd	160(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 721024(%rdi,%rax)
	vpmovsxbd	168(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 721056(%rdi,%rax)
	vpmovsxbd	176(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 721088(%rdi,%rax)
	vpmovsxbd	184(%rcx), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 721120(%rdi,%rax)
	vzeroupper
	retq
.Lfunc_end2:
	.size	_ZN3fx23opt14attn_kv_insertERNS0_10AttnKVF32TILi1024EEEiPKaS5_, .Lfunc_end2-_ZN3fx23opt14attn_kv_insertERNS0_10AttnKVF32TILi1024EEEiPKaS5_
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt13attn_step_varERKNS0_7AttnKVTILi1024EEEPKaPKfS8_iPffPi,"ax",@progbits
	.globl	_ZN3fx23opt13attn_step_varERKNS0_7AttnKVTILi1024EEEPKaPKfS8_iPffPi # -- Begin function _ZN3fx23opt13attn_step_varERKNS0_7AttnKVTILi1024EEEPKaPKfS8_iPffPi
	.p2align	4, 0x90
	.type	_ZN3fx23opt13attn_step_varERKNS0_7AttnKVTILi1024EEEPKaPKfS8_iPffPi,@function
_ZN3fx23opt13attn_step_varERKNS0_7AttnKVTILi1024EEEPKaPKfS8_iPffPi: # @_ZN3fx23opt13attn_step_varERKNS0_7AttnKVTILi1024EEEPKaPKfS8_iPffPi
	.cfi_startproc
# %bb.0:
	jmp	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi # TAILCALL
.Lfunc_end3:
	.size	_ZN3fx23opt13attn_step_varERKNS0_7AttnKVTILi1024EEEPKaPKfS8_iPffPi, .Lfunc_end3-_ZN3fx23opt13attn_step_varERKNS0_7AttnKVTILi1024EEEPKaPKfS8_iPffPi
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi
.LCPI4_0:
	.long	0x7149f2ca                      # float 1.00000002E+30
	.section	.text._ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi,"ax",@progbits
	.p2align	4, 0x90
	.type	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi,@function
_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi: # @_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi
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
	andq	$-32, %rsp
	subq	$224, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, 40(%rsp)                   # 8-byte Spill
	movl	%r8d, %r14d
	movq	%rcx, %r13
	movq	%rsi, %r12
	movq	%rdi, %r15
	vxorps	%xmm1, %xmm1, %xmm1
	vcmpltss	%xmm0, %xmm1, %xmm1
	vbroadcastss	.LCPI4_0(%rip), %xmm2   # xmm2 = [1.00000002E+30,1.00000002E+30,1.00000002E+30,1.00000002E+30]
	vblendvps	%xmm1, %xmm0, %xmm2, %xmm0
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpmovsxbw	(%rsi), %ymm0
	movq	16(%rbp), %rbx
	vmovdqa	%ymm0, 64(%rsp)
	vpmovsxbw	16(%rsi), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	32(%rsi), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	48(%rsi), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	movq	%rdx, 24(%rsp)                  # 8-byte Spill
	vmovss	(%rdx), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	leaq	64(%rsp), %rsi
	movl	%r8d, %edx
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
	leaq	20(%rsp), %rsi
	movl	%r14d, %edi
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	leal	(%r14,%r14,2), %ecx
	testq	%rbx, %rbx
	movq	%r13, 32(%rsp)                  # 8-byte Spill
	je	.LBB4_3
# %bb.1:
	movl	20(%rsp), %eax
	movl	%eax, (%rbx)
	leaq	196608(%r15), %rdi
	vmovss	(%r13), %xmm1                   # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	shll	$2, %eax
	cmpl	%ecx, %eax
	movl	%ecx, %r13d
	movl	%r14d, %esi
	jge	.LBB4_5
# %bb.2:
	movq	40(%rsp), %rbx                  # 8-byte Reload
	movq	%rbx, %rdx
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf
	jmp	.LBB4_6
.LBB4_3:
	leaq	196608(%r15), %rdi
	movl	20(%rsp), %eax
	vmovss	(%r13), %xmm1                   # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	shll	$2, %eax
	cmpl	%ecx, %eax
	movl	%ecx, %r13d
	movq	40(%rsp), %rbx                  # 8-byte Reload
	movl	%r14d, %esi
	movq	%rbx, %rdx
	jge	.LBB4_12
# %bb.4:
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf
	jmp	.LBB4_13
.LBB4_5:
	movq	40(%rsp), %rbx                  # 8-byte Reload
	movq	%rbx, %rdx
	callq	_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf
.LBB4_6:
	vpmovsxbw	64(%r12), %ymm0
	vmovdqa	%ymm0, 64(%rsp)
	vpmovsxbw	80(%r12), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	96(%r12), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	112(%r12), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	leaq	65536(%r15), %rdi
	movq	24(%rsp), %rax                  # 8-byte Reload
	vmovss	4(%rax), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	leaq	64(%rsp), %rsi
	movl	%r14d, %edx
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
	leaq	20(%rsp), %rsi
	movl	%r14d, %edi
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	movl	20(%rsp), %eax
	movq	16(%rbp), %rcx
	movl	%eax, 4(%rcx)
	leaq	262144(%r15), %rdi
	movq	32(%rsp), %rcx                  # 8-byte Reload
	vmovss	4(%rcx), %xmm1                  # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	leaq	256(%rbx), %rdx
	shll	$2, %eax
	movl	%r14d, %esi
	cmpl	%r13d, %eax
	jge	.LBB4_8
# %bb.7:
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf
	jmp	.LBB4_9
.LBB4_8:
	callq	_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf
.LBB4_9:
	vpmovsxbw	128(%r12), %ymm0
	vmovdqa	%ymm0, 64(%rsp)
	vpmovsxbw	144(%r12), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	160(%r12), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	176(%r12), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	leaq	131072(%r15), %rdi
	movq	24(%rsp), %rax                  # 8-byte Reload
	vmovss	8(%rax), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	leaq	64(%rsp), %rsi
	movl	%r14d, %edx
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
	leaq	20(%rsp), %rsi
	movl	%r14d, %edi
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	movl	20(%rsp), %eax
	movq	16(%rbp), %rcx
	movl	%eax, 8(%rcx)
	addq	$327680, %r15                   # imm = 0x50000
	jmp	.LBB4_10
.LBB4_12:
	callq	_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf
.LBB4_13:
	vpmovsxbw	64(%r12), %ymm0
	vmovdqa	%ymm0, 64(%rsp)
	vpmovsxbw	80(%r12), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	96(%r12), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	112(%r12), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	leaq	65536(%r15), %rdi
	movq	24(%rsp), %rax                  # 8-byte Reload
	vmovss	4(%rax), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	leaq	64(%rsp), %rsi
	movl	%r14d, %edx
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
	leaq	20(%rsp), %rsi
	movl	%r14d, %edi
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	leaq	262144(%r15), %rdi
	movl	20(%rsp), %eax
	movq	32(%rsp), %rcx                  # 8-byte Reload
	vmovss	4(%rcx), %xmm1                  # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	leaq	256(%rbx), %rdx
	shll	$2, %eax
	movl	%r14d, %esi
	cmpl	%r13d, %eax
	jge	.LBB4_15
# %bb.14:
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf
	jmp	.LBB4_16
.LBB4_15:
	callq	_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf
.LBB4_16:
	vpmovsxbw	128(%r12), %ymm0
	vmovdqa	%ymm0, 64(%rsp)
	vpmovsxbw	144(%r12), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	160(%r12), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	176(%r12), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	leaq	131072(%r15), %rdi
	movq	24(%rsp), %rax                  # 8-byte Reload
	vmovss	8(%rax), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	leaq	64(%rsp), %rsi
	movl	%r14d, %edx
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
	leaq	20(%rsp), %rsi
	movl	%r14d, %edi
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	addq	$327680, %r15                   # imm = 0x50000
	movl	20(%rsp), %eax
.LBB4_10:
	movq	32(%rsp), %rcx                  # 8-byte Reload
	vmovss	8(%rcx), %xmm1                  # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	addq	$512, %rbx                      # imm = 0x200
	shll	$2, %eax
	movq	%r15, %rdi
	movl	%r14d, %esi
	movq	%rbx, %rdx
	cmpl	%r13d, %eax
	jge	.LBB4_11
# %bb.17:
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf
	jmp	.LBB4_18
.LBB4_11:
	callq	_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf
.LBB4_18:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi, .Lfunc_end4-_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _ZN3fx23opt13attn_step_varERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_iPffPi
.LCPI5_0:
	.long	0x7149f2ca                      # float 1.00000002E+30
.LCPI5_1:
	.long	0xff800000                      # float -Inf
	.section	.text._ZN3fx23opt13attn_step_varERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_iPffPi,"ax",@progbits
	.globl	_ZN3fx23opt13attn_step_varERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_iPffPi
	.p2align	4, 0x90
	.type	_ZN3fx23opt13attn_step_varERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_iPffPi,@function
_ZN3fx23opt13attn_step_varERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_iPffPi: # @_ZN3fx23opt13attn_step_varERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_iPffPi
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
	andq	$-32, %rsp
	subq	$352, %rsp                      # imm = 0x160
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, 136(%rsp)                  # 8-byte Spill
                                        # kill: def $r8d killed $r8d def $r8
	movq	%rcx, 128(%rsp)                 # 8-byte Spill
	movq	%rdx, 120(%rsp)                 # 8-byte Spill
	movq	%rsi, 112(%rsp)                 # 8-byte Spill
	movq	%rdi, 56(%rsp)                  # 8-byte Spill
	vxorps	%xmm1, %xmm1, %xmm1
	vcmpltss	%xmm0, %xmm1, %xmm1
	vbroadcastss	.LCPI5_0(%rip), %xmm2   # xmm2 = [1.00000002E+30,1.00000002E+30,1.00000002E+30,1.00000002E+30]
	vblendvps	%xmm1, %xmm0, %xmm2, %xmm0
	vmovaps	%xmm0, 144(%rsp)                # 16-byte Spill
	movl	%r8d, %eax
	andl	$-32, %eax
	movl	%r8d, %ecx
	andl	$31, %ecx
	movl	%r8d, %r12d
	shrl	$5, %r12d
	leal	31(%r8), %edx
	andl	$-32, %edx
	movq	%r8, 16(%rsp)                   # 8-byte Spill
	movslq	%r8d, %rsi
	movl	%edx, 28(%rsp)                  # 4-byte Spill
	movslq	%edx, %r15
	movq	%r15, %rdx
	subq	%rsi, %rdx
	movq	%rcx, 104(%rsp)                 # 8-byte Spill
	addl	$15, %ecx
	andl	$-16, %ecx
	movl	%ecx, 32(%rsp)                  # 4-byte Spill
	movq	%rdx, 48(%rsp)                  # 8-byte Spill
	andq	$-32, %rdx
	vbroadcastss	.LCPI5_1(%rip), %ymm9   # ymm9 = [-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf]
	movl	%eax, 36(%rsp)                  # 4-byte Spill
	cltq
	leal	(%rsi,%rsi,2), %ecx
	movl	%ecx, 40(%rsp)                  # 4-byte Spill
	movq	%rdx, 72(%rsp)                  # 8-byte Spill
	leaq	(%rdx,%rsi), %rcx
	movq	%rcx, 64(%rsp)                  # 8-byte Spill
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %r9
	movq	%rsi, 80(%rsp)                  # 8-byte Spill
	leaq	96(%r9,%rsi,4), %r13
	movq	%rax, 96(%rsp)                  # 8-byte Spill
	leaq	(%r9,%rax,4), %rax
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	xorl	%r14d, %r14d
	vmovaps	%ymm9, 160(%rsp)                # 32-byte Spill
	jmp	.LBB5_1
	.p2align	4, 0x90
.LBB5_27:                               #   in Loop: Header=BB5_1 Depth=1
	movq	16(%rsp), %rsi                  # 8-byte Reload
                                        # kill: def $esi killed $esi killed $rsi
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf
.LBB5_28:                               #   in Loop: Header=BB5_1 Depth=1
	vmovaps	160(%rsp), %ymm9                # 32-byte Reload
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %r9
	incq	%r14
	cmpq	$3, %r14
	je	.LBB5_29
.LBB5_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_24 Depth 2
                                        #       Child Loop BB5_25 Depth 3
                                        #     Child Loop BB5_5 Depth 2
                                        #     Child Loop BB5_8 Depth 2
                                        #     Child Loop BB5_13 Depth 2
                                        #     Child Loop BB5_16 Depth 2
                                        #     Child Loop BB5_18 Depth 2
	movq	%r14, %rbx
	shlq	$6, %rbx
	movq	112(%rsp), %rax                 # 8-byte Reload
	vpmovsxbw	(%rax,%rbx), %ymm0
	vmovdqa	%ymm0, 192(%rsp)
	vpmovsxbw	16(%rax,%rbx), %ymm0
	movq	%r14, %rsi
	vmovdqa	%ymm0, 224(%rsp)
	vpmovsxbw	32(%rax,%rbx), %ymm0
	shlq	$17, %rsi
	vmovdqa	%ymm0, 256(%rsp)
	vpmovsxbw	48(%rax,%rbx), %ymm0
	addq	56(%rsp), %rsi                  # 8-byte Folded Reload
	vmovdqa	%ymm0, 288(%rsp)
	movq	120(%rsp), %rax                 # 8-byte Reload
	vbroadcastss	(%rax,%r14,4), %ymm1
	cmpl	$32, 16(%rsp)                   # 4-byte Folded Reload
	jl	.LBB5_2
# %bb.23:                               #   in Loop: Header=BB5_1 Depth=1
	xorl	%edx, %edx
	vmovaps	%ymm9, %ymm0
	movq	%r9, %rax
	.p2align	4, 0x90
.LBB5_24:                               #   Parent Loop BB5_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB5_25 Depth 3
	leaq	4096(%rsi), %rcx
	vxorps	%xmm2, %xmm2, %xmm2
	movq	$-2, %rdi
	movl	$1024, %r8d                     # imm = 0x400
	vpxor	%xmm5, %xmm5, %xmm5
	vpxor	%xmm4, %xmm4, %xmm4
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_25:                               #   Parent Loop BB5_1 Depth=1
                                        #     Parent Loop BB5_24 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	prefetcht0	(%rsi,%r8,4)
	prefetcht0	64(%rsi,%r8,4)
	vpbroadcastd	200(%rsp,%rdi,4), %ymm6
	vpmaddwd	-2048(%rsi,%r8,2), %ymm6, %ymm7
	vpaddd	%ymm2, %ymm7, %ymm2
	vpmaddwd	-2016(%rsi,%r8,2), %ymm6, %ymm7
	vpaddd	%ymm5, %ymm7, %ymm5
	vpmaddwd	(%rsi,%r8,2), %ymm6, %ymm7
	vpaddd	%ymm4, %ymm7, %ymm4
	vpmaddwd	32(%rsi,%r8,2), %ymm6, %ymm6
	vpbroadcastd	204(%rsp,%rdi,4), %ymm7
	vpaddd	%ymm3, %ymm6, %ymm3
	vpmaddwd	-1984(%rsi,%r8,2), %ymm7, %ymm6
	vpaddd	%ymm6, %ymm2, %ymm2
	vpmaddwd	-1952(%rsi,%r8,2), %ymm7, %ymm6
	vpmaddwd	64(%rsi,%r8,2), %ymm7, %ymm8
	vpaddd	%ymm6, %ymm5, %ymm5
	vpaddd	%ymm4, %ymm8, %ymm4
	vpmaddwd	96(%rsi,%r8,2), %ymm7, %ymm6
	vpaddd	%ymm6, %ymm3, %ymm3
	addq	$2, %rdi
	addq	$64, %r8
	cmpq	$30, %rdi
	jb	.LBB5_25
# %bb.26:                               #   in Loop: Header=BB5_24 Depth=2
	vcvtdq2ps	%ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm2
	vcvtdq2ps	%ymm5, %ymm5
	vmulps	%ymm5, %ymm1, %ymm5
	vcvtdq2ps	%ymm4, %ymm4
	vmulps	%ymm4, %ymm1, %ymm4
	vcvtdq2ps	%ymm3, %ymm3
	vmulps	%ymm3, %ymm1, %ymm3
	vmovaps	%ymm2, (%rax)
	vmovaps	%ymm5, 32(%rax)
	vmovaps	%ymm4, 64(%rax)
	vmovaps	%ymm3, 96(%rax)
	vmaxps	%ymm5, %ymm2, %ymm2
	vmaxps	%ymm3, %ymm4, %ymm3
	vmaxps	%ymm3, %ymm2, %ymm2
	vmaxps	%ymm2, %ymm0, %ymm0
	incl	%edx
	subq	$-128, %rax
	movq	%rcx, %rsi
	cmpl	%r12d, %edx
	jne	.LBB5_24
# %bb.3:                                #   in Loop: Header=BB5_1 Depth=1
	cmpl	$0, 104(%rsp)                   # 4-byte Folded Reload
	jne	.LBB5_4
	jmp	.LBB5_19
	.p2align	4, 0x90
.LBB5_2:                                #   in Loop: Header=BB5_1 Depth=1
	movq	%r9, %rax
	movq	%rsi, %rcx
	vmovaps	%ymm9, %ymm0
	cmpl	$0, 104(%rsp)                   # 4-byte Folded Reload
	je	.LBB5_19
.LBB5_4:                                #   in Loop: Header=BB5_1 Depth=1
	leaq	96(%rcx), %rdx
	vxorps	%xmm2, %xmm2, %xmm2
	xorl	%esi, %esi
	vxorps	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_5:                                #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpbroadcastd	192(%rsp,%rsi,4), %ymm4
	vpmaddwd	-96(%rdx), %ymm4, %ymm5
	vpaddd	%ymm3, %ymm5, %ymm3
	vpmaddwd	-64(%rdx), %ymm4, %ymm4
	vpbroadcastd	196(%rsp,%rsi,4), %ymm5
	vpmaddwd	-32(%rdx), %ymm5, %ymm6
	vpaddd	%ymm2, %ymm4, %ymm2
	vpaddd	%ymm3, %ymm6, %ymm3
	vpmaddwd	(%rdx), %ymm5, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	addq	$2, %rsi
	subq	$-128, %rdx
	cmpq	$32, %rsi
	jne	.LBB5_5
# %bb.6:                                #   in Loop: Header=BB5_1 Depth=1
	vcvtdq2ps	%ymm3, %ymm3
	vmulps	%ymm3, %ymm1, %ymm3
	vmovaps	%ymm3, (%rax)
	vcvtdq2ps	%ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm2
	vmovaps	%ymm2, 32(%rax)
	cmpl	$16, 32(%rsp)                   # 4-byte Folded Reload
	je	.LBB5_10
# %bb.7:                                #   in Loop: Header=BB5_1 Depth=1
	addq	$2144, %rcx                     # imm = 0x860
	vxorps	%xmm2, %xmm2, %xmm2
	xorl	%edx, %edx
	vxorps	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB5_8:                                #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vpbroadcastd	192(%rsp,%rdx,4), %ymm4
	vpmaddwd	-96(%rcx), %ymm4, %ymm5
	vpaddd	%ymm3, %ymm5, %ymm3
	vpmaddwd	-64(%rcx), %ymm4, %ymm4
	vpbroadcastd	196(%rsp,%rdx,4), %ymm5
	vpmaddwd	-32(%rcx), %ymm5, %ymm6
	vpaddd	%ymm2, %ymm4, %ymm2
	vpaddd	%ymm3, %ymm6, %ymm3
	vpmaddwd	(%rcx), %ymm5, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	addq	$2, %rdx
	subq	$-128, %rcx
	cmpq	$32, %rdx
	jne	.LBB5_8
# %bb.9:                                #   in Loop: Header=BB5_1 Depth=1
	vcvtdq2ps	%ymm3, %ymm3
	vmulps	%ymm3, %ymm1, %ymm3
	vmovaps	%ymm3, 64(%rax)
	vcvtdq2ps	%ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovaps	%ymm1, 96(%rax)
.LBB5_10:                               #   in Loop: Header=BB5_1 Depth=1
	movl	28(%rsp), %eax                  # 4-byte Reload
	cmpl	16(%rsp), %eax                  # 4-byte Folded Reload
	jle	.LBB5_17
# %bb.11:                               #   in Loop: Header=BB5_1 Depth=1
	movq	80(%rsp), %rax                  # 8-byte Reload
	cmpq	$32, 48(%rsp)                   # 8-byte Folded Reload
	jb	.LBB5_15
# %bb.12:                               #   in Loop: Header=BB5_1 Depth=1
	xorl	%eax, %eax
	movq	72(%rsp), %rcx                  # 8-byte Reload
	.p2align	4, 0x90
.LBB5_13:                               #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmovups	%ymm9, -96(%r13,%rax,4)
	vmovups	%ymm9, -64(%r13,%rax,4)
	vmovups	%ymm9, -32(%r13,%rax,4)
	vmovups	%ymm9, (%r13,%rax,4)
	addq	$32, %rax
	cmpq	%rax, %rcx
	jne	.LBB5_13
# %bb.14:                               #   in Loop: Header=BB5_1 Depth=1
	movq	64(%rsp), %rax                  # 8-byte Reload
	cmpq	%rcx, 48(%rsp)                  # 8-byte Folded Reload
	je	.LBB5_17
.LBB5_15:                               #   in Loop: Header=BB5_1 Depth=1
	movq	%r15, %rcx
	subq	%rax, %rcx
	shlq	$2, %rax
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB5_16:                               #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	(%rax,%rdx,4), %rsi
	movl	$-8388608, (%r9,%rsi)           # imm = 0xFF800000
	incq	%rdx
	cmpq	%rdx, %rcx
	jne	.LBB5_16
.LBB5_17:                               #   in Loop: Header=BB5_1 Depth=1
	movq	88(%rsp), %rax                  # 8-byte Reload
	movq	96(%rsp), %rcx                  # 8-byte Reload
	movl	28(%rsp), %edx                  # 4-byte Reload
	cmpl	%edx, 36(%rsp)                  # 4-byte Folded Reload
	jge	.LBB5_19
	.p2align	4, 0x90
.LBB5_18:                               #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	vmaxps	(%rax), %ymm0, %ymm0
	addq	$8, %rcx
	addq	$32, %rax
	cmpq	%r15, %rcx
	jl	.LBB5_18
.LBB5_19:                               #   in Loop: Header=BB5_1 Depth=1
	vextractf128	$1, %ymm0, %xmm1
	vmaxps	%xmm1, %xmm0, %xmm0
	vshufpd	$3, %xmm0, %xmm0, %xmm1         # xmm1 = xmm0[1,1]
	vmaxps	%xmm1, %xmm0, %xmm0
	vmovshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
	vmaxss	%xmm1, %xmm0, %xmm0
	movq	16(%rsp), %rdi                  # 8-byte Reload
                                        # kill: def $edi killed $edi killed $rdi
	vmovaps	144(%rsp), %xmm1                # 16-byte Reload
	leaq	44(%rsp), %rsi
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	movl	44(%rsp), %eax
	movq	16(%rbp), %rcx
	testq	%rcx, %rcx
	je	.LBB5_21
# %bb.20:                               #   in Loop: Header=BB5_1 Depth=1
	movl	%eax, (%rcx,%r14,4)
.LBB5_21:                               #   in Loop: Header=BB5_1 Depth=1
	movq	%r14, %rcx
	shlq	$16, %rcx
	movq	56(%rsp), %rdx                  # 8-byte Reload
	leaq	(%rdx,%rcx), %rdi
	addq	$393216, %rdi                   # imm = 0x60000
	movq	128(%rsp), %rcx                 # 8-byte Reload
	vmovss	(%rcx,%r14,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	movq	136(%rsp), %rcx                 # 8-byte Reload
	leaq	(%rcx,%rbx,4), %rdx
	shll	$2, %eax
	cmpl	40(%rsp), %eax                  # 4-byte Folded Reload
	jl	.LBB5_27
# %bb.22:                               #   in Loop: Header=BB5_1 Depth=1
	movq	16(%rsp), %rsi                  # 8-byte Reload
                                        # kill: def $esi killed $esi killed $rsi
	callq	_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf
	jmp	.LBB5_28
.LBB5_29:
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
.Lfunc_end5:
	.size	_ZN3fx23opt13attn_step_varERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_iPffPi, .Lfunc_end5-_ZN3fx23opt13attn_step_varERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_iPffPi
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt13attn_step_varERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_iPffPi,"ax",@progbits
	.globl	_ZN3fx23opt13attn_step_varERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_iPffPi # -- Begin function _ZN3fx23opt13attn_step_varERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_iPffPi
	.p2align	4, 0x90
	.type	_ZN3fx23opt13attn_step_varERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_iPffPi,@function
_ZN3fx23opt13attn_step_varERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_iPffPi: # @_ZN3fx23opt13attn_step_varERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_iPffPi
	.cfi_startproc
# %bb.0:
	jmp	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi # TAILCALL
.Lfunc_end6:
	.size	_ZN3fx23opt13attn_step_varERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_iPffPi, .Lfunc_end6-_ZN3fx23opt13attn_step_varERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_iPffPi
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi
.LCPI7_0:
	.long	0x7149f2ca                      # float 1.00000002E+30
	.section	.text._ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi,"ax",@progbits
	.p2align	4, 0x90
	.type	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi,@function
_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi: # @_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi
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
	andq	$-32, %rsp
	subq	$224, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, 40(%rsp)                   # 8-byte Spill
	movl	%r8d, %r14d
	movq	%rcx, %r13
	movq	%rsi, %r12
	movq	%rdi, %r15
	vxorps	%xmm1, %xmm1, %xmm1
	vcmpltss	%xmm0, %xmm1, %xmm1
	vbroadcastss	.LCPI7_0(%rip), %xmm2   # xmm2 = [1.00000002E+30,1.00000002E+30,1.00000002E+30,1.00000002E+30]
	vblendvps	%xmm1, %xmm0, %xmm2, %xmm0
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	vpmovsxbw	(%rsi), %ymm0
	movq	16(%rbp), %rbx
	vmovdqa	%ymm0, 64(%rsp)
	vpmovsxbw	16(%rsi), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	32(%rsi), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	48(%rsi), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	movq	%rdx, 24(%rsp)                  # 8-byte Spill
	vmovss	(%rdx), %xmm0                   # xmm0 = mem[0],zero,zero,zero
	leaq	64(%rsp), %rsi
	movl	%r8d, %edx
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
	leaq	20(%rsp), %rsi
	movl	%r14d, %edi
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	leal	(%r14,%r14,2), %ecx
	testq	%rbx, %rbx
	movq	%r13, 32(%rsp)                  # 8-byte Spill
	je	.LBB7_3
# %bb.1:
	movl	20(%rsp), %eax
	movl	%eax, (%rbx)
	leaq	196608(%r15), %rdi
	vmovss	(%r13), %xmm1                   # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	shll	$2, %eax
	cmpl	%ecx, %eax
	movl	%ecx, %r13d
	movl	%r14d, %esi
	jge	.LBB7_5
# %bb.2:
	movq	40(%rsp), %rbx                  # 8-byte Reload
	movq	%rbx, %rdx
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf
	jmp	.LBB7_6
.LBB7_3:
	leaq	196608(%r15), %rdi
	movl	20(%rsp), %eax
	vmovss	(%r13), %xmm1                   # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	shll	$2, %eax
	cmpl	%ecx, %eax
	movl	%ecx, %r13d
	movq	40(%rsp), %rbx                  # 8-byte Reload
	movl	%r14d, %esi
	movq	%rbx, %rdx
	jge	.LBB7_12
# %bb.4:
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf
	jmp	.LBB7_13
.LBB7_5:
	movq	40(%rsp), %rbx                  # 8-byte Reload
	movq	%rbx, %rdx
	callq	_ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf
.LBB7_6:
	vpmovsxbw	64(%r12), %ymm0
	vmovdqa	%ymm0, 64(%rsp)
	vpmovsxbw	80(%r12), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	96(%r12), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	112(%r12), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	leaq	65536(%r15), %rdi
	movq	24(%rsp), %rax                  # 8-byte Reload
	vmovss	4(%rax), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	leaq	64(%rsp), %rsi
	movl	%r14d, %edx
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
	leaq	20(%rsp), %rsi
	movl	%r14d, %edi
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	movl	20(%rsp), %eax
	movq	16(%rbp), %rcx
	movl	%eax, 4(%rcx)
	leaq	458752(%r15), %rdi
	movq	32(%rsp), %rcx                  # 8-byte Reload
	vmovss	4(%rcx), %xmm1                  # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	leaq	256(%rbx), %rdx
	shll	$2, %eax
	movl	%r14d, %esi
	cmpl	%r13d, %eax
	jge	.LBB7_8
# %bb.7:
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf
	jmp	.LBB7_9
.LBB7_8:
	callq	_ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf
.LBB7_9:
	vpmovsxbw	128(%r12), %ymm0
	vmovdqa	%ymm0, 64(%rsp)
	vpmovsxbw	144(%r12), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	160(%r12), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	176(%r12), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	leaq	131072(%r15), %rdi
	movq	24(%rsp), %rax                  # 8-byte Reload
	vmovss	8(%rax), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	leaq	64(%rsp), %rsi
	movl	%r14d, %edx
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
	leaq	20(%rsp), %rsi
	movl	%r14d, %edi
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	movl	20(%rsp), %eax
	movq	16(%rbp), %rcx
	movl	%eax, 8(%rcx)
	addq	$720896, %r15                   # imm = 0xB0000
	jmp	.LBB7_10
.LBB7_12:
	callq	_ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf
.LBB7_13:
	vpmovsxbw	64(%r12), %ymm0
	vmovdqa	%ymm0, 64(%rsp)
	vpmovsxbw	80(%r12), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	96(%r12), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	112(%r12), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	leaq	65536(%r15), %rdi
	movq	24(%rsp), %rax                  # 8-byte Reload
	vmovss	4(%rax), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	leaq	64(%rsp), %rsi
	movl	%r14d, %edx
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
	leaq	20(%rsp), %rsi
	movl	%r14d, %edi
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	leaq	458752(%r15), %rdi
	movl	20(%rsp), %eax
	movq	32(%rsp), %rcx                  # 8-byte Reload
	vmovss	4(%rcx), %xmm1                  # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	leaq	256(%rbx), %rdx
	shll	$2, %eax
	movl	%r14d, %esi
	cmpl	%r13d, %eax
	jge	.LBB7_15
# %bb.14:
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf
	jmp	.LBB7_16
.LBB7_15:
	callq	_ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf
.LBB7_16:
	vpmovsxbw	128(%r12), %ymm0
	vmovdqa	%ymm0, 64(%rsp)
	vpmovsxbw	144(%r12), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	160(%r12), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	176(%r12), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	leaq	131072(%r15), %rdi
	movq	24(%rsp), %rax                  # 8-byte Reload
	vmovss	8(%rax), %xmm0                  # xmm0 = mem[0],zero,zero,zero
	leaq	64(%rsp), %rsi
	movl	%r14d, %edx
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
	leaq	20(%rsp), %rsi
	movl	%r14d, %edi
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	addq	$720896, %r15                   # imm = 0xB0000
	movl	20(%rsp), %eax
.LBB7_10:
	movq	32(%rsp), %rcx                  # 8-byte Reload
	vmovss	8(%rcx), %xmm1                  # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	addq	$512, %rbx                      # imm = 0x200
	shll	$2, %eax
	movq	%r15, %rdi
	movl	%r14d, %esi
	movq	%rbx, %rdx
	cmpl	%r13d, %eax
	jge	.LBB7_11
# %bb.17:
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf
	jmp	.LBB7_18
.LBB7_11:
	callq	_ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf
.LBB7_18:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end7:
	.size	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi, .Lfunc_end7-_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt15attn_step_fixedERKNS0_7AttnKVTILi1024EEEPKaPKfS8_PffPi,"ax",@progbits
	.globl	_ZN3fx23opt15attn_step_fixedERKNS0_7AttnKVTILi1024EEEPKaPKfS8_PffPi # -- Begin function _ZN3fx23opt15attn_step_fixedERKNS0_7AttnKVTILi1024EEEPKaPKfS8_PffPi
	.p2align	4, 0x90
	.type	_ZN3fx23opt15attn_step_fixedERKNS0_7AttnKVTILi1024EEEPKaPKfS8_PffPi,@function
_ZN3fx23opt15attn_step_fixedERKNS0_7AttnKVTILi1024EEEPKaPKfS8_PffPi: # @_ZN3fx23opt15attn_step_fixedERKNS0_7AttnKVTILi1024EEEPKaPKfS8_PffPi
	.cfi_startproc
# %bb.0:
	jmp	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi # TAILCALL
.Lfunc_end8:
	.size	_ZN3fx23opt15attn_step_fixedERKNS0_7AttnKVTILi1024EEEPKaPKfS8_PffPi, .Lfunc_end8-_ZN3fx23opt15attn_step_fixedERKNS0_7AttnKVTILi1024EEEPKaPKfS8_PffPi
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi
.LCPI9_0:
	.long	0x7149f2ca                      # float 1.00000002E+30
.LCPI9_1:
	.long	0xff800000                      # float -Inf
	.section	.text._ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi,"ax",@progbits
	.p2align	4, 0x90
	.type	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi,@function
_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi: # @_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi
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
	andq	$-32, %rsp
	subq	$256, %rsp                      # imm = 0x100
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, 40(%rsp)                   # 8-byte Spill
	movq	%r8, 32(%rsp)                   # 8-byte Spill
	movq	%rcx, 24(%rsp)                  # 8-byte Spill
	movq	%rdx, 16(%rsp)                  # 8-byte Spill
	movq	%rsi, %r13
	movq	%rdi, %r14
	vxorps	%xmm1, %xmm1, %xmm1
	vcmpltss	%xmm0, %xmm1, %xmm1
	vbroadcastss	.LCPI9_0(%rip), %xmm2   # xmm2 = [1.00000002E+30,1.00000002E+30,1.00000002E+30,1.00000002E+30]
	vblendvps	%xmm1, %xmm0, %xmm2, %xmm0
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	xorl	%r15d, %r15d
	vbroadcastss	.LCPI9_1(%rip), %ymm0   # ymm0 = [-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf]
	vmovaps	%ymm0, 64(%rsp)                 # 32-byte Spill
	jmp	.LBB9_1
	.p2align	4, 0x90
.LBB9_9:                                #   in Loop: Header=BB9_1 Depth=1
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf
	incq	%r15
	cmpq	$3, %r15
	je	.LBB9_11
.LBB9_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_2 Depth 2
                                        #       Child Loop BB9_3 Depth 3
	movq	%r15, %r12
	shlq	$6, %r12
	vpmovsxbw	(%r13,%r12), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	16(%r13,%r12), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	32(%r13,%r12), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	vpmovsxbw	48(%r13,%r12), %ymm0
	vmovdqa	%ymm0, 192(%rsp)
	movq	%r15, %rbx
	shlq	$16, %rbx
	leaq	(%r14,%rbx), %rsi
	movq	16(%rsp), %rax                  # 8-byte Reload
	vbroadcastss	(%rax,%r15,4), %ymm1
	vmovaps	64(%rsp), %ymm0                 # 32-byte Reload
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB9_2:                                #   Parent Loop BB9_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB9_3 Depth 3
	leaq	2048(%rsi), %rdx
	vpxor	%xmm3, %xmm3, %xmm3
	movl	$1, %r8d
	movl	$512, %edi                      # imm = 0x200
	vxorps	%xmm2, %xmm2, %xmm2
	vpxor	%xmm4, %xmm4, %xmm4
	vpxor	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
.LBB9_3:                                #   Parent Loop BB9_1 Depth=1
                                        #     Parent Loop BB9_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	prefetcht0	(%rsi,%rdi,4)
	prefetcht0	32(%rsi,%rdi,4)
	vpbroadcastd	92(%rsp,%r8,4), %ymm6
	vpmovsxbw	-1024(%rsi,%rdi,2), %ymm7
	vpmovsxbw	-1008(%rsi,%rdi,2), %ymm8
	vpmovsxbw	(%rsi,%rdi,2), %ymm9
	vpmovsxbw	16(%rsi,%rdi,2), %ymm10
	vpmaddwd	%ymm7, %ymm6, %ymm7
	vpaddd	%ymm3, %ymm7, %ymm3
	vpmaddwd	%ymm6, %ymm8, %ymm7
	vpaddd	%ymm5, %ymm7, %ymm5
	vpmaddwd	%ymm6, %ymm9, %ymm7
	vpaddd	%ymm4, %ymm7, %ymm4
	vpmaddwd	%ymm6, %ymm10, %ymm6
	vpbroadcastd	96(%rsp,%r8,4), %ymm7
	vpmovsxbw	-992(%rsi,%rdi,2), %ymm8
	vpmovsxbw	-976(%rsi,%rdi,2), %ymm9
	vpmovsxbw	32(%rsi,%rdi,2), %ymm10
	vpaddd	%ymm2, %ymm6, %ymm2
	vpmovsxbw	48(%rsi,%rdi,2), %ymm6
	vpmaddwd	%ymm7, %ymm8, %ymm8
	vpaddd	%ymm3, %ymm8, %ymm3
	vpmaddwd	%ymm7, %ymm9, %ymm8
	vpaddd	%ymm5, %ymm8, %ymm5
	vpmaddwd	%ymm7, %ymm10, %ymm8
	vpaddd	%ymm4, %ymm8, %ymm4
	vpmaddwd	%ymm6, %ymm7, %ymm6
	vpaddd	%ymm6, %ymm2, %ymm2
	leaq	2(%r8), %r9
	decq	%r8
	addq	$32, %rdi
	cmpq	$30, %r8
	movq	%r9, %r8
	jb	.LBB9_3
# %bb.4:                                #   in Loop: Header=BB9_2 Depth=2
	vcvtdq2ps	%ymm3, %ymm3
	vmulps	%ymm3, %ymm1, %ymm3
	vcvtdq2ps	%ymm5, %ymm5
	vmulps	%ymm5, %ymm1, %ymm5
	vcvtdq2ps	%ymm4, %ymm4
	vmulps	%ymm4, %ymm1, %ymm4
	vcvtdq2ps	%ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm2
	vmovaps	%ymm3, (%rax)
	vmovaps	%ymm5, 32(%rax)
	vmovaps	%ymm4, 64(%rax)
	vmovaps	%ymm2, 96(%rax)
	vmaxps	%ymm5, %ymm3, %ymm3
	vmaxps	%ymm2, %ymm4, %ymm2
	vmaxps	%ymm2, %ymm3, %ymm2
	vmaxps	%ymm2, %ymm0, %ymm0
	incl	%ecx
	subq	$-128, %rax
	movq	%rdx, %rsi
	cmpl	$32, %ecx
	jne	.LBB9_2
# %bb.5:                                #   in Loop: Header=BB9_1 Depth=1
	vextractf128	$1, %ymm0, %xmm1
	vmaxps	%xmm1, %xmm0, %xmm0
	vshufpd	$3, %xmm0, %xmm0, %xmm1         # xmm1 = xmm0[1,1]
	vmaxps	%xmm1, %xmm0, %xmm0
	vmovshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
	vmaxss	%xmm1, %xmm0, %xmm0
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	leaq	12(%rsp), %rdi
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb1ELi1024EEEfPKfiffPfRi
	movl	12(%rsp), %eax
	movq	40(%rsp), %rcx                  # 8-byte Reload
	testq	%rcx, %rcx
	je	.LBB9_7
# %bb.6:                                #   in Loop: Header=BB9_1 Depth=1
	movl	%eax, (%rcx,%r15,4)
.LBB9_7:                                #   in Loop: Header=BB9_1 Depth=1
	leaq	(%r14,%rbx), %rdi
	addq	$196608, %rdi                   # imm = 0x30000
	movq	24(%rsp), %rcx                  # 8-byte Reload
	vmovss	(%rcx,%r15,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	movq	32(%rsp), %rcx                  # 8-byte Reload
	leaq	(%rcx,%r12,4), %rdx
	movl	$1024, %esi                     # imm = 0x400
	cmpl	$768, %eax                      # imm = 0x300
	jl	.LBB9_9
# %bb.8:                                #   in Loop: Header=BB9_1 Depth=1
	callq	_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf
	incq	%r15
	cmpq	$3, %r15
	jne	.LBB9_1
.LBB9_11:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end9:
	.size	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi, .Lfunc_end9-_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _ZN3fx23opt15attn_step_fixedERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_PffPi
.LCPI10_0:
	.long	0x7149f2ca                      # float 1.00000002E+30
.LCPI10_1:
	.long	0xff800000                      # float -Inf
	.section	.text._ZN3fx23opt15attn_step_fixedERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_PffPi,"ax",@progbits
	.globl	_ZN3fx23opt15attn_step_fixedERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_PffPi
	.p2align	4, 0x90
	.type	_ZN3fx23opt15attn_step_fixedERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_PffPi,@function
_ZN3fx23opt15attn_step_fixedERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_PffPi: # @_ZN3fx23opt15attn_step_fixedERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_PffPi
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
	andq	$-32, %rsp
	subq	$256, %rsp                      # imm = 0x100
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %rbx
	movq	%r8, 40(%rsp)                   # 8-byte Spill
	movq	%rcx, 32(%rsp)                  # 8-byte Spill
	movq	%rdx, 24(%rsp)                  # 8-byte Spill
	movq	%rsi, %r13
	movq	%rdi, %r14
	vxorps	%xmm1, %xmm1, %xmm1
	vcmpltss	%xmm0, %xmm1, %xmm1
	vbroadcastss	.LCPI10_0(%rip), %xmm2  # xmm2 = [1.00000002E+30,1.00000002E+30,1.00000002E+30,1.00000002E+30]
	vblendvps	%xmm1, %xmm0, %xmm2, %xmm0
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	xorl	%r15d, %r15d
	vbroadcastss	.LCPI10_1(%rip), %ymm0  # ymm0 = [-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf]
	vmovaps	%ymm0, 64(%rsp)                 # 32-byte Spill
	jmp	.LBB10_1
	.p2align	4, 0x90
.LBB10_9:                               #   in Loop: Header=BB10_1 Depth=1
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf
	incq	%r15
	cmpq	$3, %r15
	je	.LBB10_11
.LBB10_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_2 Depth 2
                                        #       Child Loop BB10_3 Depth 3
	movq	%r15, %r12
	shlq	$6, %r12
	vpmovsxbw	(%r13,%r12), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	16(%r13,%r12), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	32(%r13,%r12), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	vpmovsxbw	48(%r13,%r12), %ymm0
	vmovdqa	%ymm0, 192(%rsp)
	movq	%r15, %rsi
	shlq	$17, %rsi
	addq	%r14, %rsi
	movq	24(%rsp), %rax                  # 8-byte Reload
	vbroadcastss	(%rax,%r15,4), %ymm1
	vmovaps	64(%rsp), %ymm0                 # 32-byte Reload
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB10_2:                               #   Parent Loop BB10_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB10_3 Depth 3
	leaq	4096(%rsi), %rdx
	vpxor	%xmm3, %xmm3, %xmm3
	movl	$1, %r8d
	movl	$1024, %edi                     # imm = 0x400
	vxorps	%xmm2, %xmm2, %xmm2
	vpxor	%xmm4, %xmm4, %xmm4
	vpxor	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
.LBB10_3:                               #   Parent Loop BB10_1 Depth=1
                                        #     Parent Loop BB10_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	prefetcht0	(%rsi,%rdi,4)
	prefetcht0	64(%rsi,%rdi,4)
	vpbroadcastd	92(%rsp,%r8,4), %ymm6
	vpmaddwd	-2048(%rsi,%rdi,2), %ymm6, %ymm7
	vpaddd	%ymm3, %ymm7, %ymm3
	vpmaddwd	-2016(%rsi,%rdi,2), %ymm6, %ymm7
	vpmaddwd	(%rsi,%rdi,2), %ymm6, %ymm8
	vpaddd	%ymm5, %ymm7, %ymm5
	vpaddd	%ymm4, %ymm8, %ymm4
	vpmaddwd	32(%rsi,%rdi,2), %ymm6, %ymm6
	vpbroadcastd	96(%rsp,%r8,4), %ymm7
	vpmaddwd	-1984(%rsi,%rdi,2), %ymm7, %ymm8
	vpaddd	%ymm2, %ymm6, %ymm2
	vpaddd	%ymm3, %ymm8, %ymm3
	vpmaddwd	-1952(%rsi,%rdi,2), %ymm7, %ymm6
	vpaddd	%ymm6, %ymm5, %ymm5
	vpmaddwd	64(%rsi,%rdi,2), %ymm7, %ymm6
	vpaddd	%ymm6, %ymm4, %ymm4
	vpmaddwd	96(%rsi,%rdi,2), %ymm7, %ymm6
	vpaddd	%ymm6, %ymm2, %ymm2
	leaq	2(%r8), %r9
	decq	%r8
	addq	$64, %rdi
	cmpq	$30, %r8
	movq	%r9, %r8
	jb	.LBB10_3
# %bb.4:                                #   in Loop: Header=BB10_2 Depth=2
	vcvtdq2ps	%ymm3, %ymm3
	vmulps	%ymm3, %ymm1, %ymm3
	vcvtdq2ps	%ymm5, %ymm5
	vmulps	%ymm5, %ymm1, %ymm5
	vcvtdq2ps	%ymm4, %ymm4
	vmulps	%ymm4, %ymm1, %ymm4
	vcvtdq2ps	%ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm2
	vmovaps	%ymm3, (%rax)
	vmovaps	%ymm5, 32(%rax)
	vmovaps	%ymm4, 64(%rax)
	vmovaps	%ymm2, 96(%rax)
	vmaxps	%ymm5, %ymm3, %ymm3
	vmaxps	%ymm2, %ymm4, %ymm2
	vmaxps	%ymm2, %ymm3, %ymm2
	vmaxps	%ymm2, %ymm0, %ymm0
	incl	%ecx
	subq	$-128, %rax
	movq	%rdx, %rsi
	cmpl	$32, %ecx
	jne	.LBB10_2
# %bb.5:                                #   in Loop: Header=BB10_1 Depth=1
	vextractf128	$1, %ymm0, %xmm1
	vmaxps	%xmm1, %xmm0, %xmm0
	vshufpd	$3, %xmm0, %xmm0, %xmm1         # xmm1 = xmm0[1,1]
	vmaxps	%xmm1, %xmm0, %xmm0
	vmovshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
	vmaxss	%xmm1, %xmm0, %xmm0
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	leaq	20(%rsp), %rdi
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb1ELi1024EEEfPKfiffPfRi
	movl	20(%rsp), %eax
	testq	%rbx, %rbx
	je	.LBB10_7
# %bb.6:                                #   in Loop: Header=BB10_1 Depth=1
	movl	%eax, (%rbx,%r15,4)
.LBB10_7:                               #   in Loop: Header=BB10_1 Depth=1
	movq	%r15, %rcx
	shlq	$16, %rcx
	leaq	(%r14,%rcx), %rdi
	addq	$393216, %rdi                   # imm = 0x60000
	movq	32(%rsp), %rcx                  # 8-byte Reload
	vmovss	(%rcx,%r15,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	movq	40(%rsp), %rcx                  # 8-byte Reload
	leaq	(%rcx,%r12,4), %rdx
	movl	$1024, %esi                     # imm = 0x400
	cmpl	$768, %eax                      # imm = 0x300
	jl	.LBB10_9
# %bb.8:                                #   in Loop: Header=BB10_1 Depth=1
	callq	_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf
	incq	%r15
	cmpq	$3, %r15
	jne	.LBB10_1
.LBB10_11:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end10:
	.size	_ZN3fx23opt15attn_step_fixedERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_PffPi, .Lfunc_end10-_ZN3fx23opt15attn_step_fixedERKNS0_9AttnKV16TILi1024EEEPKaPKfS8_PffPi
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt15attn_step_fixedERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_PffPi,"ax",@progbits
	.globl	_ZN3fx23opt15attn_step_fixedERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_PffPi # -- Begin function _ZN3fx23opt15attn_step_fixedERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_PffPi
	.p2align	4, 0x90
	.type	_ZN3fx23opt15attn_step_fixedERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_PffPi,@function
_ZN3fx23opt15attn_step_fixedERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_PffPi: # @_ZN3fx23opt15attn_step_fixedERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_PffPi
	.cfi_startproc
# %bb.0:
	jmp	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi # TAILCALL
.Lfunc_end11:
	.size	_ZN3fx23opt15attn_step_fixedERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_PffPi, .Lfunc_end11-_ZN3fx23opt15attn_step_fixedERKNS0_10AttnKVF32TILi1024EEEPKaPKfS8_PffPi
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi
.LCPI12_0:
	.long	0x7149f2ca                      # float 1.00000002E+30
.LCPI12_1:
	.long	0xff800000                      # float -Inf
	.section	.text._ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi,"ax",@progbits
	.p2align	4, 0x90
	.type	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi,@function
_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi: # @_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi
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
	andq	$-32, %rsp
	subq	$256, %rsp                      # imm = 0x100
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %rbx
	movq	%r8, 40(%rsp)                   # 8-byte Spill
	movq	%rcx, 32(%rsp)                  # 8-byte Spill
	movq	%rdx, 24(%rsp)                  # 8-byte Spill
	movq	%rsi, %r13
	movq	%rdi, %r14
	vxorps	%xmm1, %xmm1, %xmm1
	vcmpltss	%xmm0, %xmm1, %xmm1
	vbroadcastss	.LCPI12_0(%rip), %xmm2  # xmm2 = [1.00000002E+30,1.00000002E+30,1.00000002E+30,1.00000002E+30]
	vblendvps	%xmm1, %xmm0, %xmm2, %xmm0
	vmovaps	%xmm0, 48(%rsp)                 # 16-byte Spill
	xorl	%r15d, %r15d
	vbroadcastss	.LCPI12_1(%rip), %ymm0  # ymm0 = [-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf]
	vmovaps	%ymm0, 64(%rsp)                 # 32-byte Spill
	jmp	.LBB12_1
	.p2align	4, 0x90
.LBB12_9:                               #   in Loop: Header=BB12_1 Depth=1
	callq	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf
	incq	%r15
	cmpq	$3, %r15
	je	.LBB12_11
.LBB12_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB12_2 Depth 2
                                        #       Child Loop BB12_3 Depth 3
	movq	%r15, %r12
	shlq	$6, %r12
	vpmovsxbw	(%r13,%r12), %ymm0
	vmovdqa	%ymm0, 96(%rsp)
	vpmovsxbw	16(%r13,%r12), %ymm0
	vmovdqa	%ymm0, 128(%rsp)
	vpmovsxbw	32(%r13,%r12), %ymm0
	vmovdqa	%ymm0, 160(%rsp)
	vpmovsxbw	48(%r13,%r12), %ymm0
	vmovdqa	%ymm0, 192(%rsp)
	movq	%r15, %rsi
	shlq	$16, %rsi
	addq	%r14, %rsi
	movq	24(%rsp), %rax                  # 8-byte Reload
	vbroadcastss	(%rax,%r15,4), %ymm1
	vmovaps	64(%rsp), %ymm0                 # 32-byte Reload
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB12_2:                               #   Parent Loop BB12_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB12_3 Depth 3
	leaq	2048(%rsi), %rdx
	vpxor	%xmm3, %xmm3, %xmm3
	movl	$1, %r8d
	movl	$512, %edi                      # imm = 0x200
	vxorps	%xmm2, %xmm2, %xmm2
	vpxor	%xmm4, %xmm4, %xmm4
	vpxor	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
.LBB12_3:                               #   Parent Loop BB12_1 Depth=1
                                        #     Parent Loop BB12_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	prefetcht0	(%rsi,%rdi,4)
	prefetcht0	32(%rsi,%rdi,4)
	vpbroadcastd	92(%rsp,%r8,4), %ymm6
	vpmovsxbw	-1024(%rsi,%rdi,2), %ymm7
	vpmovsxbw	-1008(%rsi,%rdi,2), %ymm8
	vpmovsxbw	(%rsi,%rdi,2), %ymm9
	vpmovsxbw	16(%rsi,%rdi,2), %ymm10
	vpmaddwd	%ymm7, %ymm6, %ymm7
	vpaddd	%ymm3, %ymm7, %ymm3
	vpmaddwd	%ymm6, %ymm8, %ymm7
	vpaddd	%ymm5, %ymm7, %ymm5
	vpmaddwd	%ymm6, %ymm9, %ymm7
	vpaddd	%ymm4, %ymm7, %ymm4
	vpmaddwd	%ymm6, %ymm10, %ymm6
	vpbroadcastd	96(%rsp,%r8,4), %ymm7
	vpmovsxbw	-992(%rsi,%rdi,2), %ymm8
	vpmovsxbw	-976(%rsi,%rdi,2), %ymm9
	vpmovsxbw	32(%rsi,%rdi,2), %ymm10
	vpaddd	%ymm2, %ymm6, %ymm2
	vpmovsxbw	48(%rsi,%rdi,2), %ymm6
	vpmaddwd	%ymm7, %ymm8, %ymm8
	vpaddd	%ymm3, %ymm8, %ymm3
	vpmaddwd	%ymm7, %ymm9, %ymm8
	vpaddd	%ymm5, %ymm8, %ymm5
	vpmaddwd	%ymm7, %ymm10, %ymm8
	vpaddd	%ymm4, %ymm8, %ymm4
	vpmaddwd	%ymm6, %ymm7, %ymm6
	vpaddd	%ymm6, %ymm2, %ymm2
	leaq	2(%r8), %r9
	decq	%r8
	addq	$32, %rdi
	cmpq	$30, %r8
	movq	%r9, %r8
	jb	.LBB12_3
# %bb.4:                                #   in Loop: Header=BB12_2 Depth=2
	vcvtdq2ps	%ymm3, %ymm3
	vmulps	%ymm3, %ymm1, %ymm3
	vcvtdq2ps	%ymm5, %ymm5
	vmulps	%ymm5, %ymm1, %ymm5
	vcvtdq2ps	%ymm4, %ymm4
	vmulps	%ymm4, %ymm1, %ymm4
	vcvtdq2ps	%ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm2
	vmovaps	%ymm3, (%rax)
	vmovaps	%ymm5, 32(%rax)
	vmovaps	%ymm4, 64(%rax)
	vmovaps	%ymm2, 96(%rax)
	vmaxps	%ymm5, %ymm3, %ymm3
	vmaxps	%ymm2, %ymm4, %ymm2
	vmaxps	%ymm2, %ymm3, %ymm2
	vmaxps	%ymm2, %ymm0, %ymm0
	incl	%ecx
	subq	$-128, %rax
	movq	%rdx, %rsi
	cmpl	$32, %ecx
	jne	.LBB12_2
# %bb.5:                                #   in Loop: Header=BB12_1 Depth=1
	vextractf128	$1, %ymm0, %xmm1
	vmaxps	%xmm1, %xmm0, %xmm0
	vshufpd	$3, %xmm0, %xmm0, %xmm1         # xmm1 = xmm0[1,1]
	vmaxps	%xmm1, %xmm0, %xmm0
	vmovshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
	vmaxss	%xmm1, %xmm0, %xmm0
	vmovaps	48(%rsp), %xmm1                 # 16-byte Reload
	leaq	20(%rsp), %rdi
	vzeroupper
	callq	_ZN3fx23opt12_GLOBAL__N_18exp_passILb1ELi1024EEEfPKfiffPfRi
	movl	20(%rsp), %eax
	testq	%rbx, %rbx
	je	.LBB12_7
# %bb.6:                                #   in Loop: Header=BB12_1 Depth=1
	movl	%eax, (%rbx,%r15,4)
.LBB12_7:                               #   in Loop: Header=BB12_1 Depth=1
	movq	%r15, %rcx
	shlq	$18, %rcx
	leaq	(%r14,%rcx), %rdi
	addq	$196608, %rdi                   # imm = 0x30000
	movq	32(%rsp), %rcx                  # 8-byte Reload
	vmovss	(%rcx,%r15,4), %xmm1            # xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	movq	40(%rsp), %rcx                  # 8-byte Reload
	leaq	(%rcx,%r12,4), %rdx
	movl	$1024, %esi                     # imm = 0x400
	cmpl	$768, %eax                      # imm = 0x300
	jl	.LBB12_9
# %bb.8:                                #   in Loop: Header=BB12_1 Depth=1
	callq	_ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf
	incq	%r15
	cmpq	$3, %r15
	jne	.LBB12_1
.LBB12_11:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end12:
	.size	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi, .Lfunc_end12-_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt19attn_layer_kv_bytesEbi,"ax",@progbits
	.globl	_ZN3fx23opt19attn_layer_kv_bytesEbi # -- Begin function _ZN3fx23opt19attn_layer_kv_bytesEbi
	.p2align	4, 0x90
	.type	_ZN3fx23opt19attn_layer_kv_bytesEbi,@function
_ZN3fx23opt19attn_layer_kv_bytesEbi:    # @_ZN3fx23opt19attn_layer_kv_bytesEbi
	.cfi_startproc
# %bb.0:
	testl	%edi, %edi
	movl	$983040, %ecx                   # imm = 0xF0000
	movl	$393216, %eax                   # imm = 0x60000
	cmovneq	%rcx, %rax
	retq
.Lfunc_end13:
	.size	_ZN3fx23opt19attn_layer_kv_bytesEbi, .Lfunc_end13-_ZN3fx23opt19attn_layer_kv_bytesEbi
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt17attn_layer_insertEbiPvlPKaS3_,"ax",@progbits
	.globl	_ZN3fx23opt17attn_layer_insertEbiPvlPKaS3_ # -- Begin function _ZN3fx23opt17attn_layer_insertEbiPvlPKaS3_
	.p2align	4, 0x90
	.type	_ZN3fx23opt17attn_layer_insertEbiPvlPKaS3_,@function
_ZN3fx23opt17attn_layer_insertEbiPvlPKaS3_: # @_ZN3fx23opt17attn_layer_insertEbiPvlPKaS3_
	.cfi_startproc
# %bb.0:
	leaq	1023(%rcx), %rax
	testq	%rcx, %rcx
	cmovnsq	%rcx, %rax
	andq	$-1024, %rax                    # imm = 0xFC00
	subq	%rax, %rcx
	movl	%ecx, %eax
	sarl	$4, %eax
	cltq
	movl	%ecx, %esi
	andl	$15, %esi
	leaq	(%rdx,%rsi,2), %rsi
	shlq	$10, %rax
	movzwl	(%r8), %r10d
	movw	%r10w, (%rax,%rsi)
	movzwl	2(%r8), %r10d
	movw	%r10w, 32(%rax,%rsi)
	movzwl	4(%r8), %r10d
	movw	%r10w, 64(%rax,%rsi)
	movzwl	6(%r8), %r10d
	movw	%r10w, 96(%rax,%rsi)
	movzwl	8(%r8), %r10d
	movw	%r10w, 128(%rax,%rsi)
	movzwl	10(%r8), %r10d
	movw	%r10w, 160(%rax,%rsi)
	movzwl	12(%r8), %r10d
	movw	%r10w, 192(%rax,%rsi)
	movzwl	14(%r8), %r10d
	movw	%r10w, 224(%rax,%rsi)
	movzwl	16(%r8), %r10d
	movw	%r10w, 256(%rax,%rsi)
	movzwl	18(%r8), %r10d
	movw	%r10w, 288(%rax,%rsi)
	movzwl	20(%r8), %r10d
	movw	%r10w, 320(%rax,%rsi)
	movzwl	22(%r8), %r10d
	movw	%r10w, 352(%rax,%rsi)
	movzwl	24(%r8), %r10d
	movw	%r10w, 384(%rax,%rsi)
	movzwl	26(%r8), %r10d
	movw	%r10w, 416(%rax,%rsi)
	movzwl	28(%r8), %r10d
	movw	%r10w, 448(%rax,%rsi)
	movzwl	30(%r8), %r10d
	movw	%r10w, 480(%rax,%rsi)
	movzwl	32(%r8), %r10d
	movw	%r10w, 512(%rax,%rsi)
	movzwl	34(%r8), %r10d
	movw	%r10w, 544(%rax,%rsi)
	movzwl	36(%r8), %r10d
	movw	%r10w, 576(%rax,%rsi)
	movzwl	38(%r8), %r10d
	movw	%r10w, 608(%rax,%rsi)
	movzwl	40(%r8), %r10d
	movw	%r10w, 640(%rax,%rsi)
	movzwl	42(%r8), %r10d
	movw	%r10w, 672(%rax,%rsi)
	movzwl	44(%r8), %r10d
	movw	%r10w, 704(%rax,%rsi)
	movzwl	46(%r8), %r10d
	movw	%r10w, 736(%rax,%rsi)
	movzwl	48(%r8), %r10d
	movw	%r10w, 768(%rax,%rsi)
	movzwl	50(%r8), %r10d
	movw	%r10w, 800(%rax,%rsi)
	movzwl	52(%r8), %r10d
	movw	%r10w, 832(%rax,%rsi)
	movzwl	54(%r8), %r10d
	movw	%r10w, 864(%rax,%rsi)
	movzwl	56(%r8), %r10d
	movw	%r10w, 896(%rax,%rsi)
	movzwl	58(%r8), %r10d
	movw	%r10w, 928(%rax,%rsi)
	movzwl	60(%r8), %r10d
	movw	%r10w, 960(%rax,%rsi)
	movzwl	62(%r8), %r10d
	movw	%r10w, 992(%rax,%rsi)
	testl	%edi, %edi
	je	.LBB14_2
# %bb.1:
	shlq	$8, %rcx
	vpmovsxbd	(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196608(%rdx,%rcx)
	vpmovsxbd	8(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196640(%rdx,%rcx)
	vpmovsxbd	16(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196672(%rdx,%rcx)
	vpmovsxbd	24(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196704(%rdx,%rcx)
	vpmovsxbd	32(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196736(%rdx,%rcx)
	vpmovsxbd	40(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196768(%rdx,%rcx)
	vpmovsxbd	48(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196800(%rdx,%rcx)
	vpmovsxbd	56(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 196832(%rdx,%rcx)
	movzwl	64(%r8), %edi
	movw	%di, 65536(%rsi,%rax)
	movzwl	66(%r8), %edi
	movw	%di, 65568(%rsi,%rax)
	movzwl	68(%r8), %edi
	movw	%di, 65600(%rsi,%rax)
	movzwl	70(%r8), %edi
	movw	%di, 65632(%rsi,%rax)
	movzwl	72(%r8), %edi
	movw	%di, 65664(%rsi,%rax)
	movzwl	74(%r8), %edi
	movw	%di, 65696(%rsi,%rax)
	movzwl	76(%r8), %edi
	movw	%di, 65728(%rsi,%rax)
	movzwl	78(%r8), %edi
	movw	%di, 65760(%rsi,%rax)
	movzwl	80(%r8), %edi
	movw	%di, 65792(%rsi,%rax)
	movzwl	82(%r8), %edi
	movw	%di, 65824(%rsi,%rax)
	movzwl	84(%r8), %edi
	movw	%di, 65856(%rsi,%rax)
	movzwl	86(%r8), %edi
	movw	%di, 65888(%rsi,%rax)
	movzwl	88(%r8), %edi
	movw	%di, 65920(%rsi,%rax)
	movzwl	90(%r8), %edi
	movw	%di, 65952(%rsi,%rax)
	movzwl	92(%r8), %edi
	movw	%di, 65984(%rsi,%rax)
	movzwl	94(%r8), %edi
	movw	%di, 66016(%rsi,%rax)
	movzwl	96(%r8), %edi
	movw	%di, 66048(%rsi,%rax)
	movzwl	98(%r8), %edi
	movw	%di, 66080(%rsi,%rax)
	movzwl	100(%r8), %edi
	movw	%di, 66112(%rsi,%rax)
	movzwl	102(%r8), %edi
	movw	%di, 66144(%rsi,%rax)
	movzwl	104(%r8), %edi
	movw	%di, 66176(%rsi,%rax)
	movzwl	106(%r8), %edi
	movw	%di, 66208(%rsi,%rax)
	movzwl	108(%r8), %edi
	movw	%di, 66240(%rsi,%rax)
	movzwl	110(%r8), %edi
	movw	%di, 66272(%rsi,%rax)
	movzwl	112(%r8), %edi
	movw	%di, 66304(%rsi,%rax)
	movzwl	114(%r8), %edi
	movw	%di, 66336(%rsi,%rax)
	movzwl	116(%r8), %edi
	movw	%di, 66368(%rsi,%rax)
	movzwl	118(%r8), %edi
	movw	%di, 66400(%rsi,%rax)
	movzwl	120(%r8), %edi
	movw	%di, 66432(%rsi,%rax)
	movzwl	122(%r8), %edi
	movw	%di, 66464(%rsi,%rax)
	movzwl	124(%r8), %edi
	movw	%di, 66496(%rsi,%rax)
	movzwl	126(%r8), %edi
	movw	%di, 66528(%rsi,%rax)
	vpmovsxbd	64(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458752(%rdx,%rcx)
	vpmovsxbd	72(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458784(%rdx,%rcx)
	vpmovsxbd	80(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458816(%rdx,%rcx)
	vpmovsxbd	88(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458848(%rdx,%rcx)
	vpmovsxbd	96(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458880(%rdx,%rcx)
	vpmovsxbd	104(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458912(%rdx,%rcx)
	vpmovsxbd	112(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458944(%rdx,%rcx)
	vpmovsxbd	120(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 458976(%rdx,%rcx)
	movzwl	128(%r8), %edi
	movw	%di, 131072(%rsi,%rax)
	movzwl	130(%r8), %edi
	movw	%di, 131104(%rsi,%rax)
	movzwl	132(%r8), %edi
	movw	%di, 131136(%rsi,%rax)
	movzwl	134(%r8), %edi
	movw	%di, 131168(%rsi,%rax)
	movzwl	136(%r8), %edi
	movw	%di, 131200(%rsi,%rax)
	movzwl	138(%r8), %edi
	movw	%di, 131232(%rsi,%rax)
	movzwl	140(%r8), %edi
	movw	%di, 131264(%rsi,%rax)
	movzwl	142(%r8), %edi
	movw	%di, 131296(%rsi,%rax)
	movzwl	144(%r8), %edi
	movw	%di, 131328(%rsi,%rax)
	movzwl	146(%r8), %edi
	movw	%di, 131360(%rsi,%rax)
	movzwl	148(%r8), %edi
	movw	%di, 131392(%rsi,%rax)
	movzwl	150(%r8), %edi
	movw	%di, 131424(%rsi,%rax)
	movzwl	152(%r8), %edi
	movw	%di, 131456(%rsi,%rax)
	movzwl	154(%r8), %edi
	movw	%di, 131488(%rsi,%rax)
	movzwl	156(%r8), %edi
	movw	%di, 131520(%rsi,%rax)
	movzwl	158(%r8), %edi
	movw	%di, 131552(%rsi,%rax)
	movzwl	160(%r8), %edi
	movw	%di, 131584(%rsi,%rax)
	movzwl	162(%r8), %edi
	movw	%di, 131616(%rsi,%rax)
	movzwl	164(%r8), %edi
	movw	%di, 131648(%rsi,%rax)
	movzwl	166(%r8), %edi
	movw	%di, 131680(%rsi,%rax)
	movzwl	168(%r8), %edi
	movw	%di, 131712(%rsi,%rax)
	movzwl	170(%r8), %edi
	movw	%di, 131744(%rsi,%rax)
	movzwl	172(%r8), %edi
	movw	%di, 131776(%rsi,%rax)
	movzwl	174(%r8), %edi
	movw	%di, 131808(%rsi,%rax)
	movzwl	176(%r8), %edi
	movw	%di, 131840(%rsi,%rax)
	movzwl	178(%r8), %edi
	movw	%di, 131872(%rsi,%rax)
	movzwl	180(%r8), %edi
	movw	%di, 131904(%rsi,%rax)
	movzwl	182(%r8), %edi
	movw	%di, 131936(%rsi,%rax)
	movzwl	184(%r8), %edi
	movw	%di, 131968(%rsi,%rax)
	movzwl	186(%r8), %edi
	movw	%di, 132000(%rsi,%rax)
	movzwl	188(%r8), %edi
	movw	%di, 132032(%rsi,%rax)
	movzwl	190(%r8), %edi
	movw	%di, 132064(%rsi,%rax)
	vpmovsxbd	128(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 720896(%rdx,%rcx)
	vpmovsxbd	136(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 720928(%rdx,%rcx)
	vpmovsxbd	144(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 720960(%rdx,%rcx)
	vpmovsxbd	152(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 720992(%rdx,%rcx)
	vpmovsxbd	160(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 721024(%rdx,%rcx)
	vpmovsxbd	168(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 721056(%rdx,%rcx)
	vpmovsxbd	176(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 721088(%rdx,%rcx)
	vpmovsxbd	184(%r9), %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vmovaps	%ymm0, 721120(%rdx,%rcx)
	vzeroupper
	retq
.LBB14_2:
	shlq	$6, %rcx
	vmovups	(%r9), %ymm0
	vmovups	32(%r9), %ymm1
	vmovups	%ymm1, 196640(%rdx,%rcx)
	vmovups	%ymm0, 196608(%rdx,%rcx)
	movzwl	64(%r8), %edi
	movw	%di, 65536(%rsi,%rax)
	movzwl	66(%r8), %edi
	movw	%di, 65568(%rsi,%rax)
	movzwl	68(%r8), %edi
	movw	%di, 65600(%rsi,%rax)
	movzwl	70(%r8), %edi
	movw	%di, 65632(%rsi,%rax)
	movzwl	72(%r8), %edi
	movw	%di, 65664(%rsi,%rax)
	movzwl	74(%r8), %edi
	movw	%di, 65696(%rsi,%rax)
	movzwl	76(%r8), %edi
	movw	%di, 65728(%rsi,%rax)
	movzwl	78(%r8), %edi
	movw	%di, 65760(%rsi,%rax)
	movzwl	80(%r8), %edi
	movw	%di, 65792(%rsi,%rax)
	movzwl	82(%r8), %edi
	movw	%di, 65824(%rsi,%rax)
	movzwl	84(%r8), %edi
	movw	%di, 65856(%rsi,%rax)
	movzwl	86(%r8), %edi
	movw	%di, 65888(%rsi,%rax)
	movzwl	88(%r8), %edi
	movw	%di, 65920(%rsi,%rax)
	movzwl	90(%r8), %edi
	movw	%di, 65952(%rsi,%rax)
	movzwl	92(%r8), %edi
	movw	%di, 65984(%rsi,%rax)
	movzwl	94(%r8), %edi
	movw	%di, 66016(%rsi,%rax)
	movzwl	96(%r8), %edi
	movw	%di, 66048(%rsi,%rax)
	movzwl	98(%r8), %edi
	movw	%di, 66080(%rsi,%rax)
	movzwl	100(%r8), %edi
	movw	%di, 66112(%rsi,%rax)
	movzwl	102(%r8), %edi
	movw	%di, 66144(%rsi,%rax)
	movzwl	104(%r8), %edi
	movw	%di, 66176(%rsi,%rax)
	movzwl	106(%r8), %edi
	movw	%di, 66208(%rsi,%rax)
	movzwl	108(%r8), %edi
	movw	%di, 66240(%rsi,%rax)
	movzwl	110(%r8), %edi
	movw	%di, 66272(%rsi,%rax)
	movzwl	112(%r8), %edi
	movw	%di, 66304(%rsi,%rax)
	movzwl	114(%r8), %edi
	movw	%di, 66336(%rsi,%rax)
	movzwl	116(%r8), %edi
	movw	%di, 66368(%rsi,%rax)
	movzwl	118(%r8), %edi
	movw	%di, 66400(%rsi,%rax)
	movzwl	120(%r8), %edi
	movw	%di, 66432(%rsi,%rax)
	movzwl	122(%r8), %edi
	movw	%di, 66464(%rsi,%rax)
	movzwl	124(%r8), %edi
	movw	%di, 66496(%rsi,%rax)
	movzwl	126(%r8), %edi
	movw	%di, 66528(%rsi,%rax)
	vmovups	64(%r9), %ymm0
	vmovups	96(%r9), %ymm1
	vmovups	%ymm1, 262176(%rdx,%rcx)
	vmovups	%ymm0, 262144(%rdx,%rcx)
	movzwl	128(%r8), %edi
	movw	%di, 131072(%rsi,%rax)
	movzwl	130(%r8), %edi
	movw	%di, 131104(%rsi,%rax)
	movzwl	132(%r8), %edi
	movw	%di, 131136(%rsi,%rax)
	movzwl	134(%r8), %edi
	movw	%di, 131168(%rsi,%rax)
	movzwl	136(%r8), %edi
	movw	%di, 131200(%rsi,%rax)
	movzwl	138(%r8), %edi
	movw	%di, 131232(%rsi,%rax)
	movzwl	140(%r8), %edi
	movw	%di, 131264(%rsi,%rax)
	movzwl	142(%r8), %edi
	movw	%di, 131296(%rsi,%rax)
	movzwl	144(%r8), %edi
	movw	%di, 131328(%rsi,%rax)
	movzwl	146(%r8), %edi
	movw	%di, 131360(%rsi,%rax)
	movzwl	148(%r8), %edi
	movw	%di, 131392(%rsi,%rax)
	movzwl	150(%r8), %edi
	movw	%di, 131424(%rsi,%rax)
	movzwl	152(%r8), %edi
	movw	%di, 131456(%rsi,%rax)
	movzwl	154(%r8), %edi
	movw	%di, 131488(%rsi,%rax)
	movzwl	156(%r8), %edi
	movw	%di, 131520(%rsi,%rax)
	movzwl	158(%r8), %edi
	movw	%di, 131552(%rsi,%rax)
	movzwl	160(%r8), %edi
	movw	%di, 131584(%rsi,%rax)
	movzwl	162(%r8), %edi
	movw	%di, 131616(%rsi,%rax)
	movzwl	164(%r8), %edi
	movw	%di, 131648(%rsi,%rax)
	movzwl	166(%r8), %edi
	movw	%di, 131680(%rsi,%rax)
	movzwl	168(%r8), %edi
	movw	%di, 131712(%rsi,%rax)
	movzwl	170(%r8), %edi
	movw	%di, 131744(%rsi,%rax)
	movzwl	172(%r8), %edi
	movw	%di, 131776(%rsi,%rax)
	movzwl	174(%r8), %edi
	movw	%di, 131808(%rsi,%rax)
	movzwl	176(%r8), %edi
	movw	%di, 131840(%rsi,%rax)
	movzwl	178(%r8), %edi
	movw	%di, 131872(%rsi,%rax)
	movzwl	180(%r8), %edi
	movw	%di, 131904(%rsi,%rax)
	movzwl	182(%r8), %edi
	movw	%di, 131936(%rsi,%rax)
	movzwl	184(%r8), %edi
	movw	%di, 131968(%rsi,%rax)
	movzwl	186(%r8), %edi
	movw	%di, 132000(%rsi,%rax)
	movzwl	188(%r8), %edi
	movw	%di, 132032(%rsi,%rax)
	movzwl	190(%r8), %edi
	movw	%di, 132064(%rsi,%rax)
	vmovups	128(%r9), %ymm0
	vmovups	160(%r9), %ymm1
	vmovups	%ymm1, 327712(%rdx,%rcx)
	vmovups	%ymm0, 327680(%rdx,%rcx)
	vzeroupper
	retq
.Lfunc_end14:
	.size	_ZN3fx23opt17attn_layer_insertEbiPvlPKaS3_, .Lfunc_end14-_ZN3fx23opt17attn_layer_insertEbiPvlPKaS3_
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt15attn_layer_stepEbiPKvPKaPKfS6_lPffPi,"ax",@progbits
	.globl	_ZN3fx23opt15attn_layer_stepEbiPKvPKaPKfS6_lPffPi # -- Begin function _ZN3fx23opt15attn_layer_stepEbiPKvPKaPKfS6_lPffPi
	.p2align	4, 0x90
	.type	_ZN3fx23opt15attn_layer_stepEbiPKvPKaPKfS6_lPffPi,@function
_ZN3fx23opt15attn_layer_stepEbiPKvPKaPKfS6_lPffPi: # @_ZN3fx23opt15attn_layer_stepEbiPKvPKaPKfS6_lPffPi
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%r9, %r10
	movq	%r8, %r11
	movq	32(%rsp), %r9
	movq	24(%rsp), %rax
	movq	16(%rsp), %r8
	testl	%edi, %edi
	je	.LBB15_3
# %bb.1:
	cmpq	$1022, %r8                      # imm = 0x3FE
	jg	.LBB15_2
# %bb.5:
	incl	%r8d
	movq	%r9, (%rsp)
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	movq	%r11, %rdx
	movq	%r10, %rcx
                                        # kill: def $r8d killed $r8d killed $r8
	movq	%rax, %r9
	callq	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.LBB15_3:
	.cfi_def_cfa_offset 16
	cmpq	$1022, %r8                      # imm = 0x3FE
	jg	.LBB15_4
# %bb.6:
	incl	%r8d
	movq	%r9, (%rsp)
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	movq	%r11, %rdx
	movq	%r10, %rcx
                                        # kill: def $r8d killed $r8d killed $r8
	movq	%rax, %r9
	callq	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb0EEEvRKT_PKaPKfSB_iPffPi
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.LBB15_2:
	.cfi_def_cfa_offset 16
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	movq	%r11, %rdx
	movq	%r10, %rcx
	movq	%rax, %r8
	popq	%rax
	.cfi_def_cfa_offset 8
	jmp	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_10AttnKVF32TILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi # TAILCALL
.LBB15_4:
	.cfi_def_cfa_offset 16
	movq	%rdx, %rdi
	movq	%rcx, %rsi
	movq	%r11, %rdx
	movq	%r10, %rcx
	movq	%rax, %r8
	popq	%rax
	.cfi_def_cfa_offset 8
	jmp	_ZN3fx23opt12_GLOBAL__N_19attn_implINS0_7AttnKVTILi1024EEELb1EEEvRKT_PKaPKfSB_iPffPi # TAILCALL
.Lfunc_end15:
	.size	_ZN3fx23opt15attn_layer_stepEbiPKvPKaPKfS6_lPffPi, .Lfunc_end15-_ZN3fx23opt15attn_layer_stepEbiPKvPKaPKfS6_lPffPi
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
.LCPI16_0:
	.long	0xff800000                      # float -Inf
	.section	.text._ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf,"ax",@progbits
	.p2align	4, 0x90
	.type	_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf,@function
_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf: # @_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
	.cfi_startproc
# %bb.0:
                                        # kill: def $edx killed $edx def $rdx
	vbroadcastss	%xmm0, %ymm1
	cmpl	$32, %edx
	jl	.LBB16_1
# %bb.12:
	movl	%edx, %ecx
	shrl	$5, %ecx
	xorl	%r8d, %r8d
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %rax
	vbroadcastss	.LCPI16_0(%rip), %ymm0  # ymm0 = [-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf]
	movq	%rdi, %r9
	.p2align	4, 0x90
.LBB16_13:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB16_14 Depth 2
	leaq	2048(%r9), %rdi
	vpxor	%xmm3, %xmm3, %xmm3
	movq	$-2, %r10
	movl	$256, %r11d                     # imm = 0x100
	vpxor	%xmm5, %xmm5, %xmm5
	vpxor	%xmm4, %xmm4, %xmm4
	vpxor	%xmm2, %xmm2, %xmm2
	.p2align	4, 0x90
.LBB16_14:                              #   Parent Loop BB16_13 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	prefetcht0	(%r9,%r11,8)
	prefetcht0	32(%r9,%r11,8)
	vpbroadcastd	8(%rsi,%r10,4), %ymm6
	vpmovsxbw	-1024(%r9,%r11,4), %ymm7
	vpmovsxbw	-1008(%r9,%r11,4), %ymm8
	vpmovsxbw	(%r9,%r11,4), %ymm9
	vpmovsxbw	16(%r9,%r11,4), %ymm10
	vpmaddwd	%ymm7, %ymm6, %ymm7
	vpaddd	%ymm3, %ymm7, %ymm3
	vpmaddwd	%ymm6, %ymm8, %ymm7
	vpaddd	%ymm5, %ymm7, %ymm5
	vpmaddwd	%ymm6, %ymm9, %ymm7
	vpaddd	%ymm4, %ymm7, %ymm4
	vpmaddwd	%ymm6, %ymm10, %ymm6
	vpbroadcastd	12(%rsi,%r10,4), %ymm7
	vpmovsxbw	-992(%r9,%r11,4), %ymm8
	vpmovsxbw	-976(%r9,%r11,4), %ymm9
	vpmovsxbw	32(%r9,%r11,4), %ymm10
	vpmovsxbw	48(%r9,%r11,4), %ymm11
	vpaddd	%ymm2, %ymm6, %ymm2
	vpmaddwd	%ymm7, %ymm8, %ymm6
	vpaddd	%ymm6, %ymm3, %ymm3
	vpmaddwd	%ymm7, %ymm9, %ymm6
	vpaddd	%ymm6, %ymm5, %ymm5
	vpmaddwd	%ymm7, %ymm10, %ymm6
	vpaddd	%ymm6, %ymm4, %ymm4
	vpmaddwd	%ymm7, %ymm11, %ymm6
	vpaddd	%ymm6, %ymm2, %ymm2
	addq	$2, %r10
	addq	$16, %r11
	cmpq	$30, %r10
	jb	.LBB16_14
# %bb.15:                               #   in Loop: Header=BB16_13 Depth=1
	vcvtdq2ps	%ymm3, %ymm3
	vmulps	%ymm3, %ymm1, %ymm3
	vcvtdq2ps	%ymm5, %ymm5
	vmulps	%ymm5, %ymm1, %ymm5
	vcvtdq2ps	%ymm4, %ymm4
	vmulps	%ymm4, %ymm1, %ymm4
	vcvtdq2ps	%ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm2
	vmovaps	%ymm3, (%rax)
	vmovaps	%ymm5, 32(%rax)
	vmovaps	%ymm4, 64(%rax)
	vmovaps	%ymm2, 96(%rax)
	vmaxps	%ymm5, %ymm3, %ymm3
	vmaxps	%ymm2, %ymm4, %ymm2
	vmaxps	%ymm2, %ymm3, %ymm2
	vmaxps	%ymm2, %ymm0, %ymm0
	incl	%r8d
	subq	$-128, %rax
	movq	%rdi, %r9
	cmpl	%ecx, %r8d
	jne	.LBB16_13
# %bb.2:
	movl	%edx, %r8d
	andl	$31, %r8d
	jne	.LBB16_3
	jmp	.LBB16_24
.LBB16_1:
	vbroadcastss	.LCPI16_0(%rip), %ymm0  # ymm0 = [-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf]
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %rax
	movl	%edx, %r8d
	andl	$31, %r8d
	je	.LBB16_24
.LBB16_3:
	movl	%edx, %ecx
	andl	$-32, %ecx
	addl	$15, %r8d
	vxorps	%xmm2, %xmm2, %xmm2
	xorl	%r9d, %r9d
	vxorps	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB16_4:                               # =>This Inner Loop Header: Depth=1
	vpbroadcastd	(%rsi,%r9), %ymm4
	vpmovsxbw	(%rdi,%r9,8), %ymm5
	vpmovsxbw	16(%rdi,%r9,8), %ymm6
	vpmaddwd	%ymm5, %ymm4, %ymm5
	vpaddd	%ymm3, %ymm5, %ymm3
	vpmaddwd	%ymm6, %ymm4, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	vpbroadcastd	4(%rsi,%r9), %ymm4
	vpmovsxbw	32(%rdi,%r9,8), %ymm5
	vpmovsxbw	48(%rdi,%r9,8), %ymm6
	vpmaddwd	%ymm5, %ymm4, %ymm5
	vpaddd	%ymm3, %ymm5, %ymm3
	vpmaddwd	%ymm6, %ymm4, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	addq	$8, %r9
	cmpq	$128, %r9
	jne	.LBB16_4
# %bb.5:
	vcvtdq2ps	%ymm3, %ymm3
	vmulps	%ymm3, %ymm1, %ymm3
	vmovaps	%ymm3, (%rax)
	vcvtdq2ps	%ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm2
	vmovaps	%ymm2, 32(%rax)
	andl	$-16, %r8d
	cmpl	$16, %r8d
	je	.LBB16_9
# %bb.6:
	vxorps	%xmm2, %xmm2, %xmm2
	movl	$4, %r8d
	vxorps	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB16_7:                               # =>This Inner Loop Header: Depth=1
	vpbroadcastd	-4(%rsi,%r8), %ymm4
	vpmovsxbw	992(%rdi,%r8,8), %ymm5
	vpmovsxbw	1008(%rdi,%r8,8), %ymm6
	vpmaddwd	%ymm5, %ymm4, %ymm5
	vpaddd	%ymm3, %ymm5, %ymm3
	vpmaddwd	%ymm6, %ymm4, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	vpbroadcastd	(%rsi,%r8), %ymm4
	vpmovsxbw	1024(%rdi,%r8,8), %ymm5
	vpmovsxbw	1040(%rdi,%r8,8), %ymm6
	vpmaddwd	%ymm5, %ymm4, %ymm5
	vpaddd	%ymm3, %ymm5, %ymm3
	vpmaddwd	%ymm6, %ymm4, %ymm4
	vpaddd	%ymm2, %ymm4, %ymm2
	addq	$8, %r8
	cmpq	$132, %r8
	jne	.LBB16_7
# %bb.8:
	vcvtdq2ps	%ymm3, %ymm3
	vmulps	%ymm3, %ymm1, %ymm3
	vmovaps	%ymm3, 64(%rax)
	vcvtdq2ps	%ymm2, %ymm2
	vmulps	%ymm2, %ymm1, %ymm1
	vmovaps	%ymm1, 96(%rax)
.LBB16_9:
	leal	31(%rdx), %esi
	andl	$-32, %esi
	movslq	%esi, %rax
	cmpl	%edx, %esi
	jle	.LBB16_21
# %bb.10:
	movslq	%edx, %r9
	movq	%rax, %rdi
	subq	%r9, %rdi
	cmpq	$32, %rdi
	jae	.LBB16_16
# %bb.11:
	movq	%r9, %rdx
	jmp	.LBB16_19
.LBB16_16:
	movq	%rdi, %r8
	andq	$-32, %r8
	leaq	(%r8,%r9), %rdx
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %r10
	leaq	(%r10,%r9,4), %r9
	addq	$96, %r9
	xorl	%r10d, %r10d
	vbroadcastss	.LCPI16_0(%rip), %ymm1  # ymm1 = [-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf,-Inf]
	.p2align	4, 0x90
.LBB16_17:                              # =>This Inner Loop Header: Depth=1
	vmovups	%ymm1, -96(%r9,%r10,4)
	vmovups	%ymm1, -64(%r9,%r10,4)
	vmovups	%ymm1, -32(%r9,%r10,4)
	vmovups	%ymm1, (%r9,%r10,4)
	addq	$32, %r10
	cmpq	%r10, %r8
	jne	.LBB16_17
# %bb.18:
	cmpq	%r8, %rdi
	je	.LBB16_21
.LBB16_19:
	movq	%rax, %rdi
	subq	%rdx, %rdi
	shlq	$2, %rdx
	xorl	%r8d, %r8d
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %r9
	.p2align	4, 0x90
.LBB16_20:                              # =>This Inner Loop Header: Depth=1
	leaq	(%rdx,%r8,4), %r10
	movl	$-8388608, (%r9,%r10)           # imm = 0xFF800000
	incq	%r8
	cmpq	%r8, %rdi
	jne	.LBB16_20
.LBB16_21:
	cmpl	%esi, %ecx
	jge	.LBB16_24
# %bb.22:
	movslq	%ecx, %rcx
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %rdx
	leaq	(%rdx,%rcx,4), %rdx
	.p2align	4, 0x90
.LBB16_23:                              # =>This Inner Loop Header: Depth=1
	vmaxps	(%rdx), %ymm0, %ymm0
	addq	$8, %rcx
	addq	$32, %rdx
	cmpq	%rax, %rcx
	jl	.LBB16_23
.LBB16_24:
	vextractf128	$1, %ymm0, %xmm1
	vmaxps	%xmm1, %xmm0, %xmm0
	vshufpd	$3, %xmm0, %xmm0, %xmm1         # xmm1 = xmm0[1,1]
	vmaxps	%xmm1, %xmm0, %xmm0
	vmovshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
	vmaxss	%xmm1, %xmm0, %xmm0
	vzeroupper
	retq
.Lfunc_end16:
	.size	_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf, .Lfunc_end16-_ZN3fx23opt12_GLOBAL__N_17qk_scanILb0ELi0EaEEfPKT1_PKifiPf
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
.LCPI17_0:
	.long	0x80000000                      # float -0
.LCPI17_1:
	.long	0x42b00000                      # float 88
.LCPI17_2:
	.long	0xc2aeac50                      # float -87.3365478
.LCPI17_3:
	.long	0x3f000000                      # float 0.5
.LCPI17_4:
	.long	0x3fb8aa3b                      # float 1.44269502
.LCPI17_5:
	.long	0x3f318000                      # float 0.693359375
.LCPI17_6:
	.long	0xb95e8083                      # float -2.12194442E-4
.LCPI17_7:
	.long	0x3e2aaaaa                      # float 0.166666657
.LCPI17_8:
	.long	0x3d2aa9c1                      # float 0.0416657962
.LCPI17_9:
	.long	0x3c088908                      # float 0.00833345205
.LCPI17_10:
	.long	0x3ab743ce                      # float 0.00139819994
.LCPI17_11:
	.long	0x39506967                      # float 1.98756912E-4
.LCPI17_12:
	.long	0x3f800000                      # float 1
.LCPI17_13:
	.long	0xbf318000                      # float -0.693359375
.LCPI17_14:
	.long	0x395e8083                      # float 2.12194442E-4
	.section	.text._ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi,"ax",@progbits
	.p2align	4, 0x90
	.type	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi,@function
_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi: # @_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$640, %rsp                      # imm = 0x280
	.cfi_def_cfa_offset 656
	.cfi_offset %rbx, -16
                                        # kill: def $edi killed $edi def $rdi
	vpbroadcastd	.LCPI17_0(%rip), %xmm2  # xmm2 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vbroadcastss	%xmm0, %ymm9
	vpxor	%xmm2, %xmm1, %xmm0
	vpbroadcastd	%xmm0, %ymm8
	leal	7(%rdi), %eax
	sarl	$3, %eax
	movl	%edi, %ecx
	sarl	$3, %ecx
	cmpl	$32, %edi
	vmovups	%ymm9, 96(%rsp)                 # 32-byte Spill
	vmovdqu	%ymm8, 320(%rsp)                # 32-byte Spill
	jge	.LBB17_13
# %bb.1:
	vxorps	%xmm7, %xmm7, %xmm7
	vpcmpeqd	%ymm1, %ymm1, %ymm1
	xorl	%edx, %edx
	vpxor	%xmm0, %xmm0, %xmm0
	cmpl	%eax, %edx
	vmovups	%ymm7, -128(%rsp)               # 32-byte Spill
	vmovdqu	%ymm1, -32(%rsp)                # 32-byte Spill
	jl	.LBB17_4
	jmp	.LBB17_8
.LBB17_13:
	movslq	%ecx, %r8
	vpcmpeqd	%ymm1, %ymm1, %ymm1
	vpxor	%xmm2, %xmm2, %xmm2
	movl	$96, %r9d
	xorl	%edx, %edx
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %r10
	vbroadcastss	.LCPI17_1(%rip), %ymm0  # ymm0 = [8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1]
	vmovups	%ymm0, (%rsp)                   # 32-byte Spill
	vbroadcastss	.LCPI17_2(%rip), %ymm0  # ymm0 = [-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1]
	vmovups	%ymm0, 288(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_3(%rip), %ymm0  # ymm0 = [5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1]
	vmovups	%ymm0, 448(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_4(%rip), %ymm0  # ymm0 = [1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0]
	vmovups	%ymm0, 256(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_5(%rip), %ymm0  # ymm0 = [6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_6(%rip), %ymm0  # ymm0 = [-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4]
	vmovups	%ymm0, -64(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_7(%rip), %ymm0  # ymm0 = [1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1]
	vmovups	%ymm0, 192(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_8(%rip), %ymm0  # ymm0 = [4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2]
	vmovups	%ymm0, 160(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_9(%rip), %ymm0  # ymm0 = [8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3]
	vmovups	%ymm0, -96(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_10(%rip), %ymm0 # ymm0 = [1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3]
	vmovups	%ymm0, 128(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_11(%rip), %ymm0 # ymm0 = [1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4]
	vmovups	%ymm0, 416(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_12(%rip), %ymm0 # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vmovups	%ymm0, 384(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_12(%rip), %ymm0 # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vmovups	%ymm0, 352(%rsp)                # 32-byte Spill
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_ebE(%rip), %r11
	vxorps	%xmm7, %xmm7, %xmm7
	.p2align	4, 0x90
.LBB17_14:                              # =>This Inner Loop Header: Depth=1
	vmovdqu	%ymm1, -32(%rsp)                # 32-byte Spill
	vmovups	%ymm7, -128(%rsp)               # 32-byte Spill
	vmovdqu	%ymm2, 608(%rsp)                # 32-byte Spill
	vmovaps	-96(%r9,%r10), %ymm3
	vmovaps	-64(%r9,%r10), %ymm4
	vmovaps	-32(%r9,%r10), %ymm5
	vmovaps	(%r9,%r10), %ymm6
	vsubps	%ymm9, %ymm3, %ymm2
	vmovups	%ymm2, 576(%rsp)                # 32-byte Spill
	vsubps	%ymm9, %ymm4, %ymm8
	vmovups	%ymm8, 512(%rsp)                # 32-byte Spill
	vsubps	%ymm9, %ymm5, %ymm0
	vmovups	%ymm0, 32(%rsp)                 # 32-byte Spill
	vsubps	%ymm9, %ymm6, %ymm0
	vmovups	%ymm0, 64(%rsp)                 # 32-byte Spill
	vmovups	(%rsp), %ymm0                   # 32-byte Reload
	vminps	%ymm0, %ymm2, %ymm3
	vmovaps	%ymm0, %ymm7
	vmovups	288(%rsp), %ymm5                # 32-byte Reload
	vmaxps	%ymm5, %ymm3, %ymm3
	vmovups	256(%rsp), %ymm2                # 32-byte Reload
	vmovaps	%ymm2, %ymm4
	vmovups	448(%rsp), %ymm0                # 32-byte Reload
	vfmadd213ps	%ymm0, %ymm3, %ymm4     # ymm4 = (ymm3 * ymm4) + ymm0
	vroundps	$1, %ymm4, %ymm1
	vmovups	%ymm1, 544(%rsp)                # 32-byte Spill
	vmovups	224(%rsp), %ymm12               # 32-byte Reload
	vfnmadd231ps	%ymm12, %ymm1, %ymm3    # ymm3 = -(ymm1 * ymm12) + ymm3
	vfnmadd231ps	-64(%rsp), %ymm1, %ymm3 # 32-byte Folded Reload
                                        # ymm3 = -(ymm1 * mem) + ymm3
	vmulps	%ymm3, %ymm3, %ymm4
	vmulps	%ymm4, %ymm4, %ymm6
	vmovups	192(%rsp), %ymm10               # 32-byte Reload
	vmovaps	%ymm10, %ymm9
	vfmadd213ps	%ymm0, %ymm3, %ymm9     # ymm9 = (ymm3 * ymm9) + ymm0
	vmovups	-96(%rsp), %ymm13               # 32-byte Reload
	vmovups	160(%rsp), %ymm1                # 32-byte Reload
	vfmadd213ps	%ymm1, %ymm3, %ymm13    # ymm13 = (ymm3 * ymm13) + ymm1
	vmovups	416(%rsp), %ymm11               # 32-byte Reload
	vmovaps	%ymm11, %ymm15
	vmovaps	%ymm11, %ymm14
	vfmadd213ps	128(%rsp), %ymm3, %ymm15 # 32-byte Folded Reload
                                        # ymm15 = (ymm3 * ymm15) + mem
	vfmadd213ps	%ymm9, %ymm4, %ymm13    # ymm13 = (ymm4 * ymm13) + ymm9
	vfmadd231ps	%ymm15, %ymm6, %ymm13   # ymm13 = (ymm6 * ymm15) + ymm13
	vfmadd213ps	%ymm3, %ymm4, %ymm13    # ymm13 = (ymm4 * ymm13) + ymm3
	vminps	%ymm7, %ymm8, %ymm3
	vmovaps	%ymm7, %ymm8
	vmaxps	%ymm5, %ymm3, %ymm6
	vmovaps	%ymm5, %ymm7
	vfmadd213ps	%ymm0, %ymm6, %ymm2     # ymm2 = (ymm6 * ymm2) + ymm0
	vroundps	$1, %ymm2, %ymm2
	vmovups	%ymm2, 480(%rsp)                # 32-byte Spill
	vmovaps	%ymm12, %ymm4
	vfnmadd231ps	%ymm12, %ymm2, %ymm6    # ymm6 = -(ymm2 * ymm12) + ymm6
	vmovups	-64(%rsp), %ymm5                # 32-byte Reload
	vfnmadd231ps	%ymm5, %ymm2, %ymm6     # ymm6 = -(ymm2 * ymm5) + ymm6
	vmulps	%ymm6, %ymm6, %ymm9
	vmulps	%ymm9, %ymm9, %ymm15
	vmovaps	%ymm10, %ymm11
	vfmadd213ps	%ymm0, %ymm6, %ymm11    # ymm11 = (ymm6 * ymm11) + ymm0
	vmovups	-96(%rsp), %ymm2                # 32-byte Reload
	vmovaps	%ymm2, %ymm3
	vfmadd213ps	%ymm1, %ymm6, %ymm3     # ymm3 = (ymm6 * ymm3) + ymm1
	vmovaps	%ymm14, %ymm10
	vmovaps	%ymm14, %ymm12
	vmovups	128(%rsp), %ymm1                # 32-byte Reload
	vfmadd213ps	%ymm1, %ymm6, %ymm10    # ymm10 = (ymm6 * ymm10) + ymm1
	vfmadd213ps	%ymm11, %ymm9, %ymm3    # ymm3 = (ymm9 * ymm3) + ymm11
	vfmadd231ps	%ymm10, %ymm15, %ymm3   # ymm3 = (ymm15 * ymm10) + ymm3
	vfmadd213ps	%ymm6, %ymm9, %ymm3     # ymm3 = (ymm9 * ymm3) + ymm6
	vmovups	32(%rsp), %ymm6                 # 32-byte Reload
	vminps	%ymm8, %ymm6, %ymm6
	vmaxps	%ymm7, %ymm6, %ymm10
	vmovups	256(%rsp), %ymm7                # 32-byte Reload
	vmovaps	%ymm7, %ymm6
	vfmadd213ps	%ymm0, %ymm10, %ymm6    # ymm6 = (ymm10 * ymm6) + ymm0
	vroundps	$1, %ymm6, %ymm9
	vfnmadd231ps	%ymm4, %ymm9, %ymm10    # ymm10 = -(ymm9 * ymm4) + ymm10
	vfnmadd231ps	%ymm5, %ymm9, %ymm10    # ymm10 = -(ymm9 * ymm5) + ymm10
	vmulps	%ymm10, %ymm10, %ymm11
	vmulps	%ymm11, %ymm11, %ymm15
	vmovups	192(%rsp), %ymm5                # 32-byte Reload
	vmovaps	%ymm5, %ymm14
	vfmadd213ps	%ymm0, %ymm10, %ymm14   # ymm14 = (ymm10 * ymm14) + ymm0
	vmovaps	%ymm2, %ymm6
	vmovups	160(%rsp), %ymm4                # 32-byte Reload
	vfmadd213ps	%ymm4, %ymm10, %ymm6    # ymm6 = (ymm10 * ymm6) + ymm4
	vmovaps	%ymm12, %ymm8
	vfmadd213ps	%ymm1, %ymm10, %ymm12   # ymm12 = (ymm10 * ymm12) + ymm1
	vfmadd213ps	%ymm14, %ymm11, %ymm6   # ymm6 = (ymm11 * ymm6) + ymm14
	vfmadd231ps	%ymm12, %ymm15, %ymm6   # ymm6 = (ymm15 * ymm12) + ymm6
	vfmadd213ps	%ymm10, %ymm11, %ymm6   # ymm6 = (ymm11 * ymm6) + ymm10
	vmovups	64(%rsp), %ymm10                # 32-byte Reload
	vminps	(%rsp), %ymm10, %ymm10          # 32-byte Folded Reload
	vmaxps	288(%rsp), %ymm10, %ymm10       # 32-byte Folded Reload
	vmovups	608(%rsp), %ymm2                # 32-byte Reload
	vfmadd213ps	%ymm0, %ymm10, %ymm7    # ymm7 = (ymm10 * ymm7) + ymm0
	vroundps	$1, %ymm7, %ymm11
	vfnmadd231ps	224(%rsp), %ymm11, %ymm10 # 32-byte Folded Reload
                                        # ymm10 = -(ymm11 * mem) + ymm10
	vfnmadd231ps	-64(%rsp), %ymm11, %ymm10 # 32-byte Folded Reload
                                        # ymm10 = -(ymm11 * mem) + ymm10
	vmulps	%ymm10, %ymm10, %ymm12
	vfmadd213ps	%ymm0, %ymm10, %ymm5    # ymm5 = (ymm10 * ymm5) + ymm0
	vmovups	-96(%rsp), %ymm15               # 32-byte Reload
	vfmadd213ps	%ymm4, %ymm10, %ymm15   # ymm15 = (ymm10 * ymm15) + ymm4
	vfmadd213ps	%ymm5, %ymm12, %ymm15   # ymm15 = (ymm12 * ymm15) + ymm5
	vfmadd213ps	%ymm1, %ymm10, %ymm8    # ymm8 = (ymm10 * ymm8) + ymm1
	vmulps	%ymm12, %ymm12, %ymm1
	vfmadd231ps	%ymm8, %ymm1, %ymm15    # ymm15 = (ymm1 * ymm8) + ymm15
	vfmadd213ps	%ymm10, %ymm12, %ymm15  # ymm15 = (ymm12 * ymm15) + ymm10
	vmovups	-128(%rsp), %ymm7               # 32-byte Reload
	vmovups	320(%rsp), %ymm8                # 32-byte Reload
	vmovups	384(%rsp), %ymm10               # 32-byte Reload
	vaddps	%ymm10, %ymm13, %ymm1
	vcvtps2dq	544(%rsp), %ymm5        # 32-byte Folded Reload
	vpslld	$23, %ymm5, %ymm5
	vmovdqu	352(%rsp), %ymm12               # 32-byte Reload
	vpaddd	%ymm5, %ymm12, %ymm5
	vmulps	%ymm5, %ymm1, %ymm1
	vaddps	%ymm3, %ymm10, %ymm3
	vcvtps2dq	480(%rsp), %ymm4        # 32-byte Folded Reload
	vpslld	$23, %ymm4, %ymm4
	vpaddd	%ymm4, %ymm12, %ymm4
	vmulps	%ymm4, %ymm3, %ymm3
	vaddps	%ymm6, %ymm10, %ymm4
	vcvtps2dq	%ymm9, %ymm5
	vpslld	$23, %ymm5, %ymm5
	vpaddd	%ymm5, %ymm12, %ymm5
	vmulps	%ymm5, %ymm4, %ymm4
	vaddps	%ymm10, %ymm15, %ymm5
	vcvtps2dq	%ymm11, %ymm6
	vpslld	$23, %ymm6, %ymm6
	vpaddd	%ymm6, %ymm12, %ymm6
	vmulps	%ymm6, %ymm5, %ymm5
	vcmpleps	576(%rsp), %ymm8, %ymm6         # 32-byte Folded Reload
	vcmpleps	512(%rsp), %ymm8, %ymm9         # 32-byte Folded Reload
	vandps	%ymm6, %ymm1, %ymm1
	vandps	%ymm3, %ymm9, %ymm3
	vmovaps	%ymm1, -96(%r9,%r11)
	vmovaps	%ymm3, -64(%r9,%r11)
	vaddps	%ymm3, %ymm1, %ymm1
	vaddps	%ymm1, %ymm2, %ymm2
	vcmpleps	32(%rsp), %ymm8, %ymm1          # 32-byte Folded Reload
	vcmpleps	64(%rsp), %ymm8, %ymm3          # 32-byte Folded Reload
	vandps	%ymm1, %ymm4, %ymm4
	vandps	%ymm3, %ymm5, %ymm5
	vmovaps	%ymm4, -32(%r9,%r11)
	vmovaps	%ymm5, (%r9,%r11)
	vaddps	%ymm5, %ymm4, %ymm4
	vaddps	%ymm4, %ymm7, %ymm7
	vandps	-32(%rsp), %ymm6, %ymm4         # 32-byte Folded Reload
	vandps	%ymm1, %ymm9, %ymm1
	vmovups	96(%rsp), %ymm9                 # 32-byte Reload
	vandps	%ymm1, %ymm4, %ymm1
	vandps	%ymm3, %ymm1, %ymm1
	movq	%rdx, %rbx
	addq	$4, %rdx
	subq	$-128, %r9
	addq	$8, %rbx
	cmpq	%r8, %rbx
	jle	.LBB17_14
# %bb.2:
	vmovdqa	%ymm2, %ymm0
	cmpl	%eax, %edx
	vmovups	%ymm7, -128(%rsp)               # 32-byte Spill
	vmovdqu	%ymm1, -32(%rsp)                # 32-byte Spill
	jge	.LBB17_8
.LBB17_4:
	movl	%edx, %edx
	movslq	%ecx, %rcx
	movl	%eax, %r8d
	movq	%rdx, %r9
	shlq	$5, %r9
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %r10
	vbroadcastss	.LCPI17_1(%rip), %ymm1  # ymm1 = [8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1]
	vmovups	%ymm1, -64(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_2(%rip), %ymm1  # ymm1 = [-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1]
	vmovups	%ymm1, -96(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI17_3(%rip), %ymm3  # ymm3 = [5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1]
	vbroadcastss	.LCPI17_4(%rip), %ymm1  # ymm1 = [1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0]
	vmovups	%ymm1, 64(%rsp)                 # 32-byte Spill
	vbroadcastss	.LCPI17_13(%rip), %ymm1 # ymm1 = [-6.93359375E-1,-6.93359375E-1,-6.93359375E-1,-6.93359375E-1,-6.93359375E-1,-6.93359375E-1,-6.93359375E-1,-6.93359375E-1]
	vmovups	%ymm1, 32(%rsp)                 # 32-byte Spill
	vbroadcastss	.LCPI17_14(%rip), %ymm1 # ymm1 = [2.12194442E-4,2.12194442E-4,2.12194442E-4,2.12194442E-4,2.12194442E-4,2.12194442E-4,2.12194442E-4,2.12194442E-4]
	vmovups	%ymm1, (%rsp)                   # 32-byte Spill
	vbroadcastss	.LCPI17_7(%rip), %ymm1  # ymm1 = [1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1]
	vbroadcastss	.LCPI17_8(%rip), %ymm8  # ymm8 = [4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2]
	vbroadcastss	.LCPI17_9(%rip), %ymm6  # ymm6 = [8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3]
	vbroadcastss	.LCPI17_10(%rip), %ymm10 # ymm10 = [1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3]
	vbroadcastss	.LCPI17_11(%rip), %ymm11 # ymm11 = [1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4]
	vbroadcastss	.LCPI17_12(%rip), %ymm12 # ymm12 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vpbroadcastd	.LCPI17_12(%rip), %ymm13 # ymm13 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_ebE(%rip), %r11
	jmp	.LBB17_5
	.p2align	4, 0x90
.LBB17_7:                               #   in Loop: Header=BB17_5 Depth=1
	vmovups	96(%rsp), %ymm9                 # 32-byte Reload
	vaddps	%ymm0, %ymm14, %ymm0
	incq	%rdx
	addq	$32, %r9
	cmpq	%rdx, %r8
	je	.LBB17_8
.LBB17_5:                               # =>This Inner Loop Header: Depth=1
	vmovaps	(%r9,%r10), %ymm14
	vsubps	%ymm9, %ymm14, %ymm14
	vminps	-64(%rsp), %ymm14, %ymm15       # 32-byte Folded Reload
	vmaxps	-96(%rsp), %ymm15, %ymm15       # 32-byte Folded Reload
	vmovups	64(%rsp), %ymm4                 # 32-byte Reload
	vfmadd213ps	%ymm3, %ymm15, %ymm4    # ymm4 = (ymm15 * ymm4) + ymm3
	vroundps	$1, %ymm4, %ymm4
	vfmadd231ps	32(%rsp), %ymm4, %ymm15 # 32-byte Folded Reload
                                        # ymm15 = (ymm4 * mem) + ymm15
	vfmadd231ps	(%rsp), %ymm4, %ymm15   # 32-byte Folded Reload
                                        # ymm15 = (ymm4 * mem) + ymm15
	vmulps	%ymm15, %ymm15, %ymm2
	vmulps	%ymm2, %ymm2, %ymm5
	vmovaps	%ymm1, %ymm7
	vfmadd213ps	%ymm3, %ymm15, %ymm7    # ymm7 = (ymm15 * ymm7) + ymm3
	vmovaps	%ymm6, %ymm9
	vfmadd213ps	%ymm8, %ymm15, %ymm9    # ymm9 = (ymm15 * ymm9) + ymm8
	vfmadd213ps	%ymm7, %ymm2, %ymm9     # ymm9 = (ymm2 * ymm9) + ymm7
	vmovaps	%ymm11, %ymm7
	vfmadd213ps	%ymm10, %ymm15, %ymm7   # ymm7 = (ymm15 * ymm7) + ymm10
	vfmadd231ps	%ymm7, %ymm5, %ymm9     # ymm9 = (ymm5 * ymm7) + ymm9
	vfmadd213ps	%ymm15, %ymm2, %ymm9    # ymm9 = (ymm2 * ymm9) + ymm15
	vaddps	%ymm12, %ymm9, %ymm2
	vcvtps2dq	%ymm4, %ymm4
	vpslld	$23, %ymm4, %ymm4
	vpaddd	%ymm4, %ymm13, %ymm4
	vmulps	%ymm4, %ymm2, %ymm2
	vmovups	320(%rsp), %ymm4                # 32-byte Reload
	vcmpleps	%ymm14, %ymm4, %ymm15
	vandps	%ymm2, %ymm15, %ymm14
	vmovaps	%ymm14, (%r9,%r11)
	cmpq	%rcx, %rdx
	jge	.LBB17_7
# %bb.6:                                #   in Loop: Header=BB17_5 Depth=1
	vmovups	-32(%rsp), %ymm2                # 32-byte Reload
	vandps	%ymm2, %ymm15, %ymm2
	vmovups	%ymm2, -32(%rsp)                # 32-byte Spill
	jmp	.LBB17_7
.LBB17_8:
	vpcmpeqd	%ymm1, %ymm1, %ymm1
	vmovups	-32(%rsp), %ymm2                # 32-byte Reload
	vtestps	%ymm1, %ymm2
	jb	.LBB17_19
# %bb.9:
	testl	%edi, %edi
	jle	.LBB17_10
# %bb.15:
	cmpl	$2, %eax
	movl	$1, %ecx
	cmovgel	%eax, %ecx
	cmpl	$9, %edi
	jge	.LBB17_28
# %bb.16:
	vpxor	%xmm1, %xmm1, %xmm1
	xorl	%eax, %eax
	vmovups	-128(%rsp), %ymm8               # 32-byte Reload
	jmp	.LBB17_17
.LBB17_19:
	movl	%edi, %edx
	andl	$-8, %edx
	cmpl	%edi, %edx
	jge	.LBB17_20
# %bb.21:
	movslq	%edx, %r9
	movslq	%edi, %rax
	movq	%rax, %rdi
	subq	%r9, %rdi
	cmpq	$32, %rdi
	vmovups	-128(%rsp), %ymm8               # 32-byte Reload
	jae	.LBB17_23
# %bb.22:
	movq	%r9, %rcx
	jmp	.LBB17_26
.LBB17_10:
	vpxor	%xmm1, %xmm1, %xmm1
	vmovups	-128(%rsp), %ymm8               # 32-byte Reload
	jmp	.LBB17_11
.LBB17_28:
	movl	%ecx, %edx
	shrl	%edx
	shlq	$4, %rdx
	vxorps	%xmm2, %xmm2, %xmm2
	xorl	%eax, %eax
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_ebE(%rip), %rdi
	vpxor	%xmm1, %xmm1, %xmm1
	vmovups	-128(%rsp), %ymm8               # 32-byte Reload
	.p2align	4, 0x90
.LBB17_29:                              # =>This Inner Loop Header: Depth=1
	vcmpneq_oqps	(%rdi,%rax,4), %ymm2, %ymm3
	vcmpneq_oqps	32(%rdi,%rax,4), %ymm2, %ymm4
	vpsubd	%ymm3, %ymm1, %ymm1
	vpsubd	%ymm4, %ymm1, %ymm1
	addq	$16, %rax
	cmpq	%rax, %rdx
	jne	.LBB17_29
.LBB17_17:
	testb	$1, %cl
	je	.LBB17_11
# %bb.18:
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_ebE(%rip), %rcx
	vxorps	%xmm2, %xmm2, %xmm2
	vcmpneq_oqps	(%rcx,%rax,4), %ymm2, %ymm2
	vpsubd	%ymm2, %ymm1, %ymm1
.LBB17_11:
	vextracti128	$1, %ymm1, %xmm2
	vpaddd	%xmm1, %xmm2, %xmm1
	vpshufd	$78, %xmm1, %xmm2               # xmm2 = xmm1[2,3,0,1]
	vpaddd	%xmm1, %xmm2, %xmm1
	vpshufd	$85, %xmm1, %xmm2               # xmm2 = xmm1[1,1,1,1]
	vpaddd	%xmm1, %xmm2, %xmm1
	vmovd	%xmm1, %edx
	jmp	.LBB17_12
.LBB17_20:
	vmovups	-128(%rsp), %ymm8               # 32-byte Reload
	jmp	.LBB17_12
.LBB17_23:
	movq	%rdi, %r8
	andq	$-32, %r8
	leaq	(%r8,%r9), %rcx
	vmovd	%edx, %xmm1
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_ebE(%rip), %rdx
	leaq	(%rdx,%r9,4), %rdx
	addq	$96, %rdx
	vxorps	%xmm2, %xmm2, %xmm2
	xorl	%r9d, %r9d
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
.LBB17_24:                              # =>This Inner Loop Header: Depth=1
	vcmpneqps	-96(%rdx,%r9,4), %ymm2, %ymm6
	vpsubd	%ymm6, %ymm1, %ymm1
	vcmpneqps	-64(%rdx,%r9,4), %ymm2, %ymm6
	vpsubd	%ymm6, %ymm3, %ymm3
	vcmpneqps	-32(%rdx,%r9,4), %ymm2, %ymm6
	vcmpneqps	(%rdx,%r9,4), %ymm2, %ymm7
	vpsubd	%ymm6, %ymm4, %ymm4
	vpsubd	%ymm7, %ymm5, %ymm5
	addq	$32, %r9
	cmpq	%r9, %r8
	jne	.LBB17_24
# %bb.25:
	vpaddd	%ymm1, %ymm3, %ymm1
	vpaddd	%ymm4, %ymm5, %ymm2
	vpaddd	%ymm1, %ymm2, %ymm1
	vextracti128	$1, %ymm1, %xmm2
	vpaddd	%xmm2, %xmm1, %xmm1
	vpshufd	$238, %xmm1, %xmm2              # xmm2 = xmm1[2,3,2,3]
	vpaddd	%xmm2, %xmm1, %xmm1
	vpshufd	$85, %xmm1, %xmm2               # xmm2 = xmm1[1,1,1,1]
	vpaddd	%xmm2, %xmm1, %xmm1
	vmovd	%xmm1, %edx
	cmpq	%r8, %rdi
	je	.LBB17_12
.LBB17_26:
	subq	%rcx, %rax
	shlq	$2, %rcx
	xorl	%edi, %edi
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_ebE(%rip), %r8
	vpxor	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB17_27:                              # =>This Inner Loop Header: Depth=1
	leaq	(%rcx,%rdi,4), %r9
	vcmpneqss	(%r8,%r9), %xmm1, %xmm2
	vmovd	%xmm2, %r9d
	subl	%r9d, %edx
	incq	%rdi
	cmpq	%rdi, %rax
	jne	.LBB17_27
.LBB17_12:
	movl	%edx, (%rsi)
	vaddps	%ymm0, %ymm8, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddps	%xmm1, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1         # xmm1 = xmm0[1,0]
	vaddps	%xmm1, %xmm0, %xmm0
	vmovshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$640, %rsp                      # imm = 0x280
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	vzeroupper
	retq
.Lfunc_end17:
	.size	_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi, .Lfunc_end17-_ZN3fx23opt12_GLOBAL__N_18exp_passILb0ELi0EEEfPKfiffPfRi
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf
	.type	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf,@function
_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf: # @_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf
	.cfi_startproc
# %bb.0:
                                        # kill: def $esi killed $esi def $rsi
	testl	%esi, %esi
	jle	.LBB18_1
# %bb.3:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	addl	$7, %esi
	shrl	$3, %esi
	vxorps	%xmm8, %xmm8, %xmm8
	xorl	%eax, %eax
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_ebE(%rip), %rcx
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm9, %xmm9, %xmm9
	jmp	.LBB18_4
	.p2align	4, 0x90
.LBB18_7:                               #   in Loop: Header=BB18_4 Depth=1
	incq	%rax
	cmpq	%rsi, %rax
	je	.LBB18_8
.LBB18_4:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB18_6 Depth 2
	movq	%rax, %r8
	shlq	$5, %r8
	vcmpneq_oqps	(%r8,%rcx), %ymm8, %ymm10
	vmovmskps	%ymm10, %r9d
	testl	%r9d, %r9d
	je	.LBB18_7
# %bb.5:                                #   in Loop: Header=BB18_4 Depth=1
	addq	%rcx, %r8
	movzbl	%r9b, %r9d
	movq	%rax, %r10
	shlq	$9, %r10
	addq	%rdi, %r10
	.p2align	4, 0x90
.LBB18_6:                               #   Parent Loop BB18_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	tzcntl	%r9d, %ebx
	movq	%rbx, %r11
	shlq	$6, %r11
	blsrl	%r9d, %r9d
	prefetcht0	512(%r10,%r11)
	vbroadcastss	(%r8,%rbx,4), %ymm10
	vpmovsxbd	(%r10,%r11), %ymm11
	vcvtdq2ps	%ymm11, %ymm11
	vfmadd231ps	%ymm11, %ymm10, %ymm9   # ymm9 = (ymm10 * ymm11) + ymm9
	vpmovsxbd	8(%r10,%r11), %ymm11
	vcvtdq2ps	%ymm11, %ymm11
	vfmadd231ps	%ymm11, %ymm10, %ymm7   # ymm7 = (ymm10 * ymm11) + ymm7
	vpmovsxbd	16(%r10,%r11), %ymm11
	vcvtdq2ps	%ymm11, %ymm11
	vfmadd231ps	%ymm11, %ymm10, %ymm6   # ymm6 = (ymm10 * ymm11) + ymm6
	vpmovsxbd	24(%r10,%r11), %ymm11
	vcvtdq2ps	%ymm11, %ymm11
	vfmadd231ps	%ymm11, %ymm10, %ymm5   # ymm5 = (ymm10 * ymm11) + ymm5
	vpmovsxbd	32(%r10,%r11), %ymm11
	vcvtdq2ps	%ymm11, %ymm11
	vfmadd231ps	%ymm11, %ymm10, %ymm4   # ymm4 = (ymm10 * ymm11) + ymm4
	vpmovsxbd	40(%r10,%r11), %ymm11
	vcvtdq2ps	%ymm11, %ymm11
	vfmadd231ps	%ymm11, %ymm10, %ymm3   # ymm3 = (ymm10 * ymm11) + ymm3
	vpmovsxbd	48(%r10,%r11), %ymm11
	vcvtdq2ps	%ymm11, %ymm11
	vfmadd231ps	%ymm11, %ymm10, %ymm2   # ymm2 = (ymm10 * ymm11) + ymm2
	vpmovsxbd	56(%r10,%r11), %ymm11
	vcvtdq2ps	%ymm11, %ymm11
	vfmadd231ps	%ymm11, %ymm10, %ymm1   # ymm1 = (ymm10 * ymm11) + ymm1
	jne	.LBB18_6
	jmp	.LBB18_7
.LBB18_8:
	popq	%rbx
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	jmp	.LBB18_2
.LBB18_1:
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm9, %xmm9, %xmm9
.LBB18_2:
	vbroadcastss	%xmm0, %ymm0
	vmulps	%ymm0, %ymm9, %ymm8
	vmovaps	%ymm8, (%rdx)
	vmulps	%ymm7, %ymm0, %ymm7
	vmovaps	%ymm7, 32(%rdx)
	vmulps	%ymm6, %ymm0, %ymm6
	vmovaps	%ymm6, 64(%rdx)
	vmulps	%ymm5, %ymm0, %ymm5
	vmovaps	%ymm5, 96(%rdx)
	vmulps	%ymm4, %ymm0, %ymm4
	vmovaps	%ymm4, 128(%rdx)
	vmulps	%ymm3, %ymm0, %ymm3
	vmovaps	%ymm3, 160(%rdx)
	vmulps	%ymm2, %ymm0, %ymm2
	vmovaps	%ymm2, 192(%rdx)
	vmulps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, 224(%rdx)
	vzeroupper
	retq
.Lfunc_end18:
	.size	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf, .Lfunc_end18-_ZN3fx23opt12_GLOBAL__N_19pv_sparseIaEEvPKT_PKfifPf
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf
	.type	_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf,@function
_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf: # @_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf
	.cfi_startproc
# %bb.0:
	vmovaps	%xmm0, %xmm14
	movl	%esi, %eax
	sarl	%eax
	andl	$1, %esi
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_ebE(%rip), %rcx
	#APP
hutblk_0_start:
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	testl	%eax, %eax
	je	.Ltmp0
	.p2align	4, 0x90
.Ltmp1:
	vbroadcastss	(%rcx), %ymm12
	vbroadcastss	4(%rcx), %ymm13
	prefetcht0	1024(%rdi)
	prefetcht0	1088(%rdi)
	vpmovsxbd	(%rdi), %ymm8
	vcvtdq2ps	%ymm8, %ymm8
	vfmadd231ps	%ymm8, %ymm12, %ymm0    # ymm0 = (ymm12 * ymm8) + ymm0
	vpmovsxbd	8(%rdi), %ymm9
	vcvtdq2ps	%ymm9, %ymm9
	vfmadd231ps	%ymm9, %ymm12, %ymm1    # ymm1 = (ymm12 * ymm9) + ymm1
	vpmovsxbd	16(%rdi), %ymm8
	vcvtdq2ps	%ymm8, %ymm8
	vfmadd231ps	%ymm8, %ymm12, %ymm2    # ymm2 = (ymm12 * ymm8) + ymm2
	vpmovsxbd	24(%rdi), %ymm9
	vcvtdq2ps	%ymm9, %ymm9
	vfmadd231ps	%ymm9, %ymm12, %ymm3    # ymm3 = (ymm12 * ymm9) + ymm3
	vpmovsxbd	32(%rdi), %ymm8
	vcvtdq2ps	%ymm8, %ymm8
	vfmadd231ps	%ymm8, %ymm12, %ymm4    # ymm4 = (ymm12 * ymm8) + ymm4
	vpmovsxbd	40(%rdi), %ymm9
	vcvtdq2ps	%ymm9, %ymm9
	vfmadd231ps	%ymm9, %ymm12, %ymm5    # ymm5 = (ymm12 * ymm9) + ymm5
	vpmovsxbd	48(%rdi), %ymm8
	vcvtdq2ps	%ymm8, %ymm8
	vfmadd231ps	%ymm8, %ymm12, %ymm6    # ymm6 = (ymm12 * ymm8) + ymm6
	vpmovsxbd	56(%rdi), %ymm9
	vcvtdq2ps	%ymm9, %ymm9
	vfmadd231ps	%ymm9, %ymm12, %ymm7    # ymm7 = (ymm12 * ymm9) + ymm7
	vpmovsxbd	64(%rdi), %ymm10
	vcvtdq2ps	%ymm10, %ymm10
	vfmadd231ps	%ymm10, %ymm13, %ymm0   # ymm0 = (ymm13 * ymm10) + ymm0
	vpmovsxbd	72(%rdi), %ymm11
	vcvtdq2ps	%ymm11, %ymm11
	vfmadd231ps	%ymm11, %ymm13, %ymm1   # ymm1 = (ymm13 * ymm11) + ymm1
	vpmovsxbd	80(%rdi), %ymm10
	vcvtdq2ps	%ymm10, %ymm10
	vfmadd231ps	%ymm10, %ymm13, %ymm2   # ymm2 = (ymm13 * ymm10) + ymm2
	vpmovsxbd	88(%rdi), %ymm11
	vcvtdq2ps	%ymm11, %ymm11
	vfmadd231ps	%ymm11, %ymm13, %ymm3   # ymm3 = (ymm13 * ymm11) + ymm3
	vpmovsxbd	96(%rdi), %ymm10
	vcvtdq2ps	%ymm10, %ymm10
	vfmadd231ps	%ymm10, %ymm13, %ymm4   # ymm4 = (ymm13 * ymm10) + ymm4
	vpmovsxbd	104(%rdi), %ymm11
	vcvtdq2ps	%ymm11, %ymm11
	vfmadd231ps	%ymm11, %ymm13, %ymm5   # ymm5 = (ymm13 * ymm11) + ymm5
	vpmovsxbd	112(%rdi), %ymm10
	vcvtdq2ps	%ymm10, %ymm10
	vfmadd231ps	%ymm10, %ymm13, %ymm6   # ymm6 = (ymm13 * ymm10) + ymm6
	vpmovsxbd	120(%rdi), %ymm11
	vcvtdq2ps	%ymm11, %ymm11
	vfmadd231ps	%ymm11, %ymm13, %ymm7   # ymm7 = (ymm13 * ymm11) + ymm7
	addq	$128, %rdi
	addq	$8, %rcx
	decl	%eax
	jne	.Ltmp1
.Ltmp0:
	testl	%esi, %esi
	je	.Ltmp2
	vbroadcastss	(%rcx), %ymm12
	vpmovsxbd	(%rdi), %ymm8
	vcvtdq2ps	%ymm8, %ymm8
	vfmadd231ps	%ymm8, %ymm12, %ymm0    # ymm0 = (ymm12 * ymm8) + ymm0
	vpmovsxbd	8(%rdi), %ymm9
	vcvtdq2ps	%ymm9, %ymm9
	vfmadd231ps	%ymm9, %ymm12, %ymm1    # ymm1 = (ymm12 * ymm9) + ymm1
	vpmovsxbd	16(%rdi), %ymm8
	vcvtdq2ps	%ymm8, %ymm8
	vfmadd231ps	%ymm8, %ymm12, %ymm2    # ymm2 = (ymm12 * ymm8) + ymm2
	vpmovsxbd	24(%rdi), %ymm9
	vcvtdq2ps	%ymm9, %ymm9
	vfmadd231ps	%ymm9, %ymm12, %ymm3    # ymm3 = (ymm12 * ymm9) + ymm3
	vpmovsxbd	32(%rdi), %ymm8
	vcvtdq2ps	%ymm8, %ymm8
	vfmadd231ps	%ymm8, %ymm12, %ymm4    # ymm4 = (ymm12 * ymm8) + ymm4
	vpmovsxbd	40(%rdi), %ymm9
	vcvtdq2ps	%ymm9, %ymm9
	vfmadd231ps	%ymm9, %ymm12, %ymm5    # ymm5 = (ymm12 * ymm9) + ymm5
	vpmovsxbd	48(%rdi), %ymm8
	vcvtdq2ps	%ymm8, %ymm8
	vfmadd231ps	%ymm8, %ymm12, %ymm6    # ymm6 = (ymm12 * ymm8) + ymm6
	vpmovsxbd	56(%rdi), %ymm9
	vcvtdq2ps	%ymm9, %ymm9
	vfmadd231ps	%ymm9, %ymm12, %ymm7    # ymm7 = (ymm12 * ymm9) + ymm7
.Ltmp2:
	vbroadcastss	%xmm14, %ymm13
	vmulps	%ymm0, %ymm13, %ymm0
	vmulps	%ymm1, %ymm13, %ymm1
	vmulps	%ymm2, %ymm13, %ymm2
	vmulps	%ymm3, %ymm13, %ymm3
	vmulps	%ymm4, %ymm13, %ymm4
	vmulps	%ymm5, %ymm13, %ymm5
	vmulps	%ymm6, %ymm13, %ymm6
	vmulps	%ymm7, %ymm13, %ymm7
	vmovaps	%ymm0, (%rdx)
	vmovaps	%ymm1, 32(%rdx)
	vmovaps	%ymm2, 64(%rdx)
	vmovaps	%ymm3, 96(%rdx)
	vmovaps	%ymm4, 128(%rdx)
	vmovaps	%ymm5, 160(%rdx)
	vmovaps	%ymm6, 192(%rdx)
	vmovaps	%ymm7, 224(%rdx)

hutblk_0_end:
	#NO_APP
	vzeroupper
	retq
.Lfunc_end19:
	.size	_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf, .Lfunc_end19-_ZN3fx23opt12_GLOBAL__N_111pv_dense_i8EPKaPKfifPf
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf
	.type	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf,@function
_ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf: # @_ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf
	.cfi_startproc
# %bb.0:
                                        # kill: def $esi killed $esi def $rsi
	testl	%esi, %esi
	jle	.LBB20_1
# %bb.3:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	addl	$7, %esi
	shrl	$3, %esi
	vxorps	%xmm8, %xmm8, %xmm8
	xorl	%eax, %eax
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_ebE(%rip), %rcx
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm9, %xmm9, %xmm9
	jmp	.LBB20_4
	.p2align	4, 0x90
.LBB20_7:                               #   in Loop: Header=BB20_4 Depth=1
	incq	%rax
	cmpq	%rsi, %rax
	je	.LBB20_8
.LBB20_4:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB20_6 Depth 2
	movq	%rax, %r8
	shlq	$5, %r8
	vcmpneq_oqps	(%r8,%rcx), %ymm8, %ymm10
	vmovmskps	%ymm10, %r9d
	testl	%r9d, %r9d
	je	.LBB20_7
# %bb.5:                                #   in Loop: Header=BB20_4 Depth=1
	addq	%rcx, %r8
	movzbl	%r9b, %r9d
	movq	%rax, %r10
	shlq	$11, %r10
	addq	%rdi, %r10
	.p2align	4, 0x90
.LBB20_6:                               #   Parent Loop BB20_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	tzcntl	%r9d, %r11d
	movl	%r11d, %ebx
	shll	$6, %ebx
	blsrl	%r9d, %r9d
	prefetcht0	2048(%r10,%rbx,4)
	vbroadcastss	(%r8,%r11,4), %ymm10
	vfmadd231ps	(%r10,%rbx,4), %ymm10, %ymm9 # ymm9 = (ymm10 * mem) + ymm9
	vfmadd231ps	32(%r10,%rbx,4), %ymm10, %ymm7 # ymm7 = (ymm10 * mem) + ymm7
	vfmadd231ps	64(%r10,%rbx,4), %ymm10, %ymm6 # ymm6 = (ymm10 * mem) + ymm6
	vfmadd231ps	96(%r10,%rbx,4), %ymm10, %ymm5 # ymm5 = (ymm10 * mem) + ymm5
	vfmadd231ps	128(%r10,%rbx,4), %ymm10, %ymm4 # ymm4 = (ymm10 * mem) + ymm4
	vfmadd231ps	160(%r10,%rbx,4), %ymm10, %ymm3 # ymm3 = (ymm10 * mem) + ymm3
	vfmadd231ps	192(%r10,%rbx,4), %ymm10, %ymm2 # ymm2 = (ymm10 * mem) + ymm2
	vfmadd231ps	224(%r10,%rbx,4), %ymm10, %ymm1 # ymm1 = (ymm10 * mem) + ymm1
	jne	.LBB20_6
	jmp	.LBB20_7
.LBB20_8:
	popq	%rbx
	.cfi_def_cfa_offset 8
	.cfi_restore %rbx
	jmp	.LBB20_2
.LBB20_1:
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm9, %xmm9, %xmm9
.LBB20_2:
	vbroadcastss	%xmm0, %ymm0
	vmulps	%ymm0, %ymm9, %ymm8
	vmovaps	%ymm8, (%rdx)
	vmulps	%ymm7, %ymm0, %ymm7
	vmovaps	%ymm7, 32(%rdx)
	vmulps	%ymm6, %ymm0, %ymm6
	vmovaps	%ymm6, 64(%rdx)
	vmulps	%ymm5, %ymm0, %ymm5
	vmovaps	%ymm5, 96(%rdx)
	vmulps	%ymm4, %ymm0, %ymm4
	vmovaps	%ymm4, 128(%rdx)
	vmulps	%ymm3, %ymm0, %ymm3
	vmovaps	%ymm3, 160(%rdx)
	vmulps	%ymm2, %ymm0, %ymm2
	vmovaps	%ymm2, 192(%rdx)
	vmulps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, 224(%rdx)
	vzeroupper
	retq
.Lfunc_end20:
	.size	_ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf, .Lfunc_end20-_ZN3fx23opt12_GLOBAL__N_19pv_sparseIfEEvPKT_PKfifPf
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf
	.type	_ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf,@function
_ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf: # @_ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf
	.cfi_startproc
# %bb.0:
	testl	%esi, %esi
	jle	.LBB21_1
# %bb.3:
	movl	%esi, %eax
	shlq	$2, %rax
	vxorps	%xmm6, %xmm6, %xmm6
	xorl	%ecx, %ecx
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_ebE(%rip), %rsi
	vxorps	%xmm8, %xmm8, %xmm8
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	.p2align	4, 0x90
.LBB21_4:                               # =>This Inner Loop Header: Depth=1
	prefetcht0	4096(%rdi)
	vbroadcastss	(%rcx,%rsi), %ymm9
	vfmadd231ps	(%rdi), %ymm9, %ymm6    # ymm6 = (ymm9 * mem) + ymm6
	vfmadd231ps	32(%rdi), %ymm9, %ymm8  # ymm8 = (ymm9 * mem) + ymm8
	vfmadd231ps	64(%rdi), %ymm9, %ymm7  # ymm7 = (ymm9 * mem) + ymm7
	vfmadd231ps	96(%rdi), %ymm9, %ymm5  # ymm5 = (ymm9 * mem) + ymm5
	vfmadd231ps	128(%rdi), %ymm9, %ymm4 # ymm4 = (ymm9 * mem) + ymm4
	vfmadd231ps	160(%rdi), %ymm9, %ymm3 # ymm3 = (ymm9 * mem) + ymm3
	vfmadd231ps	192(%rdi), %ymm9, %ymm2 # ymm2 = (ymm9 * mem) + ymm2
	vfmadd231ps	224(%rdi), %ymm9, %ymm1 # ymm1 = (ymm9 * mem) + ymm1
	addq	$4, %rcx
	addq	$256, %rdi                      # imm = 0x100
	cmpq	%rcx, %rax
	jne	.LBB21_4
	jmp	.LBB21_2
.LBB21_1:
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm7, %xmm7, %xmm7
	vxorps	%xmm8, %xmm8, %xmm8
	vxorps	%xmm6, %xmm6, %xmm6
.LBB21_2:
	vbroadcastss	%xmm0, %ymm0
	vmulps	%ymm6, %ymm0, %ymm6
	vmovaps	%ymm6, (%rdx)
	vmulps	%ymm0, %ymm8, %ymm6
	vmovaps	%ymm6, 32(%rdx)
	vmulps	%ymm7, %ymm0, %ymm6
	vmovaps	%ymm6, 64(%rdx)
	vmulps	%ymm5, %ymm0, %ymm5
	vmovaps	%ymm5, 96(%rdx)
	vmulps	%ymm4, %ymm0, %ymm4
	vmovaps	%ymm4, 128(%rdx)
	vmulps	%ymm3, %ymm0, %ymm3
	vmovaps	%ymm3, 160(%rdx)
	vmulps	%ymm2, %ymm0, %ymm2
	vmovaps	%ymm2, 192(%rdx)
	vmulps	%ymm1, %ymm0, %ymm0
	vmovaps	%ymm0, 224(%rdx)
	vzeroupper
	retq
.Lfunc_end21:
	.size	_ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf, .Lfunc_end21-_ZN3fx23opt12_GLOBAL__N_112pv_dense_f32EPKfS3_ifPf
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function _ZN3fx23opt12_GLOBAL__N_18exp_passILb1ELi1024EEEfPKfiffPfRi
.LCPI22_0:
	.long	0x80000000                      # float -0
.LCPI22_1:
	.long	0x42b00000                      # float 88
.LCPI22_2:
	.long	0xc2aeac50                      # float -87.3365478
.LCPI22_3:
	.long	0x3f000000                      # float 0.5
.LCPI22_4:
	.long	0x3fb8aa3b                      # float 1.44269502
.LCPI22_5:
	.long	0x3f318000                      # float 0.693359375
.LCPI22_6:
	.long	0xb95e8083                      # float -2.12194442E-4
.LCPI22_7:
	.long	0x3e2aaaaa                      # float 0.166666657
.LCPI22_8:
	.long	0x3d2aa9c1                      # float 0.0416657962
.LCPI22_9:
	.long	0x3c088908                      # float 0.00833345205
.LCPI22_10:
	.long	0x3ab743ce                      # float 0.00139819994
.LCPI22_11:
	.long	0x39506967                      # float 1.98756912E-4
.LCPI22_12:
	.long	0x3f800000                      # float 1
	.section	.text._ZN3fx23opt12_GLOBAL__N_18exp_passILb1ELi1024EEEfPKfiffPfRi,"ax",@progbits
	.p2align	4, 0x90
	.type	_ZN3fx23opt12_GLOBAL__N_18exp_passILb1ELi1024EEEfPKfiffPfRi,@function
_ZN3fx23opt12_GLOBAL__N_18exp_passILb1ELi1024EEEfPKfiffPfRi: # @_ZN3fx23opt12_GLOBAL__N_18exp_passILb1ELi1024EEEfPKfiffPfRi
	.cfi_startproc
# %bb.0:
	subq	$648, %rsp                      # imm = 0x288
	.cfi_def_cfa_offset 656
	vbroadcastss	.LCPI22_0(%rip), %xmm2  # xmm2 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vbroadcastss	%xmm0, %ymm0
	vmovups	%ymm0, 352(%rsp)                # 32-byte Spill
	vxorps	%xmm2, %xmm1, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vmovups	%ymm0, 320(%rsp)                # 32-byte Spill
	vpcmpeqd	%ymm3, %ymm3, %ymm3
	vxorps	%xmm11, %xmm11, %xmm11
	movq	$-4, %rcx
	movl	$96, %edx
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_scE(%rip), %rsi
	vbroadcastss	.LCPI22_1(%rip), %ymm1  # ymm1 = [8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1,8.8E+1]
	vmovups	%ymm1, -32(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI22_2(%rip), %ymm1  # ymm1 = [-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1,-8.73365478E+1]
	vmovups	%ymm1, 96(%rsp)                 # 32-byte Spill
	vbroadcastss	.LCPI22_3(%rip), %ymm0  # ymm0 = [5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1,5.0E-1]
	vmovups	%ymm0, 224(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI22_4(%rip), %ymm0  # ymm0 = [1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0,1.44269502E+0]
	vmovups	%ymm0, 64(%rsp)                 # 32-byte Spill
	vbroadcastss	.LCPI22_5(%rip), %ymm0  # ymm0 = [6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1,6.93359375E-1]
	vmovups	%ymm0, 288(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI22_6(%rip), %ymm0  # ymm0 = [-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4,-2.12194442E-4]
	vmovups	%ymm0, 256(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI22_7(%rip), %ymm0  # ymm0 = [1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1,1.66666657E-1]
	vmovups	%ymm0, 32(%rsp)                 # 32-byte Spill
	vbroadcastss	.LCPI22_8(%rip), %ymm0  # ymm0 = [4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2,4.16657962E-2]
	vmovups	%ymm0, -64(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI22_9(%rip), %ymm0  # ymm0 = [8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3,8.33345205E-3]
	vmovups	%ymm0, -96(%rsp)                # 32-byte Spill
	vbroadcastss	.LCPI22_10(%rip), %ymm0 # ymm0 = [1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3,1.39819994E-3]
	vmovups	%ymm0, (%rsp)                   # 32-byte Spill
	vbroadcastss	.LCPI22_11(%rip), %ymm0 # ymm0 = [1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4,1.98756912E-4]
	vmovups	%ymm0, -128(%rsp)               # 32-byte Spill
	vbroadcastss	.LCPI22_12(%rip), %ymm0 # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vmovups	%ymm0, 192(%rsp)                # 32-byte Spill
	leaq	_ZN3fx23opt12_GLOBAL__N_14g_ebE(%rip), %rax
	vbroadcastss	.LCPI22_12(%rip), %ymm0 # ymm0 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vmovups	%ymm0, 160(%rsp)                # 32-byte Spill
	vxorps	%xmm1, %xmm1, %xmm1
	.p2align	4, 0x90
.LBB22_1:                               # =>This Inner Loop Header: Depth=1
	vmovdqu	%ymm3, 544(%rsp)                # 32-byte Spill
	vmovups	%ymm1, 576(%rsp)                # 32-byte Spill
	vmovups	%ymm11, 608(%rsp)               # 32-byte Spill
	vmovaps	-96(%rdx,%rsi), %ymm4
	vmovaps	-64(%rdx,%rsi), %ymm5
	vmovaps	-32(%rdx,%rsi), %ymm6
	vmovaps	(%rdx,%rsi), %ymm8
	vmovups	352(%rsp), %ymm2                # 32-byte Reload
	vsubps	%ymm2, %ymm4, %ymm0
	vmovups	%ymm0, 512(%rsp)                # 32-byte Spill
	vsubps	%ymm2, %ymm5, %ymm7
	vmovups	%ymm7, 416(%rsp)                # 32-byte Spill
	vsubps	%ymm2, %ymm6, %ymm1
	vmovups	%ymm1, 128(%rsp)                # 32-byte Spill
	vsubps	%ymm2, %ymm8, %ymm2
	vmovups	%ymm2, 448(%rsp)                # 32-byte Spill
	vmovups	-32(%rsp), %ymm1                # 32-byte Reload
	vminps	%ymm1, %ymm0, %ymm4
	vmovaps	%ymm1, %ymm3
	vmovups	96(%rsp), %ymm14                # 32-byte Reload
	vmaxps	%ymm14, %ymm4, %ymm4
	vmovups	64(%rsp), %ymm1                 # 32-byte Reload
	vmovaps	%ymm1, %ymm5
	vmovaps	%ymm1, %ymm11
	vmovups	224(%rsp), %ymm0                # 32-byte Reload
	vfmadd213ps	%ymm0, %ymm4, %ymm5     # ymm5 = (ymm4 * ymm5) + ymm0
	vroundps	$1, %ymm5, %ymm6
	vmovups	%ymm6, 480(%rsp)                # 32-byte Spill
	vmovups	288(%rsp), %ymm1                # 32-byte Reload
	vfnmadd231ps	%ymm1, %ymm6, %ymm4     # ymm4 = -(ymm6 * ymm1) + ymm4
	vmovups	256(%rsp), %ymm5                # 32-byte Reload
	vfnmadd231ps	%ymm5, %ymm6, %ymm4     # ymm4 = -(ymm6 * ymm5) + ymm4
	vmulps	%ymm4, %ymm4, %ymm6
	vmulps	%ymm6, %ymm6, %ymm8
	vmovups	32(%rsp), %ymm12                # 32-byte Reload
	vmovaps	%ymm12, %ymm9
	vfmadd213ps	%ymm0, %ymm4, %ymm9     # ymm9 = (ymm4 * ymm9) + ymm0
	vmovups	-96(%rsp), %ymm13               # 32-byte Reload
	vfmadd213ps	-64(%rsp), %ymm4, %ymm13 # 32-byte Folded Reload
                                        # ymm13 = (ymm4 * ymm13) + mem
	vmovups	-128(%rsp), %ymm15              # 32-byte Reload
	vmovups	(%rsp), %ymm10                  # 32-byte Reload
	vfmadd213ps	%ymm10, %ymm4, %ymm15   # ymm15 = (ymm4 * ymm15) + ymm10
	vfmadd213ps	%ymm9, %ymm6, %ymm13    # ymm13 = (ymm6 * ymm13) + ymm9
	vfmadd231ps	%ymm15, %ymm8, %ymm13   # ymm13 = (ymm8 * ymm15) + ymm13
	vfmadd213ps	%ymm4, %ymm6, %ymm13    # ymm13 = (ymm6 * ymm13) + ymm4
	vminps	%ymm3, %ymm7, %ymm4
	vmovaps	%ymm14, %ymm2
	vmaxps	%ymm14, %ymm4, %ymm8
	vmovaps	%ymm11, %ymm4
	vfmadd213ps	%ymm0, %ymm8, %ymm4     # ymm4 = (ymm8 * ymm4) + ymm0
	vroundps	$1, %ymm4, %ymm4
	vmovups	%ymm4, 384(%rsp)                # 32-byte Spill
	vmovaps	%ymm1, %ymm3
	vfnmadd231ps	%ymm1, %ymm4, %ymm8     # ymm8 = -(ymm4 * ymm1) + ymm8
	vmovaps	%ymm5, %ymm6
	vfnmadd231ps	%ymm5, %ymm4, %ymm8     # ymm8 = -(ymm4 * ymm5) + ymm8
	vmulps	%ymm8, %ymm8, %ymm9
	vmulps	%ymm9, %ymm9, %ymm15
	vmovaps	%ymm12, %ymm1
	vmovaps	%ymm12, %ymm11
	vfmadd213ps	%ymm0, %ymm8, %ymm11    # ymm11 = (ymm8 * ymm11) + ymm0
	vmovups	-96(%rsp), %ymm5                # 32-byte Reload
	vmovaps	%ymm5, %ymm4
	vmovups	-64(%rsp), %ymm14               # 32-byte Reload
	vfmadd213ps	%ymm14, %ymm8, %ymm4    # ymm4 = (ymm8 * ymm4) + ymm14
	vmovups	-128(%rsp), %ymm7               # 32-byte Reload
	vmovaps	%ymm7, %ymm12
	vfmadd213ps	%ymm10, %ymm8, %ymm12   # ymm12 = (ymm8 * ymm12) + ymm10
	vfmadd213ps	%ymm11, %ymm9, %ymm4    # ymm4 = (ymm9 * ymm4) + ymm11
	vfmadd231ps	%ymm12, %ymm15, %ymm4   # ymm4 = (ymm15 * ymm12) + ymm4
	vfmadd213ps	%ymm8, %ymm9, %ymm4     # ymm4 = (ymm9 * ymm4) + ymm8
	vmovups	128(%rsp), %ymm8                # 32-byte Reload
	vminps	-32(%rsp), %ymm8, %ymm8         # 32-byte Folded Reload
	vmaxps	%ymm2, %ymm8, %ymm11
	vmovups	64(%rsp), %ymm2                 # 32-byte Reload
	vmovaps	%ymm2, %ymm8
	vfmadd213ps	%ymm0, %ymm11, %ymm8    # ymm8 = (ymm11 * ymm8) + ymm0
	vroundps	$1, %ymm8, %ymm8
	vfnmadd231ps	%ymm3, %ymm8, %ymm11    # ymm11 = -(ymm8 * ymm3) + ymm11
	vfnmadd231ps	%ymm6, %ymm8, %ymm11    # ymm11 = -(ymm8 * ymm6) + ymm11
	vmulps	%ymm11, %ymm11, %ymm12
	vmulps	%ymm12, %ymm12, %ymm15
	vfmadd213ps	%ymm0, %ymm11, %ymm1    # ymm1 = (ymm11 * ymm1) + ymm0
	vmovaps	%ymm5, %ymm9
	vfmadd213ps	%ymm14, %ymm11, %ymm9   # ymm9 = (ymm11 * ymm9) + ymm14
	vmovaps	%ymm7, %ymm14
	vmovups	(%rsp), %ymm5                   # 32-byte Reload
	vfmadd213ps	%ymm5, %ymm11, %ymm14   # ymm14 = (ymm11 * ymm14) + ymm5
	vfmadd213ps	%ymm1, %ymm12, %ymm9    # ymm9 = (ymm12 * ymm9) + ymm1
	vfmadd231ps	%ymm14, %ymm15, %ymm9   # ymm9 = (ymm15 * ymm14) + ymm9
	vfmadd213ps	%ymm11, %ymm12, %ymm9   # ymm9 = (ymm12 * ymm9) + ymm11
	vmovups	448(%rsp), %ymm7                # 32-byte Reload
	vminps	-32(%rsp), %ymm7, %ymm10        # 32-byte Folded Reload
	vmaxps	96(%rsp), %ymm10, %ymm10        # 32-byte Folded Reload
	vmovups	576(%rsp), %ymm1                # 32-byte Reload
	vfmadd213ps	%ymm0, %ymm10, %ymm2    # ymm2 = (ymm10 * ymm2) + ymm0
	vroundps	$1, %ymm2, %ymm11
	vfnmadd231ps	%ymm3, %ymm11, %ymm10   # ymm10 = -(ymm11 * ymm3) + ymm10
	vfnmadd231ps	%ymm6, %ymm11, %ymm10   # ymm10 = -(ymm11 * ymm6) + ymm10
	vmulps	%ymm10, %ymm10, %ymm12
	vmovups	32(%rsp), %ymm14                # 32-byte Reload
	vfmadd213ps	%ymm0, %ymm10, %ymm14   # ymm14 = (ymm10 * ymm14) + ymm0
	vmovups	-96(%rsp), %ymm15               # 32-byte Reload
	vfmadd213ps	-64(%rsp), %ymm10, %ymm15 # 32-byte Folded Reload
                                        # ymm15 = (ymm10 * ymm15) + mem
	vfmadd213ps	%ymm14, %ymm12, %ymm15  # ymm15 = (ymm12 * ymm15) + ymm14
	vmovups	-128(%rsp), %ymm14              # 32-byte Reload
	vfmadd213ps	%ymm5, %ymm10, %ymm14   # ymm14 = (ymm10 * ymm14) + ymm5
	vmulps	%ymm12, %ymm12, %ymm2
	vfmadd231ps	%ymm14, %ymm2, %ymm15   # ymm15 = (ymm2 * ymm14) + ymm15
	vfmadd213ps	%ymm10, %ymm12, %ymm15  # ymm15 = (ymm12 * ymm15) + ymm10
	vmovups	192(%rsp), %ymm0                # 32-byte Reload
	vaddps	%ymm0, %ymm13, %ymm2
	vcvtps2dq	480(%rsp), %ymm5        # 32-byte Folded Reload
	vpslld	$23, %ymm5, %ymm5
	vmovdqu	160(%rsp), %ymm3                # 32-byte Reload
	vpaddd	%ymm3, %ymm5, %ymm5
	vmulps	%ymm5, %ymm2, %ymm2
	vaddps	%ymm0, %ymm4, %ymm4
	vcvtps2dq	384(%rsp), %ymm5        # 32-byte Folded Reload
	vpslld	$23, %ymm5, %ymm5
	vpaddd	%ymm3, %ymm5, %ymm5
	vmulps	%ymm5, %ymm4, %ymm4
	vaddps	%ymm0, %ymm9, %ymm5
	vcvtps2dq	%ymm8, %ymm6
	vpslld	$23, %ymm6, %ymm6
	vpaddd	%ymm3, %ymm6, %ymm6
	vmulps	%ymm6, %ymm5, %ymm5
	vaddps	%ymm0, %ymm15, %ymm6
	vcvtps2dq	%ymm11, %ymm8
	vmovups	608(%rsp), %ymm11               # 32-byte Reload
	vpslld	$23, %ymm8, %ymm8
	vpaddd	%ymm3, %ymm8, %ymm8
	vmulps	%ymm6, %ymm8, %ymm6
	vmovups	320(%rsp), %ymm10               # 32-byte Reload
	vcmpleps	512(%rsp), %ymm10, %ymm8        # 32-byte Folded Reload
	vcmpleps	416(%rsp), %ymm10, %ymm9        # 32-byte Folded Reload
	vandps	%ymm2, %ymm8, %ymm2
	vandps	%ymm4, %ymm9, %ymm4
	vmovaps	%ymm2, -96(%rdx,%rax)
	vmovaps	%ymm4, -64(%rdx,%rax)
	vaddps	%ymm4, %ymm2, %ymm2
	vaddps	%ymm2, %ymm11, %ymm11
	vcmpleps	128(%rsp), %ymm10, %ymm2        # 32-byte Folded Reload
	vcmpleps	%ymm7, %ymm10, %ymm4
	vandps	%ymm2, %ymm5, %ymm5
	vandps	%ymm4, %ymm6, %ymm6
	vmovaps	%ymm5, -32(%rdx,%rax)
	vmovaps	%ymm6, (%rdx,%rax)
	vaddps	%ymm6, %ymm5, %ymm5
	vaddps	%ymm5, %ymm1, %ymm1
	vandps	544(%rsp), %ymm8, %ymm5         # 32-byte Folded Reload
	vandps	%ymm2, %ymm9, %ymm2
	vandps	%ymm2, %ymm5, %ymm2
	vandps	%ymm4, %ymm2, %ymm3
	addq	$4, %rcx
	subq	$-128, %rdx
	cmpq	$121, %rcx
	jb	.LBB22_1
# %bb.2:
	vpcmpeqd	%ymm2, %ymm2, %ymm2
	vtestps	%ymm2, %ymm3
	jb	.LBB22_3
# %bb.4:
	vxorps	%xmm2, %xmm2, %xmm2
	xorl	%ecx, %ecx
	vpxor	%xmm3, %xmm3, %xmm3
	.p2align	4, 0x90
.LBB22_5:                               # =>This Inner Loop Header: Depth=1
	vcmpneq_oqps	(%rcx,%rax), %ymm2, %ymm4
	vcmpneq_oqps	32(%rcx,%rax), %ymm2, %ymm5
	vpsubd	%ymm4, %ymm3, %ymm3
	vpsubd	%ymm5, %ymm3, %ymm3
	addq	$64, %rcx
	cmpq	$4096, %rcx                     # imm = 0x1000
	jne	.LBB22_5
# %bb.6:
	vextracti128	$1, %ymm3, %xmm2
	vpaddd	%xmm3, %xmm2, %xmm2
	vpshufd	$78, %xmm2, %xmm3               # xmm3 = xmm2[2,3,0,1]
	vpaddd	%xmm2, %xmm3, %xmm2
	vpshufd	$85, %xmm2, %xmm3               # xmm3 = xmm2[1,1,1,1]
	vpaddd	%xmm2, %xmm3, %xmm2
	vmovd	%xmm2, %eax
	jmp	.LBB22_7
.LBB22_3:
	movl	$1024, %eax                     # imm = 0x400
.LBB22_7:
	movl	%eax, (%rdi)
	vaddps	%ymm1, %ymm11, %ymm0
	vextractf128	$1, %ymm0, %xmm1
	vaddps	%xmm1, %xmm0, %xmm0
	vshufpd	$1, %xmm0, %xmm0, %xmm1         # xmm1 = xmm0[1,0]
	vaddps	%xmm1, %xmm0, %xmm0
	vmovshdup	%xmm0, %xmm1            # xmm1 = xmm0[1,1,3,3]
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$648, %rsp                      # imm = 0x288
	.cfi_def_cfa_offset 8
	vzeroupper
	retq
.Lfunc_end22:
	.size	_ZN3fx23opt12_GLOBAL__N_18exp_passILb1ELi1024EEEfPKfiffPfRi, .Lfunc_end22-_ZN3fx23opt12_GLOBAL__N_18exp_passILb1ELi1024EEEfPKfiffPfRi
	.cfi_endproc
                                        # -- End function
	.type	_ZN3fx23opt11g_attn_profE,@object # @_ZN3fx23opt11g_attn_profE
	.section	.bss._ZN3fx23opt11g_attn_profE,"aw",@nobits
	.globl	_ZN3fx23opt11g_attn_profE
	.p2align	4, 0x0
_ZN3fx23opt11g_attn_profE:
	.zero	32
	.size	_ZN3fx23opt11g_attn_profE, 32

	.type	_ZN3fx23opt12_GLOBAL__N_14g_scE,@object # @_ZN3fx23opt12_GLOBAL__N_14g_scE
	.section	.bss._ZN3fx23opt12_GLOBAL__N_14g_scE,"aw",@nobits
	.p2align	6, 0x0
_ZN3fx23opt12_GLOBAL__N_14g_scE:
	.zero	4224
	.size	_ZN3fx23opt12_GLOBAL__N_14g_scE, 4224

	.type	_ZN3fx23opt12_GLOBAL__N_14g_ebE,@object # @_ZN3fx23opt12_GLOBAL__N_14g_ebE
	.section	.bss._ZN3fx23opt12_GLOBAL__N_14g_ebE,"aw",@nobits
	.p2align	6, 0x0
_ZN3fx23opt12_GLOBAL__N_14g_ebE:
	.zero	4224
	.size	_ZN3fx23opt12_GLOBAL__N_14g_ebE, 4224

	.ident	"Debian clang version 17.0.6 (++20231208085813+6009708b4367-1~exp1~20231208085906.81)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _ZN3fx23opt12_GLOBAL__N_14g_ebE
