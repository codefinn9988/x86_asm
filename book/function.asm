;functions
  ;global <procName>
  ;<procName>:
    ; function body
  ;ret  
  ;
  ;call <funcName>
  ;
  ;call ; push the rip register on the stack and jump to function name
  ; ret: pops the rsp into the rip (next instruction to be executed) register
  ; rax  save the returning result from function 
  ; first 6 integer arguments 
  ; rdi, rsi, rdx, rcx, r8, r9
  ;
  ;
  ;write function to add 2 numbers using function 

  section .data 

  section .text
  global _start

  add_numbers:
  ;set up stack frame ;rbp ----- rsp
  push rbp  ; base pointer
  mov rbp , rsp ;rbp as frame pointer to access arg in the stacks
  add rdi , rsi 
  mov rax, rdi
  ;clean  up stack frame ;rbp-rsp
  mov rsp , rbp  ; restore rsp from rbp
  pop rbp 
  ret ;exit back to where it called

_start:

  mov rdi , 5
  mov rsi , 10
  call add_numbers

  mov edi , eax; (exit code = 15 not 0)
  mov eax,60
  syscall

  ;output echo $? (15)
  ;print exit status stored by shell  from the last command 
  ;shell store value or rdi -> kernel propagate value to parent process  -> then shell store
