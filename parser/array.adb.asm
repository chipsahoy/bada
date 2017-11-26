# MIPS assembly generated from BADA source.
.data
enter_msg : .asciiz	"\nbegin program\n"
exit_msg : .asciiz "\nend program\n"
true_msg : .asciiz "true"
false_msg : .asciiz "false"

# user string literals:

LOCALS_0 = -100

.text
.globl main
# begin user procedures

# source line #1
# source line #2
# source line #3
# source line #4
# source line #6
# begin procedure main_0
main_0:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_0			# space for local vars
# source line #7
	li	$t0, 0			# place a literal in register
	sw	$t0, -52($fp)			# move literal to memory
	lw	$t0, -52($fp)			# load op
	sw	$t0, -4($fp)			# assignment
# source line #8
	while_1:			# before the while expression
	li	$t0, 10			# place a literal in register
	sw	$t0, -56($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -60($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -56($fp)			# load right op
	slt	$t2, $t0, $t1			# binary op
	sw	$t2, -60($fp)			# store result
	lw	$t0, -60($fp)			# load if expression
	beq	$t0, $0, if_2			# jump past when false
# source line #9
	lw	$t5, -4($fp)			# load index
	sll	$t5, $t5, 2			# index to size
	addu	$t5, $t5, -48			# final offset
	addu	$t2, $fp, $t5			# array ref
	sw	$t2, -64($fp)			# save address
	lw	$t0, -4($fp)			# load op
	lw	$t4, -64($fp)			# deref pointer
	sw	$t0, 0($t4)			# assignment
# source line #10
	li	$t0, 1			# place a literal in register
	sw	$t0, -68($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -72($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -68($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -72($fp)			# store result
	lw	$t0, -72($fp)			# load op
	sw	$t0, -4($fp)			# assignment
# source line #11
	j	while_1			# jump to start of while
	if_2:			# after the if block
# source line #13
	li	$t0, 0			# place a literal in register
	sw	$t0, -76($fp)			# move literal to memory
	lw	$t0, -76($fp)			# load op
	sw	$t0, -4($fp)			# assignment
# source line #14
	while_3:			# before the while expression
	li	$t0, 10			# place a literal in register
	sw	$t0, -80($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -84($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -80($fp)			# load right op
	slt	$t2, $t0, $t1			# binary op
	sw	$t2, -84($fp)			# store result
	lw	$t0, -84($fp)			# load if expression
	beq	$t0, $0, if_4			# jump past when false
# source line #15
	lw	$t5, -4($fp)			# load index
	sll	$t5, $t5, 2			# index to size
	addu	$t5, $t5, -48			# final offset
	addu	$t2, $fp, $t5			# array ref
	sw	$t2, -88($fp)			# save address
	li	$v0, 1			# write integer function
	lw	$t4, -88($fp)			# load the integer
	lw	$a0, 0($t4)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #16
	li	$t0, 1			# place a literal in register
	sw	$t0, -92($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -96($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -92($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -96($fp)			# store result
	lw	$t0, -96($fp)			# load op
	sw	$t0, -4($fp)			# assignment
# source line #17
	j	while_3			# jump to start of while
	if_4:			# after the if block
# source line #18
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 108			# restore locals space
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



