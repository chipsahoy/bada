# MIPS assembly generated from BADA source.
.data
enter_msg : .asciiz	"\nbegin program\n"
exit_msg : .asciiz "\nend program\n"
true_msg : .asciiz "true"
false_msg : .asciiz "false"

# user string literals:

literal_2:	.asciiz	"enter a float: "	# a string
LOCALS_1 = 0
literal_3:	.asciiz	"after foo "	# a string
LOCALS_0 = -16

.text
.globl main
# begin user procedures

# source line #1
# source line #2
# source line #3
# source line #4
# source line #6
# source line #7
# begin procedure foo_1
foo_1:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_1			# space for local vars
# source line #8
	li	$v0, 4			# write string function
	la	$a0, literal_2			# load string literal
	syscall			# do the write string
# source line #9
	li	$v0, 6			# read float function
	syscall			# do the read
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 16($t4)			# deref pointer
	s.s	$f0, 0($t4)			# store result
# source line #10
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 8			# restore locals space
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
	la	$t0, 0($t4)			# load param
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
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -12($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	l.s	$f0, 0($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	l.s	$f1, 0($t4)			# load right op
	mul.s	$f2, $f0, $f1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	s.s	$f2, -12($t4)			# store result
	li	$v0, 2			# write float function
	addu	$t4, $fp, $0			# prepare to walk frames
	l.s	$f12, -12($t4)			# load the float
	syscall			# do the write float
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #16
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 24			# restore locals space
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



