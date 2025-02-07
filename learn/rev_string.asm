section .data 
  message db "Hello",10
  len equ $-message

section .bss
  reverse resb len+1

section .text
  global _start

_start:
  mov rax , 1
  mov rdi , 1
  mov rsi ,  message
  mov rdx , len
  syscall

  ;reverse the string
  mov rcx, len ; rcx = 6
  mov rsi , message
  add rsi ,rcx ;  rsi points to the null terminator
  mov rdi , reverse

reverse_loop:
  dec rsi
  mov al, [rsi];
  mov [rdi] , al
  inc rdi
  loop reverse_loop ; loop automatically decrease rcx register until rcx = 0

  mov byte [rdi] ,10 ; add new line

  ;print the reverse string
  mov rax, 1
  mov rdi , 1
  mov rsi , reverse
  mov rdx , len
  syscall
  
  mov rax ,60
  xor rdi , rdi
  syscall
