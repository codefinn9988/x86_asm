;/*
;  * https://github.com/0xAX/asm?tab=readme-ov-file
;  * nasm -f elf64 -o hello.o hello.asm
;  * ld -o hello hello.o
;*/

  section .data
  message : db "Hello, World",10

  global _start
  section .text
_start:
  mov rax, 1  ; 1 is sys_write  systemvcall for write
  mov rdi ,1 ; 1 stdout 
  mov rsi, message ; rsi hold pointer of the data 
  mov rdx,13 ; hold  number of bytes to write 
  syscall ; Call the `sys_write` system call.
  mov rax, 60 ; system call for exit
  mov rdi, 0  ; exit code 0(0= success)
  syscall ;  Call the `sys_exit` system call

  ; stdin= 0     ;  System call table 0-> sys_read 1-> sys_write
  ; stdout = 1    ; 2-> sys_open 3 -> sys_close 4 -> sys_stat 5 -> sys_fstat
  ; stderr = 2     ; 60 -> sys_exit
  ;section .data = store static data 
  ;message = variable name 
  ;db = define byte allocate space (8 bits| 1 byte)
  ;10 = newline character(ascii)
  ;global _start = is a directive is used to declare start label(for linker) entry point
  ;section .text = begining of the text section(contains all the instructions that will be executed by the CPU)
  ;_start = marker of the entry point 
  ;

  ;learn
  ;[label:] instruction [operands] [; comment]
  ;rax = store temporary value & store system call number
  ;rdi =  used to pass the first argument to a function.
  ;rsi = used to pass the second argument to a function.
  ;rdx =  used to pass the third argument to a function.
  ;r8, r9
  ;
  ;data - used for declaring initialized data or constants.
  ;bss - used for declaring non-initialized variables.
  ;text - used for the code of the program.
  ;shstrtab - stores references to the existing sections.
  ;
  ;section .bss
    ;; Define a buffer with the size 64 bytes
    ;buffer resb 64
  ;
  ;DB | RESB 1 = 1 byte (define byte) 
  ;DW | RESW 1 = 2 bytes (define word)
  ;DD | RESD 1 = 4 bytes (define doubleword)
  ;DQ | RESQ 1 = 8 bytes (define quadword)
  ;
  ;accessing a variable by name gets us its address, not the actual value it stores:
  ; Move the address of the `num1` variable to the al register
  ;move al, num1
  ;
  ;To get the actual value located in the given address, we need to specify the variable name in square brackets:
  ;mov al, [num1]
  ;
  ; you can use the registers RAX, EAX, AX, and AL simultaneously in the same program
  ;
  ;ADD - Addition
  ;SUB - Subtraction
  ;MUL - Unsigned multiplication
  ;IMUL - Signed multiplication
  ;DIV - Unsigned division
  ;IDIV - Signed division
  ;INC - Increment
  ;DEC - Decrement
  ;NEG - Negation
  ;
  ;JE/JZ - Jump if the values are equal.
  ;JNE/JNZ - Jump if the values are not equal.
  ;JG - Jump if the first value is greater than the second.
  ;JGE - Jump if the first value is greater or equal to the second.
  ;JA - The same as JG, but performs the unsigned comparison.
  ;JAE - The same as JGE, but performs the unsigned comparison.


  ; LEA (load effective address)
  ; add rax , rbx add = opcode  rax,rbx = operand
