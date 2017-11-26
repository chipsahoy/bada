
.386
.model flat, C

PUBLIC asm_main

ExitProcess proto stdcall, dwExitCode:dword
GetStdHandle proto stdcall, nStdHandle : dword
WriteFile proto stdcall, hFile : dword, buf : dword, count : dword, written : dword, overlapped : dword

STD_INPUT_HANDLE equ - 10
STD_OUTPUT_HANDLE equ - 11
STD_ERROR_HANDLE equ - 12

.data

stdout dd ?
stdin dd ?
stderr dd ?

enter_msg	db 'Begin program.', 10, 10
enter_size	equ $ - enter_msg
exit_msg	db 'End program.', 10
exit_size equ $ - exit_msg

.code

; function write_string
; params: buffer, size
; writes to stdout

write_string proc
push ebp
mov ebp, esp
sub esp, 4; written

push 0; overlapped
lea eax, [ebp - 4]
push eax; &written
mov eax, [ebp + 12]
push eax; count
mov eax, [ebp + 8]
push eax; buffer
mov eax, [stdout]
push eax; hfile
call WriteFile

add esp, 4
pop ebp
ret 8
write_string endp

read_bool proc
read_bool endp

read_int proc
read_int endp

read_float proc
read_float endp


literal_1	db	"hello world", 0
literal_2	db	10, 0

main_0	proc			; begin user procedure
mov	eax, 11			; load string size
push	eax			; push string size
lea	eax, literal_1			; load string location
push	eax			; push string location
call	write_string			; write the string
mov	eax, 1			; load string size
push	eax			; push string size
lea	eax, literal_2			; load string location
push	eax			; push string location
call	write_string			; write the string
ret
main_0	endp			; end user procedure
; function asm_init
; paramaters: none.
; initializes global state and prints a welcome message.

asm_init proc
mov eax, STD_OUTPUT_HANDLE
push eax
call GetStdHandle
mov stdout, eax

mov eax, STD_INPUT_HANDLE
push eax
call GetStdHandle
mov stdin, eax

mov eax, STD_ERROR_HANDLE
push eax
call GetStdHandle
mov stderr, eax

mov eax, enter_size
push eax
lea eax, enter_msg
push eax
call write_string
ret
asm_init endp

asm_main proc
push ebp
mov ebp, esp

call asm_init


call	main_0			; call a user procedure

mov eax, exit_size
push eax
lea eax, exit_msg
push eax
call write_string

push 0
call ExitProcess
asm_main endp

end


