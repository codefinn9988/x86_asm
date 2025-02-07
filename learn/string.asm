;section .data 
;  message db "hello world!",10
;  length equ $-message
;
;section .text 
;  global _start
;
;;1. rsp
;;2. rbp
;;3. rax
;;4  rdi
;;5. rsi
;;6. rdx
;;7. rcx
;;8. rbx
;
;_start:
;  mov rax,1 ; 
;  mov rdi , 1 ; 
;  mov rsi , message ; 
;  mov rdx , length  ; 
;  syscall
;
;  mov rax, 60 
;  xor rdi , rdi 
;  syscall

; getting user input
section .data 
  text1 db "What is your name?",10
  len1 equ $-text1
  text2 db "Hello, "
  len2 equ $-text2

section .bss
  name resb 16 ; reserve 16byte in buffer

section .text 
  global _start

_start:
  call _printText1
  call _getName
  call _printText2
  call _printName

  mov rax, 60
  xor rdi, rdi 
  syscall

_getName:
  mov rax,0 ; sys_read
  mov rdi, 1
  mov rsi ,name
  mov rdx, 16
  syscall
  ret ; make sure you return from function 

_printText1:
  mov rax, 1
  mov rdi, 1
  mov rsi ,text1
  mov rdx ,len1
  syscall
  ret


_printText2:
  mov rax, 1
  mov rdi , 1
  mov rsi , text2
  mov rdx,len2
  syscall
  ret

_printName:
  mov rax ,1
  mov rdi , 1
  mov rsi, name
  mov rdx , 16
  syscall
  ret
