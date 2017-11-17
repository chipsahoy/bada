# MIPS assembly generated from BADA source.
.data
enter_msg : .asciiz	"\nbegin program\n"
exit_msg : .asciiz "\nend program\n"

# user string literals:

literal1:	.asciiz	"enter a positive integer: "	# a string
literal5:	.asciiz	"FIVE!"	# a string
literal6:	.asciiz	"
"	# a string
literal8:	.asciiz	"
"	# a string
literal10:	.asciiz	"final answer is "	# a string

.text
.globl main
# begin user procedures

_0_main:			# begin user procedure
	li	$v0, 4			# write string function
	la	$a0, literal1			# load string literal
	syscall			# do the write string
	li	$v0, 5			# read integer function
	syscall			# do the read
	sw	$v0, 0($sp)			# store result
	while_2:			# before the while expression
	li	$t0, 0			# place a literal in register
	sw	$t0, -4($sp)			# move literal to memory
	lw	$t0, -4($sp)			# load left op
	lw	$t1, 0($sp)			# load right op
	slt	$t2, $t0, $t1			# binary op
	sw	$t2, -4($sp)			# store result
	lw	$t0, -4($sp)			# load if expression
	beq	$t0, $0, if_3			# jump past when false
	li	$t0, 1			# place a literal in register
	sw	$t0, -8($sp)			# move literal to memory
	lw	$t0, 0($sp)			# load left op
	lw	$t1, -8($sp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -8($sp)			# store result
	lw	$t0, -8($sp)			# load op
	sw	$t0, 0($sp)			# assignment
	li	$t0, 5			# place a literal in register
	sw	$t0, -12($sp)			# move literal to memory
	lw	$t0, 0($sp)			# load left op
	lw	$t1, -12($sp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -12($sp)			# store result
	lw	$t0, -12($sp)			# load if expression
	beq	$t0, $0, if_4			# jump past when false
	li	$v0, 4			# write string function
	la	$a0, literal5			# load string literal
	syscall			# do the write string
	li	$v0, 4			# write string function
	la	$a0, literal6			# load string literal
	syscall			# do the write string
	if_4:			# after the if block
	li	$t0, 5			# place a literal in register
	sw	$t0, -16($sp)			# move literal to memory
	lw	$t0, 0($sp)			# load left op
	lw	$t1, -16($sp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -16($sp)			# store result
	lw	$t0, -16($sp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, -16($sp)			# store result
	lw	$t0, -16($sp)			# load if expression
	beq	$t0, $0, if_7			# jump past when false
	li	$v0, 1			# write integer function
	lw	$a0, 0($sp)			# load the integer
	syscall			# do the write integer
	li	$v0, 4			# write string function
	la	$a0, literal8			# load string literal
	syscall			# do the write string
	if_7:			# after the if block
	j	while_2			# jump to start of while
	if_3:			# after the if block
	li	$t0, 0			# place a literal in register
	sw	$t0, -20($sp)			# move literal to memory
	lw	$t0, -20($sp)			# load if expression
	beq	$t0, $0, if_9			# jump past when false
	li	$t0, 0			# place a literal in register
	sw	$t0, -24($sp)			# move literal to memory
	lw	$t0, -24($sp)			# load op
	sw	$t0, 0($sp)			# assignment
	if_9:			# after the if block
	li	$v0, 4			# write string function
	la	$a0, literal10			# load string literal
	syscall			# do the write string
	li	$v0, 1			# write integer function
	lw	$a0, 0($sp)			# load the integer
	syscall			# do the write integer
jr	$ra			# end procedure _0_main


# end user procedures.

main:
		# program entry point
	li $v0, 4
	la $a0, enter_msg
	syscall		#print string


	jal	_0_main			# call user procedure

	li $v0, 4
	la $a0, exit_msg
	syscall		# print string

	li $v0, 10
	syscall		# exit program



