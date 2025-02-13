; Read-Only Access → O_RDONLY
; Write-Only Access → O_WRONLY
; Read/Write Access → O_RDWR
  ;
  ;1. file open 
  ;Register | SYS_open
    ;rax |  Call code = SYS_open (2)
    ;rdi | Address of NULL terminated file name string
    ;rsi | File access mode flag
  ;
  ;2. file open/create  (crate a file if doesnot exit )
  ;if already exit erased and new file create
  ;Register |  SYS_creat
    ;rax |  Call code = SYS_creat (85)
    ;rdi |  Address of NULL terminated file name string
    ;rsi |  File access mode flag
  ;
  ;3. file read 
  ;Register |  SYS_read
    ;rax |  Call code = SYS_read (0)
    ;rdi |  File descriptor (of open file)
    ;rsi |  Address of where to place characters read
    ;rdx | Count of characters to read
  ;
  ;
  ;4. file write 
  ;Register |  SYS_write
    ;rax |  Call code = SYS_write (1)
    ;rdi |  File descriptor (of open file)
    ;rsi |  Address of characters to write
    ;rdx |  Count of characters to write
  ;
  ;
  ;
  section .data 
  filename db "example.txt",0
  message db "hello example file",10
  len equ $-message

  section .bss
  buffer resb 64 ; for reding data
  fd resb 1

  section .text 
  global _start
  ; 0- sys_read
  ; 1- sys_write
  ; 2 -sys_open 
  ; 3- sys_close
  ; 85 - sys_create

_start:
  ; open /create (sys_open)

  mov rax,2 ;sys_open
  mov rdi ,filename 
  mov rsi ,0x42 ; O_CREAT | O_WRONLY
  mov rdx,0o644 ; permission rw-r-r
  syscall
  mov [fd],rax ; save fd

  ; write file (SYS_write)
  mov rdi , rax ; put  fd in rdi 
  mov rax,1
  mov rsi ,message
  mov rdx,len
  syscall

   ; close file (sys_close)
  mov rax,3
  mov rdi,[fd]
  syscall

  ; open file for reading (sys_open)
  mov rax,2 ;sys_open
  mov rdi ,filename 
  mov rsi , 0; O_RDONLY 
  syscall
  mov [fd],rax ; save fd

  ; read file (sys_read)
  mov rdi, rax ; fd
  mov rax,0 
  mov rsi, buffer
  mov rdx, 64
  syscall


  ; print read content (sys_write to stdout)
  mov rdx ,rax; bytes read
  mov rax,1
  mov rdi, 1
  mov rsi , buffer
  syscall

  ; close file (sys_close)
  mov rax,3
  mov rdi ,[fd]
  syscall

  ; exit program
  mov rax,60
  xor rdi , rdi 
  syscall

