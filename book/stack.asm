; rsp = point current top of the stack
; rbp = base pointer register
  ; stack (go down)
  ; .
  ; .
  ; .
  ; heap (go up )
  ; if the stack and heap meet, the program will crash(no memory available)
  ;
  ;
  ;0. push and pop from stack
  ;1. reverse the array 
  ;2. 

  ; reverse a array using stack 
  ; first push them in stack the pop them 
  ; it will be in reverse order
  ; print the reverse data 
section .data
  array db 1,2,3,4,5
  len equ $-array
  ; divide the problem
  ; 1. push array data into stack

section .bss
  revArr  resb len

section .text
  global _start

_start:
  mov rsi ,array
  mov rcx , len 

convert_loop:
  movzx rax,byte [rsi] ; Move With Zero-Extend
  add al, '0'
  push rax
  inc rsi
  loop  convert_loop

;pop
  mov rdi , revArr
  mov rcx , len 
retrive_stack:
  pop rax
  mov [rdi],al
  inc rdi 
  loop retrive_stack
  
  ;print 
  mov rax ,1
  mov rdi ,1
  mov rsi ,revArr
  mov rdx, len
  syscall

  mov rax,60
  xor rdi, rdi 
  syscall


