# MIPS assembly generated from BADA source.
.data
enter_msg : .asciiz	"\nbegin program\n"
exit_msg : .asciiz "\nend program\n"

# user string literals:

literal_2:	.asciiz	"in foo "	# a string
LOCALS_1 = 0
literal_3:	.asciiz	"enter a positive integer: "	# a string
literal_4:	.asciiz	"after foo"	# a string
LOCALS_0 = 0

.text
.globl main
# begin user procedures

# begin procedure foo_1
foo_1:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_1			# space for local vars
	li	$v0, 4			# write string function
	la	$a0, literal_2			# load string literal
	syscall			# do the write string
	li	$v0, 1			# write integer function
	lw	$a0, 12($fp)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, -8			# restore locals space
	jr	$ra			# 
# end procedure foo_1

# begin procedure main_0
main_0:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_0			# space for local vars
	li	$v0, 4			# write string function
	la	$a0, literal_3			# load string literal
	syscall			# do the write string
	li	$v0, 5			# read integer function
	syscall			# do the read
	sw	$v0, 0($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, 0($fp)			# load param
	sw	$t0, 4($sp)			# push param
	jal	foo_1			# call user procedure
	li	$v0, 4			# write string function
	la	$a0, literal_4			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, -8			# restore locals space
	jr	$ra			# 
# end procedure main_0


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



