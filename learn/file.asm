; learn file operation in asm

section .data 
  filename db "test.txt",0
  content db "Hello, File!",0
  content_len equ $-content
  err_msg  db "Error occured",10
  err_len equ $-err_msg

section .bss 
  fd resq 1 ; resq = q(quadword 8)
  buffer resb 1024

section .text 
  global _start
  ;O_CREAT =0100  (create file if not exit)
  ; O_RDONLY = 0
  ; O_WRONLY = 1
  ; O_RDWR = 2
  ; O_RDWR | O_CREAT = 2|0100 = 102
_start:
  mov rax,2 ; sys_open
  mov rdi ,filename
  mov rsi ,102o
  mov rdx , 0644o ; mode file permisssion

