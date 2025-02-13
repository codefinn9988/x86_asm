
section .data 
  message db "hello",10
  len equ $-message

section .text
  global _start

_start
