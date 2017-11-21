# MIPS assembly generated from BADA source.
.data
enter_msg : .asciiz	"\nbegin program\n"
exit_msg : .asciiz "\nend program\n"
true_msg : .asciiz "true"
false_msg : .asciiz "false"

# user string literals:

literal_2:	.asciiz	"string literal"	# a string
LOCALS_0 = -60

.text
.globl main
# begin user procedures

# source line #2
# source line #4
# source line #5
# source line #6
# source line #7
# source line #8
# source line #9
# source line #11
# begin procedure all_0
all_0:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_0			# space for local vars
# source line #14
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -12($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, 0($t4)			# assignment
# source line #15
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -16($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -4($t4)			# assignment
# source line #16
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -20($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -8($t4)			# assignment
# source line #18
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load if expression
	beq	$t0, $0, if_1			# jump past when false
	if_1:			# after the if block
# source line #20
	li	$v0, 5			# read integer function
	syscall			# do the read
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$v0, 0($t4)			# store result
# source line #22
	li	$v0, 4			# write string function
	la	$a0, literal_2			# load string literal
	syscall			# do the write string
# source line #23
	li	$v0, 1			# write integer function
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$a0, 0($t4)			# load the integer
	syscall			# do the write integer
# source line #25
	while_3:			# before the while expression
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load if expression
	beq	$t0, $0, if_4			# jump past when false
# source line #26
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -24($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -24($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -4($t4)			# assignment
# source line #27
	j	while_3			# jump to start of while
	if_4:			# after the if block
# source line #29
# source line #30
	li	$t0, 10			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -28($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -28($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 12($t4)			# next frame
	sw	$t0, 0($t4)			# assignment
# source line #31
# source line #32
# source line #33
# source line #34
# source line #35
# source line #36
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -40($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -40($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -32($t4)			# assignment
# source line #37
# source line #38
# source line #39
# source line #42
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -4($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -16($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -16($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -16($t4)			# load if expression
	beq	$t0, $0, if_5			# jump past when false
# source line #43
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -44($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -48($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, 0($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -44($t4)			# load right op
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -48($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -48($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, 0($t4)			# assignment
# source line #44
	li	$t0, 4			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -52($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -56($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, 0($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -52($t4)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -56($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -56($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, 0($t4)			# assignment
# source line #45
	if_5:			# after the if block
# source line #48
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 68			# restore locals space
	jr	$ra			# 
# end procedure all_0


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
	jal	all_0			# call user procedure
	addiu	$sp, $sp, 4			# pop params

	li $v0, 4
	la $a0, exit_msg
	syscall		# print string

	li $v0, 10
	syscall		# exit program



