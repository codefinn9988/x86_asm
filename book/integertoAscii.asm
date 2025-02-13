section .data 
  NULL equ 0
  EXIT_SUCCESS equ 0 
  SYS_exit equ 60
  STDOUT equ 1 
  SYS_write equ 1 

  intNum dd 1498 ; (dd = double word)

section .bss
  strNum resb 10

section .text 
  global _start

_start:

  mov eax ,dword [intNum] ; get the integer
  mov rcx , 0 ; digits count
  mov ebx, 10

divideLoop:
  mov edx, 0
  div ebx ; eax/ebx 1498/10
  push rdx ; push remainder to stack
  inc rcx

  cmp eax,0
  jne divideLoop ; jump if not equal

  mov rbx,strNum ; get addr of string of resb
  mov rdi ,0 ; idx= 0

popLoop:
  pop rax 
  add al , '0' ; char= int + "0"

  mov byte  [rbx+rdi],al ; string[idx] = char
  inc rdi ;inc idx
  loop popLoop ; until rcx = 0

  mov byte [rbx+rdi],NULL ; string[idx] = NULL
  push rdi  ;strore the length of integer by pushing into stack

  ;print the number
  mov rax, SYS_write
  mov rdi, STDOUT 
  mov rsi ,strNum 
  pop rdx ; pop from stack and put the value in rdx
  syscall

last:
  mov rax,SYS_exit
  mov rdi ,EXIT_SUCCESS
  syscall

