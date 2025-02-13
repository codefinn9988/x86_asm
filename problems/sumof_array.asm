;4. Sum of an Array: Calculate the sum of all elements in an array.
section .data
  array db 1,2,3,4,5
  len equ $-array
  newLine db 10

section .bss
  sum resb 1  ;for sum
  char_ans resb 2  ;for ascii result(2 byte)

section .text
  global _start
  ;rax->eax ,ax,al
  ;rbx->ebx ,bx,bl

_start:
  ;calculate sum
  xor ax,ax ;  will hold our sum
  mov rsi, array ;source
  mov rcx,len ;  counter for loop 


sum_loop: 
  xor bx,bx ; 
  mov bl ,[rsi] ; load curr byte in bl
  add ax,bx 
  inc rsi
  loop sum_loop ; until rcx = 0

  ;convert number to ascii digits 
  mov bl,10
  div bl  ; divide ax by 10 

;al = quotent ah = remainder

  add ah,'0' ; converts ones digits ascii
  mov [char_ans+1],ah

  add al,'0' ; convrts tens ditits to ascii
  mov [char_ans],al
  

  ;print the converted number
  mov rax,1
  mov rdi,1
  mov rsi , char_ans
  mov rdx,2
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
