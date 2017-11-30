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
LOCALS_5 = -4
literal_6:	.asciiz	"proving that assert(false) is detected:"	# a string
literal_7:	.asciiz	"now on to the tests..."	# a string
literal_8:	.asciiz	"writing alternating values"	# a string
literal_15:	.asciiz	" tests taken."	# a string
LOCALS_0 = -212

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
# source line #13
	li	$t0, 0			# place a literal in register
	sw	$t0, -8($fp)			# move literal to memory
	lw	$t0, 16($fp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, -8($fp)			# store result
	lw	$t0, -8($fp)			# load if expression
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
	li	$t0, 0			# place a literal in register
	sw	$t0, 0($fp)			# move literal to memory
	lw	$t0, 0($fp)			# load op
	lw	$t4, 16($fp)			# deref pointer
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
	addiu	$sp, $sp, -4			# make space
	lw	$t0, 16($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 12($t4)			# next frame
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #27
	li	$t0, 0			# place a literal in register
	sw	$t0, 0($fp)			# move literal to memory
	lw	$t0, 0($fp)			# load op
	sw	$t0, 16($fp)			# assignment
# source line #28
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 12			# restore locals space
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
	sw	$t0, -28($fp)			# move literal to memory
	li	$t0, 1			# place a literal in register
	sw	$t0, -32($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -36($fp)			# move literal to memory
	lw	$t0, -28($fp)			# load left op
	lw	$t1, -32($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -36($fp)			# store result
	lw	$t0, -36($fp)			# load op
	sw	$t0, 0($fp)			# assignment
# source line #33
	li	$v0, 4			# write string function
	la	$a0, literal_6			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #34
	li	$t0, 0			# place a literal in register
	sw	$t0, -40($fp)			# move literal to memory
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -40($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
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
	sw	$t0, -44($fp)			# move literal to memory
	li	$t0, 1			# place a literal in register
	sw	$t0, -48($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -52($fp)			# move literal to memory
	lw	$t0, -44($fp)			# load left op
	lw	$t1, -48($fp)			# load right op
	slt	$t2, $t0, $t1			# binary op
	sw	$t2, -52($fp)			# store result
	lw	$t0, -52($fp)			# load op
	sw	$t0, -4($fp)			# assignment
# source line #39
	li	$t0, 1			# place a literal in register
	sw	$t0, -56($fp)			# move literal to memory
	lw	$t0, -56($fp)			# load op
	sw	$t0, -8($fp)			# assignment
# source line #40
	li	$t0, 0			# place a literal in register
	sw	$t0, -60($fp)			# move literal to memory
	lw	$t0, -60($fp)			# load op
	sw	$t0, -12($fp)			# assignment
# source line #41
	lw	$t0, -8($fp)			# load op
	sw	$t0, -16($fp)			# assignment
# source line #44
	li	$t0, 1			# place a literal in register
	sw	$t0, -64($fp)			# move literal to memory
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
# source line #45
	li	$t0, 0			# place a literal in register
	sw	$t0, -72($fp)			# move literal to memory
	lw	$t0, -8($fp)			# load left op
	lw	$t1, -4($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -72($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -72($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #46
	li	$t0, 0			# place a literal in register
	sw	$t0, -76($fp)			# move literal to memory
	lw	$t0, -8($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -76($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -80($fp)			# move literal to memory
	lw	$t0, -76($fp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, -80($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -80($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #49
	li	$t0, 0			# place a literal in register
	sw	$t0, -84($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -8($fp)			# load right op
	and	$t2, $t0, $t1			# binary op
	sw	$t2, -84($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -84($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #50
	li	$t0, 1			# place a literal in register
	sw	$t0, -88($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -92($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -96($fp)			# move literal to memory
	lw	$t0, -88($fp)			# load left op
	lw	$t1, -92($fp)			# load right op
	and	$t2, $t0, $t1			# binary op
	sw	$t2, -96($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -100($fp)			# move literal to memory
	lw	$t0, -96($fp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, -100($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -100($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #51
	li	$t0, 0			# place a literal in register
	sw	$t0, -104($fp)			# move literal to memory
	lw	$t0, -8($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	and	$t2, $t0, $t1			# binary op
	sw	$t2, -104($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -108($fp)			# move literal to memory
	lw	$t0, -104($fp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, -108($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -108($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #52
	li	$t0, 1			# place a literal in register
	sw	$t0, -112($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -116($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -112($fp)			# load right op
	and	$t2, $t0, $t1			# binary op
	sw	$t2, -116($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -116($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #55
	li	$t0, 1			# place a literal in register
	sw	$t0, -120($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -124($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -128($fp)			# move literal to memory
	lw	$t0, -120($fp)			# load left op
	lw	$t1, -124($fp)			# load right op
	or	$t2, $t0, $t1			# binary op
	sw	$t2, -128($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -128($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #56
	li	$t0, 0			# place a literal in register
	sw	$t0, -132($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -136($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -140($fp)			# move literal to memory
	lw	$t0, -132($fp)			# load left op
	lw	$t1, -136($fp)			# load right op
	or	$t2, $t0, $t1			# binary op
	sw	$t2, -140($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -144($fp)			# move literal to memory
	lw	$t0, -140($fp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, -144($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -144($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #57
	li	$t0, 0			# place a literal in register
	sw	$t0, -148($fp)			# move literal to memory
	lw	$t0, -8($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	or	$t2, $t0, $t1			# binary op
	sw	$t2, -148($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -148($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #58
	li	$t0, 1			# place a literal in register
	sw	$t0, -152($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -156($fp)			# move literal to memory
	lw	$t0, -12($fp)			# load left op
	lw	$t1, -152($fp)			# load right op
	or	$t2, $t0, $t1			# binary op
	sw	$t2, -156($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -156($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #61
	li	$t0, 0			# place a literal in register
	sw	$t0, -160($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -164($fp)			# move literal to memory
	lw	$t0, -160($fp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, -164($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -164($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #62
	li	$t0, 0			# place a literal in register
	sw	$t0, -168($fp)			# move literal to memory
	lw	$t0, -12($fp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, -168($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -168($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #63
	li	$t0, 0			# place a literal in register
	sw	$t0, -172($fp)			# move literal to memory
	lw	$t0, -8($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	and	$t2, $t0, $t1			# binary op
	sw	$t2, -172($fp)			# store result
	li	$t0, 0			# place a literal in register
	sw	$t0, -176($fp)			# move literal to memory
	lw	$t0, -172($fp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, -176($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -176($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #66
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -8($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testin_5			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #67
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -8($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #70
	addiu	$sp, $sp, -4			# make space
	la	$t0, -8($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testout_4			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #71
	li	$t0, 0			# place a literal in register
	sw	$t0, -180($fp)			# move literal to memory
	lw	$t0, -8($fp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, -180($fp)			# store result
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -180($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #74
	li	$v0, 4			# write string function
	la	$a0, literal_8			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #75
	li	$t0, 1			# place a literal in register
	sw	$t0, -184($fp)			# move literal to memory
	lw	$t0, -184($fp)			# load the bool
	bgtz	$t0, true_9			# if $t0=0
	la	$a0, false_msg			# load 'false'
	j	after_9			# else
true_9:
	la	$a0, true_msg			# load 'true'
after_9:
	li	$v0, 4			# write string function
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #76
	li	$t0, 0			# place a literal in register
	sw	$t0, -188($fp)			# move literal to memory
	lw	$t0, -188($fp)			# load the bool
	bgtz	$t0, true_10			# if $t0=0
	la	$a0, false_msg			# load 'false'
	j	after_10			# else
true_10:
	la	$a0, true_msg			# load 'true'
after_10:
	li	$v0, 4			# write string function
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #77
	lw	$t0, -4($fp)			# load the bool
	bgtz	$t0, true_11			# if $t0=0
	la	$a0, false_msg			# load 'false'
	j	after_11			# else
true_11:
	la	$a0, true_msg			# load 'true'
after_11:
	li	$v0, 4			# write string function
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #78
	lw	$t0, -8($fp)			# load the bool
	bgtz	$t0, true_12			# if $t0=0
	la	$a0, false_msg			# load 'false'
	j	after_12			# else
true_12:
	la	$a0, true_msg			# load 'true'
after_12:
	li	$v0, 4			# write string function
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #79
	li	$t0, 0			# place a literal in register
	sw	$t0, -192($fp)			# move literal to memory
	li	$t0, 1			# place a literal in register
	sw	$t0, -196($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -200($fp)			# move literal to memory
	lw	$t0, -192($fp)			# load left op
	lw	$t1, -196($fp)			# load right op
	slt	$t2, $t0, $t1			# binary op
	sw	$t2, -200($fp)			# store result
	lw	$t0, -200($fp)			# load the bool
	bgtz	$t0, true_13			# if $t0=0
	la	$a0, false_msg			# load 'false'
	j	after_13			# else
true_13:
	la	$a0, true_msg			# load 'true'
after_13:
	li	$v0, 4			# write string function
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #80
	li	$t0, 1			# place a literal in register
	sw	$t0, -204($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -208($fp)			# move literal to memory
	lw	$t0, -204($fp)			# load op
	xori	$t1, $t0, 1			# not operator
	sw	$t1, -208($fp)			# store result
	lw	$t0, -208($fp)			# load the bool
	bgtz	$t0, true_14			# if $t0=0
	la	$a0, false_msg			# load 'false'
	j	after_14			# else
true_14:
	la	$a0, true_msg			# load 'true'
after_14:
	li	$v0, 4			# write string function
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #82
	li	$v0, 1			# write integer function
	lw	$a0, 0($fp)			# load the integer
	syscall			# do the write integer
# source line #83
	li	$v0, 4			# write string function
	la	$a0, literal_15			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #84
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 220			# restore locals space
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



