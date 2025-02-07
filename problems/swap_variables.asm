;1.  Swapping Two Numbers: Swap the values of two variables.
section .data
  num1 dq 0x64
  num2 dq 0x32
  message  db "Numbers are swapped",10
  buffer db '00000000',10 ; define  a buffer to hold  the string repn of numbers

  global _start
  section .text
_start:
  mov rax,[num1]
  mov rbx ,[num2]
  ;xchg rax,rbx
  mov [num1], rbx
  mov [num2], rax
  
  ;print message
  mov rsi, message
  mov rdx,20
  mov rax,1
  mov rdi,1
  syscall
  
  ;print first number
  mov rax, [num1]
  call print_number

  ;print second number
  mov rax, [num2]
  call print_number

  ;exit program
  mov rax, 60
  xor rdi ,rdi
  syscall

print_number:
 ; Convert number in RAX to string and print it
  mov rcx ,10 ; for decimal conversion
  mov rdi , buffer+9 ; get the address of 10 byte of bufffer
  mov byte [rdi],0 ; put that 0 for null terminator for string ;byte = to specify size

.convert_loop:
  dec rdi ;
  xor rdx,rdx ; clear rdx before division (for remainder)
  div rcx ;(rax/rcx) q = rax r = rdx

  add dl,'0' ; dl = lower 8 bit rdx ; convert remainder from integer to ascii 
  mov [rdi],dl ; store the character in buffer
  ; A test performs an AND without modifying the operands
  test rax,rax ; set ZF to 1 if rax == 0
  jnz .convert_loop ; jump if not zero

  mov rsi ,rdi ;set rsi point to start of converted number string
  mov rdx , buffer+9 ;calculate the length of string by subtracting pointer 
  sub rdx, rdi ; 
  mov rsi , rdi ;again set rsi to start
  mov rax , 1 ; 
  mov rdi , 1 ; 
  syscall ; 

  ret ; 
