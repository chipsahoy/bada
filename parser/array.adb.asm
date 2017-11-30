# MIPS assembly generated from BADA source.
.data
enter_msg : .asciiz	"\nbegin program\n"
exit_msg : .asciiz "\nend program\n"
true_msg : .asciiz "true"
false_msg : .asciiz "false"

# user string literals:

literal_1:	.asciiz	"hello world"	# a string
literal_2:	.asciiz	"7"	# a string
literal_3:	.asciiz	"3.14"	# a string
LOCALS_0 = -24

.text
.globl main
# begin user procedures

# source line #1
# source line #2
# source line #4
# begin procedure main_0
main_0:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_0			# space for local vars
# source line #5
	li	$t0, 3			# place a literal in register
	sw	$t0, -4($fp)			# move literal to memory
	li	$t0, 2			# place a literal in register
	sw	$t0, -8($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -12($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -8($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -12($fp)			# store result
	li	$t0, 1			# place a literal in register
	sw	$t0, -16($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -20($fp)			# move literal to memory
	lw	$t0, -12($fp)			# load left op
	lw	$t1, -16($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -20($fp)			# store result
	lw	$t0, -20($fp)			# load op
	sw	$t0, 0($fp)			# assignment
# source line #6
	li	$v0, 4			# write string function
	la	$a0, literal_1			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #7
	li	$v0, 4			# write string function
	la	$a0, literal_2			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #8
	li	$v0, 4			# write string function
	la	$a0, literal_3			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #9
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 32			# restore locals space
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
	sw	$fp, 4($sp)			# push parent frame
	jal	main_0			# call user procedure
	addiu	$sp, $sp, 4			# pop params

	li $v0, 4
	la $a0, exit_msg
	syscall		# print string

	li $v0, 10
	syscall		# exit program



