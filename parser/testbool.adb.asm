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
LOCALS_0 = -260

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
	li	$t0, 0			# place a literal in register
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
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, 16($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t4, 12($t4)			# next frame
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #27
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, 0($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, 0($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, 16($t4)			# assignment
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
	slt	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -52($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -52($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -4($t4)			# assignment
# source line #39
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -56($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -56($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -8($t4)			# assignment
# source line #40
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -60($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -60($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -12($t4)			# assignment
# source line #41
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -16($t4)			# assignment
# source line #44
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -64($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -68($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -64($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -68($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -68($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #45
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -72($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -4($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -72($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -72($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #46
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -76($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -76($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -80($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -76($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -80($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -80($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #49
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -84($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -8($t4)			# load right op
	and	$t2, $t0, $t1			# binary op
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
# source line #50
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -88($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -92($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -96($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -88($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -92($t4)			# load right op
	and	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -96($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -100($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -96($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -100($t4)			# store result
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
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -104($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	and	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -104($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -108($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -104($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -108($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -108($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #52
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -112($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -116($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -112($t4)			# load right op
	and	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -116($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -116($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #53
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -120($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	and	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -120($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -124($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -120($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -124($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -124($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #56
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -128($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -132($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -136($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -128($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -132($t4)			# load right op
	or	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -136($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -136($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #57
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -140($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	and	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -140($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -144($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -140($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -144($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -144($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #58
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -148($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -152($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -156($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -148($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -152($t4)			# load right op
	or	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -156($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -160($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -156($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -160($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -160($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #59
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -164($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	and	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -164($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -168($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -164($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -168($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -168($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #60
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -172($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	or	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -172($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -172($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #61
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -176($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	and	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -176($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -180($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -176($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -180($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -180($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #62
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -184($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -188($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -12($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -184($t4)			# load right op
	or	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -188($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -188($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #63
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -192($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	and	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -192($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -196($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -192($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -196($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -196($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #66
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -200($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -204($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -200($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -204($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -204($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #67
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -208($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	and	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -208($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -212($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -208($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -212($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -212($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #68
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -216($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -12($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -216($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -216($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #69
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -220($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -12($t4)			# load right op
	and	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -220($t4)			# store result
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -224($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -220($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -224($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -224($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #72
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	testin_5			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #73
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #76
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	la	$t0, -8($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	testout_4			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #77
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -228($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -228($t4)			# store result
	addiu	$sp, $sp, -4			# make space
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -228($t4)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t4, 4($sp)			# push parent frame
	jal	assert_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #80
	li	$v0, 4			# write string function
	la	$a0, literal_8			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #81
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -232($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -232($t4)			# load the bool
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
# source line #82
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -236($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -236($t4)			# load the bool
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
# source line #83
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -4($t4)			# load the bool
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
# source line #84
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -8($t4)			# load the bool
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
# source line #85
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -240($t4)			# move literal to memory
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -244($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -248($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -240($t4)			# load left op
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t1, -244($t4)			# load right op
	slt	$t2, $t0, $t1			# binary op
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t2, -248($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -248($t4)			# load the bool
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
# source line #86
	li	$t0, 1			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -252($t4)			# move literal to memory
	li	$t0, 0			# place a literal in register
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t0, -256($t4)			# move literal to memory
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -252($t4)			# load op
	xori	$t1, $t0, 1			# not operator
	addu	$t4, $fp, $0			# prepare to walk frames
	sw	$t1, -256($t4)			# store result
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$t0, -256($t4)			# load the bool
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
# source line #88
	li	$v0, 1			# write integer function
	addu	$t4, $fp, $0			# prepare to walk frames
	lw	$a0, 0($t4)			# load the integer
	syscall			# do the write integer
# source line #89
	li	$v0, 4			# write string function
	la	$a0, literal_15			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #90
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 268			# restore locals space
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


