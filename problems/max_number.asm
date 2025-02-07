;2. Finding the Maximum of Two Numbers: Determine which of two numbers is larger.
section .data
  num1 dq 0x64
  num2 dq 0x32
  message db "Max Numer is : ",0
  buffer db '00000000',10

global _start
  section .text

_start:
  mov rax, [num1]
  mov rbx, [num2]

   ;not overwrite from print message
   ;Save rax before printing message
  push rax

  ;print message 
  mov rsi , message
  mov rdx ,15 
  mov rax, 1  ;problem this overwrite so use push and pop 
  mov rdi , 1 
  syscall
  
  pop rax

  ;find max number
  call find_max

  ;print  number
  call print_number

  ;exit program
  mov rax, 60
  xor rdi , rdi
  syscall

find_max:
  cmp rax,rbx
  jge .done ; jump if greater than or equal 
  mov rax, rbx
.done:
  ret

print_number:
  mov rcx, 10
  mov rdi, buffer+9
  mov byte [rdi],0

.convert_loop:
  dec rdi 
  xor rdx, rdx 
  div rcx 

  add dl ,'0'
  mov [rdi],dl
  test rax, rax
  jnz .convert_loop
  
  mov rsi ,rdi 
  mov rdx, buffer+9
  sub rdx , rdi 
  mov rsi , rdi 
  mov rax, 1 
  mov rdi , 1 
  syscall

  ret

