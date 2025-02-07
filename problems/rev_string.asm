;3. Reversing a String: Reverse the characters in a null-terminated string.
section .data
  SYS_WRITE equ 1
	STD_OUT equ 1
	SYS_EXIT equ 60
	EXIT_CODE equ 0

	NEW_LINE db 0xa
	INPUT db "Hello world!"

section .bss
  OUTPUT resb 1 ;reserve 1 byte


section .text
  global _start

_start:
  mov rsi , INPUT ; load address of  input string in rsi register
  xor rcx, rcx ; for counter string length 
  cld ; Clears the Direction Flag (sets DF to 0).
  ;$ - returns position in memory of string where $ defined
  mov rdi , $+15 ; 
  call calculateStrLength
  xor rax, rax
  xor rdi , rdi
  jmp reverseStr

calculateStrLength: 
  cmp byte [rsi],0 ; for end of string
  je exitFromRoutine ;if 0 jump 
  lodsb  ;load a byte from memory into the AL register
  push rax  ; save al on stack 
  inc rcx ; to count characters
  jmp calculateStrLength ;repeats

exitFromRoutine: 
  push rdi  ; save rdi before returning 
  ret

reverseStr: 
  cmp rcx, 0 ;check any characers left 
  je printResult ; no characer left print
  pop rax  ; 
  mov [OUTPUT + rdi],rax ; write char on output at positoin rdi 
  dec rcx ;dec character count
  inc rdi  ; incrment output index
  jmp reverseStr ; until all character are processed

printResult: 
  mov rdx,rdi  ; set rdx with num of characters written 
  mov rax, 1 ;
  mov rdi , 1
  mov rsi , OUTPUT
  syscall
  jmp printNewLine

printNewLine:
	mov rax, SYS_WRITE
	mov rdi, STD_OUT
	mov rsi, NEW_LINE
	mov rdx, 1
	syscall
	jmp exit

exit:
  mov rax,SYS_EXIT
  mov rdi ,EXIT_CODE
  syscall
