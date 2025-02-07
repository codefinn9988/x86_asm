section .data
  num1 dq 0x64        ; Define num1 as a quadword (64-bit)
  num2 dq 0x32        ; Define num2 as a quadword (64-bit)
  message db "Numbers are swapped",10
  buffer db '00000000',10
  
section .text
  global _start

_start:
  mov rax, [num1]     ; Use [] to dereference memory address
  mov rbx, [num2]     ; Add space after comma for clarity
  
  ; Swap using xchg
  xchg rax, rbx
  
  ; Store swapped values back
  mov [num1], rax
  mov [num2], rbx
  
  ; Print message
  mov rax, 1          ; syscall number for write
  mov rdi, 1          ; file descriptor (stdout)
  mov rsi, message    ; message address
  mov rdx, 20         ; message length
  syscall
  
  ; Print first number
  mov rax, [num1]
  call print_number
  
  ; Print second number
  mov rax, [num2]
  call print_number
  
  ; Exit program
  mov rax, 60         ; syscall number for exit
  xor rdi, rdi        ; exit status 0
  syscall

print_number:
    ; Convert number in RAX to string and print it
    mov rcx, 10             ; Base 10 for decimal conversion
    mov rdi, buffer + 9     ; Point to the end of buffer (null terminator)
    mov byte [rdi], 0       ; Null-terminate the string

.convert_loop:
    dec rdi                 ; Move backward in buffer
    xor rdx, rdx            ; Clear RDX for division
    div rcx                 ; Divide RAX by 10; RDX = RAX % 10 (digit)
    
    add dl, '0'             ; Convert digit to ASCII ('0' + digit)
    mov [rdi], dl           ; Store ASCII character in buffer
    test rax, rax           ; Check if RAX is zero
    jnz .convert_loop       ; If not zero, continue converting
    
    mov rsi, rdi            ; Set RSI to point to the start of the string
    mov rdx, buffer + 9  ; Calculate length of the string for printing
    sub rdx,rdi 
    mov rsi ,rdi
    mov rax, 1              ; syscall: write
    mov rdi, 1              ; file descriptor: stdout
    syscall
    
    ret                     ; Return from print_number
