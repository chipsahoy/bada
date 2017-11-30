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
LOCALS_0 = -528

.text
.globl main
# begin user procedures

# source line #1
# source line #2
# source line #3
# source line #4
# source line #5
# source line #6
# source line #8
# source line #9
# begin procedure assert_1
assert_1:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_1			# space for local vars
# source line #10
	li	$t0, 1			# place a literal in register
	sw	$t0, 0($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -4($fp)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 12($t4)			# next frame
	lw	$t0, 0($t4)			# load left op
	lw	$t1, 0($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -4($fp)			# store result
	lw	$t0, -4($fp)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 12($t4)			# next frame
	sw	$t0, 0($t4)			# assignment
# source line #11
	li	$t0, 0			# place a literal in register
	sw	$t0, -8($fp)			# move literal to memory
	lw	$t0, 16($fp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, -8($fp)			# store result
	lw	$t0, -8($fp)			# load if expression
	beq	$t0, $0, if_2			# jump past when false
# source line #12
	li	$v0, 1			# write integer function
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 12($t4)			# next frame
	lw	$a0, 0($t4)			# load the integer
	syscall			# do the write integer
# source line #13
	li	$v0, 4			# write string function
	la	$a0, literal_3			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #14
	if_2:			# after the if block
# source line #15
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 20			# restore locals space
	jr	$ra			# 
# end procedure assert_1

# source line #17
# source line #18
# begin procedure testout_4
testout_4:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_4			# space for local vars
# source line #19
	li	$t0, 21			# place a literal in register
	sw	$t0, 0($fp)			# move literal to memory
	lw	$t0, 0($fp)			# load op
	lw	$t4, 16($fp)			# deref pointer
	sw	$t0, 0($t4)			# assignment
# source line #20
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 12			# restore locals space
	jr	$ra			# 
# end procedure testout_4

# source line #22
# source line #23
# begin procedure testin_5
testin_5:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_5			# space for local vars
# source line #24
	li	$t0, 22			# place a literal in register
	sw	$t0, 0($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -4($fp)			# move literal to memory
	lw	$t0, 16($fp)			# load left op
	lw	$t1, 0($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -4($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -4($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 12($t4)			# next frame
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #25
	li	$t0, 8			# place a literal in register
	sw	$t0, -8($fp)			# move literal to memory
	lw	$t0, -8($fp)			# load op
	sw	$t0, 16($fp)			# assignment
# source line #26
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 20			# restore locals space
	jr	$ra			# 
# end procedure testin_5

# source line #29
# begin procedure main_0
main_0:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_0			# space for local vars
# source line #30
	li	$t0, 0			# place a literal in register
	sw	$t0, -20($fp)			# move literal to memory
	li	$t0, 1			# place a literal in register
	sw	$t0, -24($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -28($fp)			# move literal to memory
	lw	$t0, -20($fp)			# load left op
	lw	$t1, -24($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -28($fp)			# store result
	lw	$t0, -28($fp)			# load op
	sw	$t0, 0($fp)			# assignment
# source line #31
	li	$v0, 4			# write string function
	la	$a0, literal_6			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #32
	li	$t0, 0			# place a literal in register
	sw	$t0, -32($fp)			# move literal to memory
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -32($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #33
	li	$v0, 4			# write string function
	la	$a0, literal_7			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #36
	li	$t0, 0			# place a literal in register
	sw	$t0, -36($fp)			# move literal to memory
	li	$t0, 1			# place a literal in register
	sw	$t0, -40($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -44($fp)			# move literal to memory
	lw	$t0, -36($fp)			# load left op
	lw	$t1, -40($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -44($fp)			# store result
	lw	$t0, -44($fp)			# load op
	sw	$t0, -4($fp)			# assignment
# source line #37
	li	$t0, 0			# place a literal in register
	sw	$t0, -48($fp)			# move literal to memory
	lw	$t0, -48($fp)			# load op
	sw	$t0, -8($fp)			# assignment
# source line #38
	li	$t0, 1			# place a literal in register
	sw	$t0, -52($fp)			# move literal to memory
	lw	$t0, -52($fp)			# load op
	sw	$t0, -12($fp)			# assignment
# source line #39
	li	$t0, 2			# place a literal in register
	sw	$t0, -56($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -60($fp)			# move literal to memory
	lw	$t0, -12($fp)			# load left op
	lw	$t1, -56($fp)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -60($fp)			# store result
	lw	$t0, -60($fp)			# load op
	sw	$t0, -16($fp)			# assignment
# source line #42
	li	$t0, 0			# place a literal in register
	sw	$t0, -64($fp)			# move literal to memory
	lw	$t0, -8($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -64($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -68($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -64($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -68($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -68($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #43
	li	$t0, 0			# place a literal in register
	sw	$t0, -72($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -76($fp)			# move literal to memory
	lw	$t0, -8($fp)			# load left op
	lw	$t1, -72($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -76($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -76($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #44
	li	$t0, 2			# place a literal in register
	sw	$t0, -80($fp)			# move literal to memory
	li	$t0, 2			# place a literal in register
	sw	$t0, -84($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -88($fp)			# move literal to memory
	lw	$t0, -80($fp)			# load left op
	lw	$t1, -84($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -88($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -88($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #45
	li	$t0, 0			# place a literal in register
	sw	$t0, -92($fp)			# move literal to memory
	lw	$t0, -16($fp)			# load left op
	lw	$t1, -16($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -92($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -92($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #49
	li	$t0, 1			# place a literal in register
	sw	$t0, -96($fp)			# move literal to memory
	li	$t0, 1			# place a literal in register
	sw	$t0, -100($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -104($fp)			# move literal to memory
	lw	$t0, -96($fp)			# load left op
	lw	$t1, -100($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -104($fp)			# store result
	li	$t0, 2			# place a literal in register
	sw	$t0, -108($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -112($fp)			# move literal to memory
	lw	$t0, -104($fp)			# load left op
	lw	$t1, -108($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -112($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -112($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #50
	li	$t0, 0			# place a literal in register
	sw	$t0, -116($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -116($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -120($fp)			# move literal to memory
	lw	$t0, -8($fp)			# load left op
	lw	$t1, -116($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -120($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -120($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #51
	li	$t0, 1			# place a literal in register
	sw	$t0, -124($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -128($fp)			# move literal to memory
	lw	$t0, -12($fp)			# load left op
	lw	$t1, -124($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -128($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -132($fp)			# move literal to memory
	lw	$t0, -128($fp)			# load left op
	lw	$t1, -16($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -132($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -132($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #52
	li	$t0, 1			# place a literal in register
	sw	$t0, -136($fp)			# move literal to memory
	li	$t0, 2			# place a literal in register
	sw	$t0, -140($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -144($fp)			# move literal to memory
	lw	$t0, -136($fp)			# load left op
	lw	$t1, -140($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -144($fp)			# store result
	li	$t0, 3			# place a literal in register
	sw	$t0, -148($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -152($fp)			# move literal to memory
	lw	$t0, -144($fp)			# load left op
	lw	$t1, -148($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -152($fp)			# store result
	li	$t0, 4			# place a literal in register
	sw	$t0, -156($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -160($fp)			# move literal to memory
	lw	$t0, -152($fp)			# load left op
	lw	$t1, -156($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -160($fp)			# store result
	li	$t0, 5			# place a literal in register
	sw	$t0, -164($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -168($fp)			# move literal to memory
	lw	$t0, -160($fp)			# load left op
	lw	$t1, -164($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -168($fp)			# store result
	li	$t0, 6			# place a literal in register
	sw	$t0, -172($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -176($fp)			# move literal to memory
	lw	$t0, -168($fp)			# load left op
	lw	$t1, -172($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -176($fp)			# store result
	li	$t0, 7			# place a literal in register
	sw	$t0, -180($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -184($fp)			# move literal to memory
	lw	$t0, -176($fp)			# load left op
	lw	$t1, -180($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -184($fp)			# store result
	li	$t0, 8			# place a literal in register
	sw	$t0, -188($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -192($fp)			# move literal to memory
	lw	$t0, -184($fp)			# load left op
	lw	$t1, -188($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -192($fp)			# store result
	li	$t0, 36			# place a literal in register
	sw	$t0, -196($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -200($fp)			# move literal to memory
	lw	$t0, -192($fp)			# load left op
	lw	$t1, -196($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -200($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -200($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #55
	li	$t0, 3			# place a literal in register
	sw	$t0, -204($fp)			# move literal to memory
	li	$t0, 2			# place a literal in register
	sw	$t0, -208($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -212($fp)			# move literal to memory
	lw	$t0, -204($fp)			# load left op
	lw	$t1, -208($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -212($fp)			# store result
	li	$t0, 1			# place a literal in register
	sw	$t0, -216($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -220($fp)			# move literal to memory
	lw	$t0, -212($fp)			# load left op
	lw	$t1, -216($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -220($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -220($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #56
	li	$t0, 0			# place a literal in register
	sw	$t0, -224($fp)			# move literal to memory
	lw	$t0, -12($fp)			# load left op
	lw	$t1, -4($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -224($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -228($fp)			# move literal to memory
	lw	$t0, -224($fp)			# load left op
	lw	$t1, -16($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -228($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -228($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #57
	li	$t0, 5			# place a literal in register
	sw	$t0, -232($fp)			# move literal to memory
	li	$t0, 4			# place a literal in register
	sw	$t0, -236($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -240($fp)			# move literal to memory
	lw	$t0, -232($fp)			# load left op
	lw	$t1, -236($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -240($fp)			# store result
	li	$t0, 3			# place a literal in register
	sw	$t0, -244($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -248($fp)			# move literal to memory
	lw	$t0, -240($fp)			# load left op
	lw	$t1, -244($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -248($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -252($fp)			# move literal to memory
	li	$t0, 2			# place a literal in register
	sw	$t0, -256($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -260($fp)			# move literal to memory
	lw	$t0, -252($fp)			# load left op
	lw	$t1, -256($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -260($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -264($fp)			# move literal to memory
	lw	$t0, -248($fp)			# load left op
	lw	$t1, -260($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -264($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -264($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #58
	li	$t0, 0			# place a literal in register
	sw	$t0, -268($fp)			# move literal to memory
	lw	$t0, -16($fp)			# load left op
	lw	$t1, -8($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -268($fp)			# store result
	li	$t0, 9			# place a literal in register
	sw	$t0, -272($fp)			# move literal to memory
	li	$t0, 7			# place a literal in register
	sw	$t0, -276($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -280($fp)			# move literal to memory
	lw	$t0, -272($fp)			# load left op
	lw	$t1, -276($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -280($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -284($fp)			# move literal to memory
	lw	$t0, -268($fp)			# load left op
	lw	$t1, -280($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -284($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -284($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #61
	li	$t0, 2			# place a literal in register
	sw	$t0, -288($fp)			# move literal to memory
	li	$t0, 2			# place a literal in register
	sw	$t0, -292($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -296($fp)			# move literal to memory
	lw	$t0, -288($fp)			# load left op
	lw	$t1, -292($fp)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -296($fp)			# store result
	li	$t0, 4			# place a literal in register
	sw	$t0, -300($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -304($fp)			# move literal to memory
	lw	$t0, -296($fp)			# load left op
	lw	$t1, -300($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -304($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -304($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #62
	li	$t0, 87			# place a literal in register
	sw	$t0, -308($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -312($fp)			# move literal to memory
	lw	$t0, -308($fp)			# load left op
	lw	$t1, -8($fp)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -312($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -316($fp)			# move literal to memory
	lw	$t0, -16($fp)			# load left op
	lw	$t1, -8($fp)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -316($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -320($fp)			# move literal to memory
	lw	$t0, -312($fp)			# load left op
	lw	$t1, -316($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -320($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -320($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #63
	li	$t0, 0			# place a literal in register
	sw	$t0, -324($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -4($fp)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -324($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -328($fp)			# move literal to memory
	lw	$t0, -324($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -328($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -328($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #64
	li	$t0, 5			# place a literal in register
	sw	$t0, -332($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -336($fp)			# move literal to memory
	lw	$t0, -16($fp)			# load left op
	lw	$t1, -332($fp)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -336($fp)			# store result
	li	$t0, 10			# place a literal in register
	sw	$t0, -340($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -344($fp)			# move literal to memory
	lw	$t0, -336($fp)			# load left op
	lw	$t1, -340($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -344($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -344($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #67
	li	$t0, 18			# place a literal in register
	sw	$t0, -348($fp)			# move literal to memory
	li	$t0, 3			# place a literal in register
	sw	$t0, -352($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -356($fp)			# move literal to memory
	lw	$t0, -348($fp)			# load left op
	lw	$t1, -352($fp)			# load right op
	div	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -356($fp)			# store result
	li	$t0, 6			# place a literal in register
	sw	$t0, -360($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -364($fp)			# move literal to memory
	lw	$t0, -356($fp)			# load left op
	lw	$t1, -360($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -364($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -364($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #68
	li	$t0, 17			# place a literal in register
	sw	$t0, -368($fp)			# move literal to memory
	li	$t0, 3			# place a literal in register
	sw	$t0, -372($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -376($fp)			# move literal to memory
	lw	$t0, -368($fp)			# load left op
	lw	$t1, -372($fp)			# load right op
	div	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -376($fp)			# store result
	li	$t0, 5			# place a literal in register
	sw	$t0, -380($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -384($fp)			# move literal to memory
	lw	$t0, -376($fp)			# load left op
	lw	$t1, -380($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -384($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -384($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #69
	li	$t0, 0			# place a literal in register
	sw	$t0, -388($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -392($fp)			# move literal to memory
	lw	$t0, -388($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	div	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -392($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -396($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -400($fp)			# move literal to memory
	lw	$t0, -392($fp)			# load left op
	lw	$t1, -396($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -400($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -400($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #70
	li	$t0, 7			# place a literal in register
	sw	$t0, -404($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -408($fp)			# move literal to memory
	lw	$t0, -404($fp)			# load left op
	lw	$t1, -16($fp)			# load right op
	div	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -408($fp)			# store result
	li	$t0, 3			# place a literal in register
	sw	$t0, -412($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -416($fp)			# move literal to memory
	lw	$t0, -408($fp)			# load left op
	lw	$t1, -412($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -416($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -416($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #74
	li	$t0, 18			# place a literal in register
	sw	$t0, -420($fp)			# move literal to memory
	li	$t0, 3			# place a literal in register
	sw	$t0, -424($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -428($fp)			# move literal to memory
	lw	$t0, -420($fp)			# load left op
	lw	$t1, -424($fp)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	sw	$t2, -428($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -432($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -436($fp)			# move literal to memory
	lw	$t0, -428($fp)			# load left op
	lw	$t1, -432($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -436($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -436($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #75
	li	$t0, 17			# place a literal in register
	sw	$t0, -440($fp)			# move literal to memory
	li	$t0, 3			# place a literal in register
	sw	$t0, -444($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -448($fp)			# move literal to memory
	lw	$t0, -440($fp)			# load left op
	lw	$t1, -444($fp)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	sw	$t2, -448($fp)			# store result
	li	$t0, 2			# place a literal in register
	sw	$t0, -452($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -456($fp)			# move literal to memory
	lw	$t0, -448($fp)			# load left op
	lw	$t1, -452($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -456($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -456($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #76
	li	$t0, 7			# place a literal in register
	sw	$t0, -460($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -464($fp)			# move literal to memory
	lw	$t0, -460($fp)			# load left op
	lw	$t1, -16($fp)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	sw	$t2, -464($fp)			# store result
	li	$t0, 1			# place a literal in register
	sw	$t0, -468($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -472($fp)			# move literal to memory
	lw	$t0, -464($fp)			# load left op
	lw	$t1, -468($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -472($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -472($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #77
	li	$t0, 2			# place a literal in register
	sw	$t0, -476($fp)			# move literal to memory
	li	$t0, 5			# place a literal in register
	sw	$t0, -480($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -484($fp)			# move literal to memory
	lw	$t0, -476($fp)			# load left op
	lw	$t1, -480($fp)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	sw	$t2, -484($fp)			# store result
	li	$t0, 2			# place a literal in register
	sw	$t0, -488($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -492($fp)			# move literal to memory
	lw	$t0, -484($fp)			# load left op
	lw	$t1, -488($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -492($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -492($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #80
	li	$t0, 22			# place a literal in register
	sw	$t0, -496($fp)			# move literal to memory
	lw	$t0, -496($fp)			# load op
	sw	$t0, -8($fp)			# assignment
# source line #81
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -8($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testin_5			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #82
	li	$t0, 22			# place a literal in register
	sw	$t0, -500($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -504($fp)			# move literal to memory
	lw	$t0, -8($fp)			# load left op
	lw	$t1, -500($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -504($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -504($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #85
	addiu	$sp, $sp, -4			# make space
	la	$t0, -8($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testout_4			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #86
	li	$t0, 21			# place a literal in register
	sw	$t0, -508($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -512($fp)			# move literal to memory
	lw	$t0, -8($fp)			# load left op
	lw	$t1, -508($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -512($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -512($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #89
	li	$v0, 4			# write string function
	la	$a0, literal_8			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #90
	li	$t0, 0			# place a literal in register
	sw	$t0, -516($fp)			# move literal to memory
	li	$v0, 1			# write integer function
	lw	$a0, -516($fp)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #91
	li	$v0, 1			# write integer function
	lw	$a0, -4($fp)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #92
	li	$v0, 1			# write integer function
	lw	$a0, -8($fp)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #93
	li	$t0, 15			# place a literal in register
	sw	$t0, -520($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -524($fp)			# move literal to memory
	lw	$t0, -12($fp)			# load left op
	lw	$t1, -520($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -524($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -524($fp)			# load the integer
	syscall			# do the write integer
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #95
	li	$v0, 1			# write integer function
	lw	$a0, 0($fp)			# load the integer
	syscall			# do the write integer
# source line #96
	li	$v0, 4			# write string function
	la	$a0, literal_9			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #97
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 536			# restore locals space
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



