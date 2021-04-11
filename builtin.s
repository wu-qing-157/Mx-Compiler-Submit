	.file	"builtin.c"
	.option nopic
	.text
	.align	2
	.globl	_malloc_o_
	.type	_malloc_o_, @function
_malloc_o_:
	tail	malloc
	.size	_malloc_o_, .-_malloc_o_
	.align	2
	.globl	_malloc_s_
	.type	_malloc_s_, @function
_malloc_s_:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	addi	a0,a0,5
	sw	ra,12(sp)
	call	malloc
	sw	s0,0(a0)
	add	a5,a0,s0
	sb	zero,4(a5)
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	_malloc_s_, .-_malloc_s_
	.align	2
	.globl	_malloc_a_
	.type	_malloc_a_, @function
_malloc_a_:
	addi	sp,sp,-16
	sw	s0,8(sp)
	mv	s0,a0
	slli	a0,a0,2
	addi	a0,a0,4
	sw	ra,12(sp)
	call	malloc
	sw	s0,0(a0)
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	a0,a0,4
	addi	sp,sp,16
	jr	ra
	.size	_malloc_a_, .-_malloc_a_
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"%d"
	.text
	.align	2
	.globl	_get_i_
	.type	_get_i_, @function
_get_i_:
	addi	sp,sp,-32
	lui	a0,%hi(.LC0)
	addi	a1,sp,12
	addi	a0,a0,%lo(.LC0)
	sw	ra,28(sp)
	call	__isoc99_scanf
	lw	ra,28(sp)
	lw	a0,12(sp)
	addi	sp,sp,32
	jr	ra
	.size	_get_i_, .-_get_i_
	.section	.rodata.str1.4
	.align	2
.LC1:
	.string	"%s"
	.text
	.align	2
	.globl	_get_s_
	.type	_get_s_, @function
_get_s_:
	addi	sp,sp,-16
	sw	s2,0(sp)
	lui	a0,%hi(.LC1)
	lui	s2,%hi(input)
	addi	a1,s2,%lo(input)
	addi	a0,a0,%lo(.LC1)
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	call	__isoc99_scanf
	addi	a0,s2,%lo(input)
	call	strlen
	mv	s1,a0
	addi	a0,a0,5
	call	malloc
	sw	s1,0(a0)
	add	a5,a0,s1
	mv	s0,a0
	addi	a2,s1,1
	addi	a1,s2,%lo(input)
	addi	a0,a0,4
	sb	zero,4(a5)
	call	memcpy
	lw	ra,12(sp)
	mv	a0,s0
	lw	s0,8(sp)
	lw	s1,4(sp)
	lw	s2,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	_get_s_, .-_get_s_
	.align	2
	.globl	_print_s_
	.type	_print_s_, @function
_print_s_:
	addi	a1,a0,4
	lui	a0,%hi(.LC1)
	addi	a0,a0,%lo(.LC1)
	tail	printf
	.size	_print_s_, .-_print_s_
	.align	2
	.globl	_println_s_
	.type	_println_s_, @function
_println_s_:
	addi	a0,a0,4
	tail	puts
	.size	_println_s_, .-_println_s_
	.align	2
	.globl	_print_i_
	.type	_print_i_, @function
_print_i_:
	mv	a1,a0
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	tail	printf
	.size	_print_i_, .-_print_i_
	.section	.rodata.str1.4
	.align	2
.LC2:
	.string	"%d\n"
	.text
	.align	2
	.globl	_println_i_
	.type	_println_i_, @function
_println_i_:
	mv	a1,a0
	lui	a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	tail	printf
	.size	_println_i_, .-_println_i_
	.align	2
	.globl	_to_str_
	.type	_to_str_, @function
_to_str_:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	blt	a0,zero,.L27
	bne	a0,zero,.L23
	li	a5,48
	lui	s0,%hi(d)
	li	a0,6
	sb	a5,%lo(d)(s0)
	call	malloc
	lbu	a5,%lo(d)(s0)
	li	a4,1
	sw	a4,0(a0)
	sb	zero,5(a0)
	sb	a5,4(a0)
.L15:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L27:
	neg	a0,a0
	li	s3,1
.L17:
	lui	s0,%hi(d)
	addi	s1,s0,%lo(d)
	li	a4,10
	addi	s0,s0,%lo(d)
.L19:
	rem	a5,a0,a4
	addi	s0,s0,1
	div	a0,a0,a4
	addi	a5,a5,48
	sb	a5,-1(s0)
	bne	a0,zero,.L19
	sub	s2,s0,s1
	add	s2,s2,s3
	addi	a0,s2,5
	call	malloc
	sw	s2,0(a0)
	add	s2,a0,s2
	sb	zero,4(s2)
	addi	a5,a0,4
	beq	s3,zero,.L21
	li	a4,45
	addi	a5,a0,5
	sb	a4,4(a0)
.L21:
	beq	s0,s1,.L15
.L22:
	lbu	a4,-1(s0)
	addi	s0,s0,-1
	addi	a5,a5,1
	sb	a4,-1(a5)
	bne	s0,s1,.L22
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	addi	sp,sp,32
	jr	ra
.L23:
	li	s3,0
	j	.L17
	.size	_to_str_, .-_to_str_
	.align	2
	.globl	_s_length_
	.type	_s_length_, @function
_s_length_:
	lw	a0,0(a0)
	ret
	.size	_s_length_, .-_s_length_
	.align	2
	.globl	_s_ord_
	.type	_s_ord_, @function
_s_ord_:
	add	a0,a0,a1
	lbu	a0,4(a0)
	ret
	.size	_s_ord_, .-_s_ord_
	.align	2
	.globl	_s_parse_
	.type	_s_parse_, @function
_s_parse_:
	addi	sp,sp,-32
	lui	a1,%hi(.LC0)
	addi	a2,sp,12
	addi	a1,a1,%lo(.LC0)
	addi	a0,a0,4
	sw	ra,28(sp)
	call	__isoc99_sscanf
	lw	ra,28(sp)
	lw	a0,12(sp)
	addi	sp,sp,32
	jr	ra
	.size	_s_parse_, .-_s_parse_
	.align	2
	.globl	_s_substring_
	.type	_s_substring_, @function
_s_substring_:
	addi	sp,sp,-32
	sw	s3,12(sp)
	sub	s3,a2,a1
	sw	s4,8(sp)
	mv	s4,a0
	addi	a0,s3,5
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	ra,28(sp)
	mv	s0,a1
	mv	s2,a2
	call	malloc
	sw	s3,0(a0)
	add	a5,a0,s3
	sb	zero,4(a5)
	mv	s1,a0
	ble	s2,s0,.L32
	addi	a1,s0,4
	mv	a2,s3
	add	a1,s4,a1
	addi	a0,a0,4
	call	memcpy
.L32:
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	mv	a0,s1
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
	.size	_s_substring_, .-_s_substring_
	.align	2
	.globl	_s_concatenate_
	.type	_s_concatenate_, @function
_s_concatenate_:
	addi	sp,sp,-32
	sw	s1,20(sp)
	sw	s5,4(sp)
	lw	s1,0(a0)
	lw	s5,0(a1)
	sw	s2,16(sp)
	sw	s4,8(sp)
	add	s2,s1,s5
	mv	s4,a0
	addi	a0,s2,5
	sw	s0,24(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	mv	s3,a1
	call	malloc
	sw	s2,0(a0)
	add	s2,a0,s2
	sb	zero,4(s2)
	mv	s0,a0
	ble	s1,zero,.L38
	mv	a2,s1
	addi	a1,s4,4
	addi	a0,a0,4
	call	memcpy
.L36:
	ble	s5,zero,.L35
	addi	a0,s1,4
	mv	a2,s5
	addi	a1,s3,4
	add	a0,s0,a0
	call	memcpy
.L35:
	lw	ra,28(sp)
	mv	a0,s0
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	lw	s3,12(sp)
	lw	s4,8(sp)
	lw	s5,4(sp)
	addi	sp,sp,32
	jr	ra
.L38:
	li	s1,0
	j	.L36
	.size	_s_concatenate_, .-_s_concatenate_
	.align	2
	.globl	_s_equal_
	.type	_s_equal_, @function
_s_equal_:
	lbu	a5,4(a0)
	lbu	a4,4(a1)
	addi	a0,a0,4
	addi	a1,a1,4
	beq	a4,a5,.L42
	j	.L43
.L46:
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	bne	a4,a5,.L43
.L42:
	addi	a0,a0,1
	addi	a1,a1,1
	bne	a5,zero,.L46
	li	a0,1
	ret
.L43:
	li	a0,0
	ret
	.size	_s_equal_, .-_s_equal_
	.align	2
	.globl	_s_neq_
	.type	_s_neq_, @function
_s_neq_:
	mv	a5,a0
	lbu	a4,4(a1)
	lbu	a0,4(a0)
	addi	a5,a5,4
	addi	a1,a1,4
	beq	a4,a0,.L49
	j	.L50
.L55:
	lbu	a0,0(a5)
	lbu	a4,0(a1)
	bne	a4,a0,.L50
.L49:
	addi	a5,a5,1
	addi	a1,a1,1
	bne	a0,zero,.L55
	ret
.L50:
	li	a0,1
	ret
	.size	_s_neq_, .-_s_neq_
	.align	2
	.globl	_s_less_
	.type	_s_less_, @function
_s_less_:
	mv	a5,a0
	lbu	a4,4(a1)
	lbu	a0,4(a0)
	addi	a5,a5,4
	addi	a1,a1,4
	bgeu	a0,a4,.L58
	j	.L59
.L65:
	beq	a0,zero,.L57
	lbu	a0,0(a5)
	lbu	a4,0(a1)
	bltu	a0,a4,.L59
.L58:
	addi	a5,a5,1
	addi	a1,a1,1
	bleu	a0,a4,.L65
	li	a0,0
.L57:
	ret
.L59:
	li	a0,1
	ret
	.size	_s_less_, .-_s_less_
	.align	2
	.globl	_s_leq_
	.type	_s_leq_, @function
_s_leq_:
	lbu	a5,4(a0)
	lbu	a4,4(a1)
	addi	a0,a0,4
	addi	a1,a1,4
	bleu	a5,a4,.L68
	j	.L69
.L73:
	beq	a5,zero,.L71
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	bgtu	a5,a4,.L69
.L68:
	addi	a0,a0,1
	addi	a1,a1,1
	bgeu	a5,a4,.L73
.L71:
	li	a0,1
	ret
.L69:
	li	a0,0
	ret
	.size	_s_leq_, .-_s_leq_
	.align	2
	.globl	_s_greater_
	.type	_s_greater_, @function
_s_greater_:
	mv	a5,a0
	lbu	a4,4(a1)
	lbu	a0,4(a0)
	addi	a5,a5,4
	addi	a1,a1,4
	bleu	a0,a4,.L76
	j	.L77
.L83:
	beq	a0,zero,.L75
	lbu	a0,0(a5)
	lbu	a4,0(a1)
	bgtu	a0,a4,.L77
.L76:
	addi	a5,a5,1
	addi	a1,a1,1
	bgeu	a0,a4,.L83
	li	a0,0
.L75:
	ret
.L77:
	li	a0,1
	ret
	.size	_s_greater_, .-_s_greater_
	.align	2
	.globl	_s_geq_
	.type	_s_geq_, @function
_s_geq_:
	lbu	a5,4(a0)
	lbu	a4,4(a1)
	addi	a0,a0,4
	addi	a1,a1,4
	bgeu	a5,a4,.L86
	j	.L87
.L91:
	beq	a5,zero,.L89
	lbu	a5,0(a0)
	lbu	a4,0(a1)
	bltu	a5,a4,.L87
.L86:
	addi	a0,a0,1
	addi	a1,a1,1
	bleu	a5,a4,.L91
.L89:
	li	a0,1
	ret
.L87:
	li	a0,0
	ret
	.size	_s_geq_, .-_s_geq_
	.comm	d,15,4
	.comm	input,257,4
	.ident	"GCC: (GNU) 9.2.0"
	.section	.note.GNU-stack,"",@progbits
