# MIPS assembly generated from BADA source.
.data
enter_msg : .asciiz	"\nbegin program\n"
exit_msg : .asciiz "\nend program\n"
true_msg : .asciiz "true"
false_msg : .asciiz "false"

# user string literals:

LOCALS_1 = -4
LOCALS_2 = 0
LOCALS_3 = -4
LOCALS_4 = 0
LOCALS_5 = -4
LOCALS_6 = 0
literal_7:	.asciiz	"this program checks for compile time errors, never runs."	# a string
LOCALS_0 = -220

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
# source line #9
# source line #10
# begin procedure testoutint_1
testoutint_1:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_1			# space for local vars
# source line #11
	li	$t0, 0			# place a literal in register
	sw	$t0, 0($fp)			# move literal to memory
	lw	$t0, 0($fp)			# load op
	lw	$t4, 16($fp)			# deref pointer
	sw	$t0, 0($t4)			# assignment
# source line #12
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 12			# restore locals space
	jr	$ra			# 
# end procedure testoutint_1

# source line #14
# source line #15
# begin procedure testinint_2
testinint_2:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_2			# space for local vars
# source line #16
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 8			# restore locals space
	jr	$ra			# 
# end procedure testinint_2

# source line #18
# source line #19
# begin procedure testoutfloat_3
testoutfloat_3:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_3			# space for local vars
# source line #20
	li	$t0, 0.0			# place a literal in register
	sw	$t0, 0($fp)			# move literal to memory
	lw	$t0, 0($fp)			# load op
	lw	$t4, 16($fp)			# deref pointer
	sw	$t0, 0($t4)			# assignment
# source line #21
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 12			# restore locals space
	jr	$ra			# 
# end procedure testoutfloat_3

# source line #23
# source line #24
# begin procedure testinfloat_4
testinfloat_4:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_4			# space for local vars
# source line #25
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 8			# restore locals space
	jr	$ra			# 
# end procedure testinfloat_4

# source line #27
# source line #28
# begin procedure testoutbool_5
testoutbool_5:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_5			# space for local vars
# source line #29
	li	$t0, 0			# place a literal in register
	sw	$t0, 0($fp)			# move literal to memory
	lw	$t0, 0($fp)			# load op
	lw	$t4, 16($fp)			# deref pointer
	sw	$t0, 0($t4)			# assignment
# source line #30
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 12			# restore locals space
	jr	$ra			# 
# end procedure testoutbool_5

# source line #32
# source line #33
# begin procedure testinbool_6
testinbool_6:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_6			# space for local vars
# source line #34
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 8			# restore locals space
	jr	$ra			# 
# end procedure testinbool_6

# source line #36
# begin procedure main_0
main_0:
	addiu	$sp, -8			# space for saved registers
	sw	$ra, 8($sp)			# save return so we can make calls
	sw	$fp, 4($sp)			# preserve caller frame
	add	$fp, $sp, $0			# create our frame
	addiu	$sp, LOCALS_0			# space for local vars
# source line #37
	li	$v0, 4			# write string function
	la	$a0, literal_7			# load string literal
	syscall			# do the write string
	li	$v0, 11			# write char function
	li	$a0, 10			# ascii char
	syscall			# do the write char
# source line #41
	li	$t0, 3			# place a literal in register
	sw	$t0, -24($fp)			# move literal to memory
	lw	$t0, -24($fp)			# load op
	sw	$t0, 0($fp)			# assignment
# source line #42
	li	$t0, 0.0			# place a literal in register
	sw	$t0, -28($fp)			# move literal to memory
	lw	$t0, -28($fp)			# load op
	sw	$t0, -4($fp)			# assignment
# source line #43
	li	$t0, 0			# place a literal in register
	sw	$t0, -32($fp)			# move literal to memory
	lw	$t0, -32($fp)			# load op
	sw	$t0, -4($fp)			# assignment
# source line #44
	lw	$t0, -12($fp)			# load op
	sw	$t0, -4($fp)			# assignment
# source line #45
	lw	$t0, -16($fp)			# load op
	sw	$t0, -4($fp)			# assignment
# source line #49
	li	$t0, 0.0			# place a literal in register
	sw	$t0, -36($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -40($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -36($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -40($fp)			# store result
	lw	$t0, -40($fp)			# load the bool
	bgtz	$t0, true_8			# if $t0=0
	la	$a0, false_msg			# load 'false'
	j	after_8			# else
true_8:
	la	$a0, true_msg			# load 'true'
after_8:
	li	$v0, 4			# write string function
	syscall			# do the write string
# source line #50
	li	$t0, 0			# place a literal in register
	sw	$t0, -44($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -48($fp)			# move literal to memory
	lw	$t0, -44($fp)			# load left op
	lw	$t1, -4($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -48($fp)			# store result
	lw	$t0, -48($fp)			# load the bool
	bgtz	$t0, true_9			# if $t0=0
	la	$a0, false_msg			# load 'false'
	j	after_9			# else
true_9:
	la	$a0, true_msg			# load 'true'
after_9:
	li	$v0, 4			# write string function
	syscall			# do the write string
# source line #51
	li	$t0, 0			# place a literal in register
	sw	$t0, -52($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -52($fp)			# store result
	lw	$t0, -52($fp)			# load the bool
	bgtz	$t0, true_10			# if $t0=0
	la	$a0, false_msg			# load 'false'
	j	after_10			# else
true_10:
	la	$a0, true_msg			# load 'true'
after_10:
	li	$v0, 4			# write string function
	syscall			# do the write string
# source line #52
	li	$t0, 0			# place a literal in register
	sw	$t0, -56($fp)			# move literal to memory
	lw	$t0, -16($fp)			# load left op
	lw	$t1, -4($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sltu	$t2, $0, $t2			# are they not equal?
	xori	$t2, $t2, 1			# now shows if equal
	sw	$t2, -56($fp)			# store result
	lw	$t0, -56($fp)			# load the bool
	bgtz	$t0, true_11			# if $t0=0
	la	$a0, false_msg			# load 'false'
	j	after_11			# else
true_11:
	la	$a0, true_msg			# load 'true'
after_11:
	li	$v0, 4			# write string function
	syscall			# do the write string
# source line #56
	li	$t0, 0.0			# place a literal in register
	sw	$t0, -60($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -64($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -60($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -64($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -64($fp)			# load the integer
	syscall			# do the write integer
# source line #57
	li	$t0, 0			# place a literal in register
	sw	$t0, -68($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -72($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -68($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -72($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -72($fp)			# load the integer
	syscall			# do the write integer
# source line #58
	li	$t0, 0			# place a literal in register
	sw	$t0, -76($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -76($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -76($fp)			# load the integer
	syscall			# do the write integer
# source line #59
	li	$t0, 0			# place a literal in register
	sw	$t0, -80($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -16($fp)			# load right op
	addu	$t2, $t0, $t1			# binary op
	sw	$t2, -80($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -80($fp)			# load the integer
	syscall			# do the write integer
# source line #62
	li	$t0, 0.0			# place a literal in register
	sw	$t0, -84($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -88($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -84($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -88($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -88($fp)			# load the integer
	syscall			# do the write integer
# source line #63
	li	$t0, 0			# place a literal in register
	sw	$t0, -92($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -96($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -92($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -96($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -96($fp)			# load the integer
	syscall			# do the write integer
# source line #64
	li	$t0, 0			# place a literal in register
	sw	$t0, -100($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -100($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -100($fp)			# load the integer
	syscall			# do the write integer
# source line #65
	li	$t0, 0			# place a literal in register
	sw	$t0, -104($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -16($fp)			# load right op
	sub	$t2, $t0, $t1			# binary op
	sw	$t2, -104($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -104($fp)			# load the integer
	syscall			# do the write integer
# source line #68
	li	$t0, 0.0			# place a literal in register
	sw	$t0, -108($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -112($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -108($fp)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -112($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -112($fp)			# load the integer
	syscall			# do the write integer
# source line #69
	li	$t0, 0			# place a literal in register
	sw	$t0, -116($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -120($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -116($fp)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -120($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -120($fp)			# load the integer
	syscall			# do the write integer
# source line #70
	li	$t0, 0			# place a literal in register
	sw	$t0, -124($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -124($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -124($fp)			# load the integer
	syscall			# do the write integer
# source line #71
	li	$t0, 0			# place a literal in register
	sw	$t0, -128($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -16($fp)			# load right op
	mult	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -128($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -128($fp)			# load the integer
	syscall			# do the write integer
# source line #74
	li	$t0, 0.0			# place a literal in register
	sw	$t0, -132($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -136($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -132($fp)			# load right op
	div	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -136($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -136($fp)			# load the integer
	syscall			# do the write integer
# source line #75
	li	$t0, 0			# place a literal in register
	sw	$t0, -140($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -144($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -140($fp)			# load right op
	div	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -144($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -144($fp)			# load the integer
	syscall			# do the write integer
# source line #76
	li	$t0, 0			# place a literal in register
	sw	$t0, -148($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	div	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -148($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -148($fp)			# load the integer
	syscall			# do the write integer
# source line #77
	li	$t0, 0			# place a literal in register
	sw	$t0, -152($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -16($fp)			# load right op
	div	$t0, $t1			# mult op
	mflo	$t2			# get result from special reg
	sw	$t2, -152($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -152($fp)			# load the integer
	syscall			# do the write integer
# source line #81
	li	$t0, 0.0			# place a literal in register
	sw	$t0, -156($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -160($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -156($fp)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	sw	$t2, -160($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -160($fp)			# load the integer
	syscall			# do the write integer
# source line #82
	li	$t0, 0			# place a literal in register
	sw	$t0, -164($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -168($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -164($fp)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	sw	$t2, -168($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -168($fp)			# load the integer
	syscall			# do the write integer
# source line #83
	li	$t0, 0			# place a literal in register
	sw	$t0, -172($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -12($fp)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	sw	$t2, -172($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -172($fp)			# load the integer
	syscall			# do the write integer
# source line #84
	li	$t0, 0			# place a literal in register
	sw	$t0, -176($fp)			# move literal to memory
	lw	$t0, -4($fp)			# load left op
	lw	$t1, -16($fp)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	sw	$t2, -176($fp)			# store result
	li	$v0, 1			# write integer function
	lw	$a0, -176($fp)			# load the integer
	syscall			# do the write integer
# source line #86
	li	$t0, 0.0			# place a literal in register
	sw	$t0, -180($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -184($fp)			# move literal to memory
	l.s	$f0, -180($fp)			# load left op
	l.s	$f1, -4($fp)			# load right op
		$f2, $f0, $f1			# binary op
	s.s	$f2, -184($fp)			# store result
	li	$v0, 2			# write float function
	l.s	$f12, -184($fp)			# load the float
	syscall			# do the write float
# source line #87
	li	$t0, 1			# place a literal in register
	sw	$t0, -188($fp)			# move literal to memory
	li	$t0, 0			# place a literal in register
	sw	$t0, -192($fp)			# move literal to memory
	lw	$t0, -188($fp)			# load left op
	lw	$t1, -4($fp)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	sw	$t2, -192($fp)			# store result
	lw	$t0, -192($fp)			# load the bool
	bgtz	$t0, true_12			# if $t0=0
	la	$a0, false_msg			# load 'false'
	j	after_12			# else
true_12:
	la	$a0, true_msg			# load 'true'
after_12:
	li	$v0, 4			# write string function
	syscall			# do the write string
# source line #88
	li	$t0, 0			# place a literal in register
	sw	$t0, -196($fp)			# move literal to memory
	lw	$t0, -12($fp)			# load left op
	lw	$t1, -4($fp)			# load right op
	div	$t0, $t1			# mult op
	mfhi	$t2			# get result from special reg
	sw	$t2, -196($fp)			# store result
	lw	$t0, -196($fp)			# load the bool
	bgtz	$t0, true_13			# if $t0=0
	la	$a0, false_msg			# load 'false'
	j	after_13			# else
true_13:
	la	$a0, true_msg			# load 'true'
after_13:
	li	$v0, 4			# write string function
	syscall			# do the write string
# source line #89
	li	$t0, 0			# place a literal in register
	sw	$t0, -200($fp)			# move literal to memory
	l.s	$f0, -16($fp)			# load left op
	l.s	$f1, -4($fp)			# load right op
		$f2, $f0, $f1			# binary op
	s.s	$f2, -200($fp)			# store result
	li	$v0, 2			# write float function
	l.s	$f12, -200($fp)			# load the float
	syscall			# do the write float
# source line #92
	li	$t0, 0.0			# place a literal in register
	sw	$t0, -204($fp)			# move literal to memory
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -204($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testinint_2			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #93
	li	$t0, 0			# place a literal in register
	sw	$t0, -208($fp)			# move literal to memory
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -208($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testinint_2			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #94
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -12($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testinint_2			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #95
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -16($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testinint_2			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #97
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -4($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testinbool_6			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #98
	li	$t0, 2			# place a literal in register
	sw	$t0, -212($fp)			# move literal to memory
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -212($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testinbool_6			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #99
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -4($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testinfloat_4			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #100
	li	$t0, 2			# place a literal in register
	sw	$t0, -216($fp)			# move literal to memory
	addiu	$sp, $sp, -4			# make space
	lw	$t0, -216($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testinfloat_4			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #105
	addiu	$sp, $sp, -4			# make space
	la	$t0, -12($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testoutint_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #106
	addiu	$sp, $sp, -4			# make space
	la	$t0, -16($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testoutint_1			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #108
	addiu	$sp, $sp, -4			# make space
	la	$t0, -4($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testoutbool_5			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #110
	addiu	$sp, $sp, -4			# make space
	la	$t0, -4($fp)			# load param
	sw	$t0, 4($sp)			# push param
	addiu	$sp, $sp, -4			# space for parent fp
	sw	$fp, 4($sp)			# push parent frame
	jal	testoutfloat_3			# call user procedure
	addiu	$sp, $sp, 8			# pop params
# source line #113
	lw	$ra, 8($fp)			# restore our return addr
	lw	$fp, 4($fp)			# restore caller frame
	addiu	$sp, 228			# restore locals space
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



