# MIPS assembly generated from BADA source.
.data
enter_msg : .asciiz	"\nbegin program\n"
exit_msg : .asciiz "\nend program\n"

# user string literals:

literal_3:	.asciiz	"failed test "	# a string
LOCALS_1 = -24
literal_4:	.asciiz	" tests taken. Failed "	# a string
LOCALS_0 = -40

.text
.globl main
# begin user procedures

test_1:			# begin user procedure
	addiu	$sp, LOCALS_1			# space for local vars
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	sw	$ra, 8($fp)			# save return so we can make calls
	li	$t0, 1			# place a literal in register
	sw	$t0, 20($sp)			# move literal to memory
	lw	$t0, 4($sp)			# load left op
	lw	$t1, 20($sp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, 20($sp)			# store result
	lw	$t0, 20($sp)			# load op
	sw	$t0, 4($sp)			# assignment
	lw	$t0, 0($sp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, 0($sp)			# store result
	lw	$t0, 0($sp)			# load if expression
	beq	$t0, $0, if_2			# jump past when false
	li	$t0, 1			# place a literal in register
	sw	$t0, 24($sp)			# move literal to memory
	lw	$t0, 8($sp)			# load left op
	lw	$t1, 24($sp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, 24($sp)			# store result
	lw	$t0, 24($sp)			# load op
	sw	$t0, 8($sp)			# assignment
	li	$v0, 4			# write string function
	la	$a0, literal_3			# load string literal
	syscall			# do the write string
	li	$v0, 1			# write integer function
	lw	$a0, 4($sp)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
	if_2:			# after the if block
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, LOCALS_1			# restore locals space
jr	$ra			# end procedure test_1

main_0:			# begin user procedure
	addiu	$sp, LOCALS_0			# space for local vars
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	sw	$ra, 8($fp)			# save return so we can make calls
	li	$t0, 0			# place a literal in register
	sw	$t0, 36($sp)			# move literal to memory
	lw	$t0, 36($sp)			# load op
	sw	$t0, 4($sp)			# assignment
	li	$t0, 0			# place a literal in register
	sw	$t0, 40($sp)			# move literal to memory
	lw	$t0, 40($sp)			# load op
	sw	$t0, 8($sp)			# assignment
	li	$v0, 1			# write integer function
	lw	$a0, 4($sp)			# load the integer
	syscall			# do the write integer
	li	$v0, 4			# write string function
	la	$a0, literal_4			# load string literal
	syscall			# do the write string
	li	$v0, 1			# write integer function
	lw	$a0, 8($sp)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, LOCALS_0			# restore locals space
jr	$ra			# end procedure main_0


# end user procedures.

main:
		# program entry point
	li $v0, 4
	la $a0, enter_msg
	syscall		#print string


	jal	main_0			# call user procedure

	li $v0, 4
	la $a0, exit_msg
	syscall		# print string

	li $v0, 10
	syscall		# exit program



