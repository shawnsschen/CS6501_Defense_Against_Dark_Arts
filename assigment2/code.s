	.file	"code.c"
	.section	.rodata
.LC0:
	.string	"Sum is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$48, %esp
	movl	%gs:20, %eax
	movl	%eax, 44(%esp)
	xorl	%eax, %eax
	movl	$6, 8(%esp)
	movl	$13, 4(%esp)
	leal	24(%esp), %eax
	movl	%eax, (%esp)
	call	foo
	movl	%eax, 20(%esp)
	movl	$0, 16(%esp)
	movl	$0, 12(%esp)
	jmp	.L2
.L3:
	leal	24(%esp), %eax
	addl	12(%esp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	addl	%eax, 16(%esp)
	addl	$1, 12(%esp)
.L2:
	cmpl	$12, 12(%esp)
	jle	.L3
	movl	$.LC0, %eax
	movl	16(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$0, %eax
	movl	44(%esp), %edx
	xorl	%gs:20, %edx
	je	.L4
	call	__stack_chk_fail
.L4:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	foo
	.type	foo, @function
foo:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -16(%ebp)
	jmp	.L6
.L7:
	movl	-16(%ebp), %eax
	addl	8(%ebp), %eax
	movl	16(%ebp), %edx
	movb	%dl, (%eax)
	addl	$1, -16(%ebp)
.L6:
	movl	-16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L7
	movl	12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	foo, .-foo
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
