; macro in asm
  ; single line macro 
  ;%define  body
  ;
  ; multi line macro 
  ; %macro <name> <number of arguments>
  ; [body of macro]
  ;%endmacro
  ;

  section .data 
  msg1 db "hello world 1",10
  len1 equ $-msg1
  msg2 db "hello world 2",10
  len2 equ $-msg2
  msg3 db "hello world 3",10
  len3 equ $-msg3

  %macro write_string 2  ; %macro name , num of argc
  mov rax , 1
  mov rdi , 1
  mov rsi , %1
  mov rdx, %2
  syscall
  %endmacro

  section .text 
  global _start

_start: 
  write_string msg1,len1
  write_string msg2,len2
  write_string msg3,len3

  ; exit 
  mov rax,60 
  xor rdi , rdi 
  syscall
