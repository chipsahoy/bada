# MIPS assembly generated from BADA source.
.data
enter_msg : .asciiz	"\nbegin program\n"
exit_msg : .asciiz "\nend program\n"

# user string literals:

literal_2:	.asciiz	"enter a positive integer: "	# a string
LOCALS_1 = -8
literal_3:	.asciiz	"after foo "	# a string
LOCALS_0 = -8

.text
.globl main
# begin user procedures

# source line #1
# source line #2
# source line #3
# source line #5
# source line #6
# begin procedure foo_1
foo_1:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_1			# space for local vars
# source line #7
	li	$v0, 4			# write string function
	la	$a0, literal_2			# load string literal
	syscall			# do the write string
# source line #8
	li	$v0, 5			# read integer function
	syscall			# do the read
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 12($t4)			# next frame
	sw	$v0, 0($t4)			# store result
# source line #9
	li	$t0, 5			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, 0($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -4($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 12($t4)			# next frame
	lw	$t0, 0($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, 0($t4)			# load right op
	addu	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -4($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 16($t4)			# deref pointer
	sw	$t0, 0($t4)			# assignment
# source line #10
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 16			# restore locals space
	jr	$ra			# 
# end procedure foo_1

# source line #12
# begin procedure main_0
main_0:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_0			# space for local vars
# source line #13
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	la	$t0, -4($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	foo_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #14
	li	$v0, 4			# write string function
	la	$a0, literal_3			# load string literal
	syscall			# do the write string
# source line #15
	li	$v0, 1			# write integer function
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$a0, -4($t4)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #16
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 16			# restore locals space
	jr	$ra			# 
# end procedure main_0


# end user procedures.

main:
		# program entry point
	addiu $sp, $sp, -12		# space for stack frame
	addu $fp, $sp, $0		# init frame
	sw $0 12($fp)	# initial pfp is null
	li $v0, 4
	la $a0, enter_msg
	syscall		#print string


	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	main_0			# call user procedure
	addiu	$sp, $sp, 4			# pop params

	li $v0, 4
	la $a0, exit_msg
	syscall		# print string

	li $v0, 10
	syscall		# exit program



