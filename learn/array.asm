;array
section .data
  array db 1,2,3,4,5
  len equ $-array
  newLine db 10

section .bss
  char_ans resb len

section .text
  global _start

_start:
  mov rsi, array ;source
  mov rdi , char_ans ; destination here is the line where rdi point to buffer to store data 
  mov rcx,len


convert_loop: 
  mov al, [rsi]
  add al ,'0'
  mov [rdi] ,al
  inc rsi
  inc rdi
  loop convert_loop

  ;print the converted number
  mov rax,1
  mov rdi,1
  mov rsi , char_ans
  mov rdx,len
  syscall

  ;print new line
  mov rax,1
  mov rdi , 1
  mov rsi , newLine
  mov rdx,1
  syscall

  mov rax,60
  xor rdi , rdi
  syscall
