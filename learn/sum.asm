; we can write a simple program. As a reminder, this program
; will calculate the sum of two integers and compare it to a predefined third number.
; If the sum equals the third number, a string will be printed; otherwise,
; the program will just exit.

section .data
  ;(6×161)+(4×160)=(6×16)+(4×1)=96+4=100
  ;(3×161)+(2×160)=(3×16)+(2×1)=48+2=50
  num1 dq 0x64
  num2 dq 0x32
  msg db "The sum is correct!",10

section .text
  global _start

_start: 

  mov rax ,[num1]
  mov rbx, [num2]
  add rax , rbx

  .compare:
  cmp rax,150
  jne .exit ;jump if not equal
  jmp .correctSum ; unconditional jump

  .correctSum:
  mov rax,1
  mov rdi ,1
  mov rsi , msg
  mov rdx ,20
  syscall
  jmp .exit

  .exit:
  mov rax,60
  mov rdi ,0
  syscall
