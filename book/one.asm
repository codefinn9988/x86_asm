section .data 
  message db "hello world", 10
  len equ $-message

section .text 
  global _start

_start:
  mov rax , 1 ;sys_write
  mov rdi ,1
  mov rsi , message
  mov rdx, len
  syscall

  mov rax ,60 
  xor rdi , rdi 
  syscall
