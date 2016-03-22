	.file	"dot_product.c"
	.text
	.globl	dot_product
	.type	dot_product, @function
dot_product:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	.LC0, %eax
	movl	%eax, -4(%ebp)
	movl	$0, -8(%ebp)
    xorps   %xmm2, %xmm2 # zero out xmm2
	jmp	.L2
.L3:
	movl	-8(%ebp), %eax # get value of i
	leal	0(,%eax,4), %edx # compute offset by i
	movl	8(%ebp), %eax # get v1 base addr
	addl	%edx, %eax # get v1[i]
	movups	(%eax), %xmm0 # move v1[i]:v1[i+3] into xmm0
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movups	(%eax), %xmm1 # move v2[i]:v2[i+3] into xmm1
	dpps	$241, %xmm1, %xmm0 # dot product of v1[i]:v1[i+3] and v2[i]:v2[i+3], store in xmm0
    addss   %xmm0, %xmm2 # add dot product into xmm2
	addl	$4, -8(%ebp) # increment i by 4
.L2:
	movl	-8(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L3
    movd    %xmm2, -20(%ebp) # read lowest 32-bit retval from xmm2
	flds	-20(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	dot_product, .-dot_product
	.section	.rodata
	.align 4
.LC0:
	.long	0
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.1) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
