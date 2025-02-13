section .data
    filename db "test.txt", 0      ; Null-terminated filename
    content db "Hello, File!", 0   ; Content to write
    content_len equ $ - content    ; Length of content
    error_msg db "Error occurred", 10
    error_len equ $ - error_msg

section .bss
    fd resq 1                      ; File descriptor (8 bytes)
    buffer resb 1024              ; Buffer for reading
    
section .text
    global _start

_start:
    ; Open file for writing (Create if doesn't exist)
    mov rax, 2                    ; sys_open (x86_64 uses 2, not 5)
    mov rdi, filename             ; First argument: filename
    mov rsi, 102o                 ; Second argument: flags (O_CREAT | O_RDWR)
    mov rdx, 0644o               ; Third argument: mode (file permissions)
    syscall
    
    ; Check for errors (negative value indicates error)
    cmp rax, 0
    jl error
    
    ; Store file descriptor
    mov [fd], rax
    
    ; Write to file
    mov rax, 1                    ; sys_write (x86_64 uses 1, not 4)
    mov rdi, [fd]                ; First argument: file descriptor
    mov rsi, content             ; Second argument: content to write
    mov rdx, content_len         ; Third argument: content length
    syscall
    
    ; Check for errors
    cmp rax, 0
    jl error
    
    ; Seek to beginning of file
    mov rax, 8                    ; sys_lseek
    mov rdi, [fd]                ; First argument: file descriptor
    xor rsi, rsi                 ; Second argument: offset (0)
    xor rdx, rdx                 ; Third argument: whence (SEEK_SET)
    syscall
    
    ; Read from file
    mov rax, 0                    ; sys_read (x86_64 uses 0, not 3)
    mov rdi, [fd]                ; First argument: file descriptor
    mov rsi, buffer              ; Second argument: buffer
    mov rdx, 1024                ; Third argument: count
    syscall
    
    ; Check for errors
    cmp rax, 0
    jl error
    
    ; Write content to stdout
    mov rdx, rax                 ; Length of read data
    mov rax, 1                    ; sys_write
    mov rdi, 1                    ; First argument: stdout (fd 1)
    mov rsi, buffer              ; Second argument: buffer
    syscall
    
    ; Close file
    mov rax, 3                    ; sys_close (x86_64 uses 3, not 6)
    mov rdi, [fd]                ; First argument: file descriptor
    syscall
    
    ; Exit successfully
    mov rax, 60                   ; sys_exit
    xor rdi, rdi                 ; status: 0
    syscall
    
error:
    ; Print error message
    mov rax, 1                    ; sys_write
    mov rdi, 2                    ; stderr
    mov rsi, error_msg           ; error message
    mov rdx, error_len           ; length
    syscall
    
    ; Exit with error
    mov rax, 60                   ; sys_exit
    mov rdi, 1                    ; status: 1
    syscall
