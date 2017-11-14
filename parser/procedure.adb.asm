# MIPS assembly generated from BADA source.
.data
enter_msg : .asciiz	"\nbegin program\n"
exit_msg : .asciiz "\nend program\n"

# user string literals:

literal1:	.asciiz	"hello"	# a string

.text
.globl main
# begin user procedures

_0_main:			# begin user procedure
	li	$v0, 4			# write string function
	la	$a0, literal1			# load string literal
	syscall			# do the write string
jr	$ra			# end procedure _0_main


# end user procedures.

main:
		# program entry point
	li $v0, 4
	la $a0, enter_msg
	syscall		#print string


	jal	_0_main			# call user procedure

	li $v0, 4
	la $a0, exit_msg
	syscall		# print string

	li $v0, 10
	syscall		# exit program



