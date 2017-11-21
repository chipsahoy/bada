# MIPS assembly generated from BADA source.
.data
enter_msg : .asciiz	"\nbegin program\n"
exit_msg : .asciiz "\nend program\n"
true_msg : .asciiz "true"
false_msg : .asciiz "false"

# user string literals:

literal_3:	.asciiz	" assert failed"	# a string
LOCALS_1 = -12
LOCALS_4 = -4
LOCALS_5 = -12
literal_6:	.asciiz	"proving that assert(false) is detected:"	# a string
literal_7:	.asciiz	"now on to the tests..."	# a string
literal_8:	.asciiz	"writing integers"	# a string
literal_9:	.asciiz	" tests taken."	# a string
LOCALS_0 = -536

.text
.globl main
# begin user procedures

# source line #1
# source line #2
# source line #3
# source line #4
# source line #5
# source line #6
# source line #7
# source line #8
# source line #10
# source line #11
# begin procedure assert_1
assert_1:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_1			# space for local vars
# source line #12
	li	$t0, 1			# place a literal in register
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
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -4($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 12($t4)			# next frame
	sw	$t0, 0($t4)			# assignment
# source line #13
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -8($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, 16($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -8($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load if expression
	beq	$t0, $0, if_2			# jump past when false
# source line #14
	li	$v0, 1			# write integer function
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 12($t4)			# next frame
	lw	$a0, 0($t4)			# load the integer
	syscall			# do the write integer
# source line #15
	li	$v0, 4			# write string function
	la	$a0, literal_3			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #16
	if_2:			# after the if block
# source line #17
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 20			# restore locals space
	jr	$ra			# 
# end procedure assert_1

# source line #19
# source line #20
# begin procedure testout_4
testout_4:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_4			# space for local vars
# source line #21
	li	$t0, 21			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, 0($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, 0($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 16($t4)			# deref pointer
	sw	$t0, 0($t4)			# assignment
# source line #22
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 12			# restore locals space
	jr	$ra			# 
# end procedure testout_4

# source line #24
# source line #25
# begin procedure testin_5
testin_5:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_5			# space for local vars
# source line #26
	li	$t0, 22			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, 0($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -4($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, 16($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, 0($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -4($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 12($t4)			# next frame
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #27
	li	$t0, 8			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -8($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, 16($t4)			# assignment
# source line #28
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 20			# restore locals space
	jr	$ra			# 
# end procedure testin_5

# source line #31
# begin procedure main_0
main_0:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_0			# space for local vars
# source line #32
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -28($t4)			# move literal to memory
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -32($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -36($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -28($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -32($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -36($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -36($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, 0($t4)			# assignment
# source line #33
	li	$v0, 4			# write string function
	la	$a0, literal_6			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #34
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -40($t4)			# move literal to memory
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -40($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #35
	li	$v0, 4			# write string function
	la	$a0, literal_7			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #38
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -44($t4)			# move literal to memory
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -48($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -52($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -44($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -48($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -52($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -52($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -4($t4)			# assignment
# source line #39
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -56($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -56($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -8($t4)			# assignment
# source line #40
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -60($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -60($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -12($t4)			# assignment
# source line #41
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -64($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -68($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -12($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -64($t4)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -68($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -68($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -16($t4)			# assignment
# source line #44
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -72($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -72($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -76($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -72($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -76($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -76($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #45
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -80($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -84($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -80($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -84($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -84($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #46
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -88($t4)			# move literal to memory
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -92($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -96($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -88($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -92($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -96($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -96($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #47
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -100($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -16($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -16($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -100($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -100($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #51
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -104($t4)			# move literal to memory
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -108($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -112($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -104($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -108($t4)			# load right op
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -112($t4)			# store result
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -116($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -120($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -112($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -116($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -120($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -120($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #52
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -124($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -124($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -128($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -124($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -128($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -128($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #53
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -132($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -136($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -12($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -132($t4)			# load right op
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -136($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -140($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -136($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -16($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -140($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -140($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #54
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -144($t4)			# move literal to memory
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -148($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -152($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -144($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -148($t4)			# load right op
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -152($t4)			# store result
	li	$t0, 3			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -156($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -160($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -152($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -156($t4)			# load right op
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -160($t4)			# store result
	li	$t0, 4			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -164($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -168($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -160($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -164($t4)			# load right op
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -168($t4)			# store result
	li	$t0, 5			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -172($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -176($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -168($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -172($t4)			# load right op
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -176($t4)			# store result
	li	$t0, 6			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -180($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -184($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -176($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -180($t4)			# load right op
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -184($t4)			# store result
	li	$t0, 7			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -188($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -192($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -184($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -188($t4)			# load right op
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -192($t4)			# store result
	li	$t0, 8			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -196($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -200($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -192($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -196($t4)			# load right op
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -200($t4)			# store result
	li	$t0, 36			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -204($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -208($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -200($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -204($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -208($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -208($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #57
	li	$t0, 3			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -212($t4)			# move literal to memory
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -216($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -220($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -212($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -216($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -220($t4)			# store result
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -224($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -228($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -220($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -224($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -228($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -228($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #58
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -232($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -12($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -4($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -232($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -236($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -232($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -16($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -236($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -236($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #59
	li	$t0, 5			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -240($t4)			# move literal to memory
	li	$t0, 4			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -244($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -248($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -240($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -244($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -248($t4)			# store result
	li	$t0, 3			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -252($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -256($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -248($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -252($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -256($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -260($t4)			# move literal to memory
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -264($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -268($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -260($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -264($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -268($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -272($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -256($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -268($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -272($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -272($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #60
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -276($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -16($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -8($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -276($t4)			# store result
	li	$t0, 9			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -280($t4)			# move literal to memory
	li	$t0, 7			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -284($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -288($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -280($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -284($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -288($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -292($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -276($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -288($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -292($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -292($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #63
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -296($t4)			# move literal to memory
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -300($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -304($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -296($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -300($t4)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -304($t4)			# store result
	li	$t0, 4			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -308($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -312($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -304($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -308($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -312($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -312($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #64
	li	$t0, 87			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -316($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -320($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -316($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -8($t4)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -320($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -324($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -16($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -8($t4)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -324($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -328($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -320($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -324($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -328($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -328($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #65
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -332($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -4($t4)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -332($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -336($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -332($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -336($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -336($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #66
	li	$t0, 5			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -340($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -344($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -16($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -340($t4)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -344($t4)			# store result
	li	$t0, 10			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -348($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -352($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -344($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -348($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -352($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -352($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #69
	li	$t0, 18			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -356($t4)			# move literal to memory
	li	$t0, 3			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -360($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -364($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -356($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -360($t4)			# load right op
	div	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -364($t4)			# store result
	li	$t0, 6			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -368($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -372($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -364($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -368($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -372($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -372($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #70
	li	$t0, 17			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -376($t4)			# move literal to memory
	li	$t0, 3			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -380($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -384($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -376($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -380($t4)			# load right op
	div	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -384($t4)			# store result
	li	$t0, 5			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -388($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -392($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -384($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -388($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -392($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -392($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #71
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -396($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -400($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -396($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	div	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -400($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -404($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -408($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -400($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -404($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -408($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -408($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #72
	li	$t0, 7			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -412($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -416($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -412($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -16($t4)			# load right op
	div	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -416($t4)			# store result
	li	$t0, 3			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -420($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -424($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -416($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -420($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -424($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -424($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #76
	li	$t0, 18			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -428($t4)			# move literal to memory
	li	$t0, 3			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -432($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -436($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -428($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -432($t4)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -436($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -440($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -444($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -436($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -440($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -444($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -444($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #77
	li	$t0, 17			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -448($t4)			# move literal to memory
	li	$t0, 3			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -452($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -456($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -448($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -452($t4)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -456($t4)			# store result
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -460($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -464($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -456($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -460($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -464($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -464($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #78
	li	$t0, 7			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -468($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -472($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -468($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -16($t4)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -472($t4)			# store result
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -476($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -480($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -472($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -476($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -480($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -480($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #79
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -484($t4)			# move literal to memory
	li	$t0, 5			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -488($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -492($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -484($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -488($t4)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -492($t4)			# store result
	li	$t0, 2			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -496($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -500($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -492($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -496($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -500($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -500($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #82
	li	$t0, 22			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -504($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -504($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -8($t4)			# assignment
# source line #83
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	testin_5			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #84
	li	$t0, 22			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -508($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -512($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -508($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -512($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -512($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #87
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	la	$t0, -8($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	testout_4			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #88
	li	$t0, 21			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -516($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -520($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -516($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -520($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -520($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #91
	li	$v0, 4			# write string function
	la	$a0, literal_8			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #92
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -524($t4)			# move literal to memory
	li	$v0, 1			# write integer function
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$a0, -524($t4)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #93
	li	$v0, 1			# write integer function
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$a0, -4($t4)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #94
	li	$v0, 1			# write integer function
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$a0, -8($t4)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #95
	li	$t0, 15			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -528($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -532($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -12($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -528($t4)			# load right op
	add	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -532($t4)			# store result
	li	$v0, 1			# write integer function
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$a0, -532($t4)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #97
	li	$v0, 1			# write integer function
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$a0, 0($t4)			# load the integer
	syscall			# do the write integer
# source line #98
	li	$v0, 4			# write string function
	la	$a0, literal_9			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #99
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 544			# restore locals space
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



