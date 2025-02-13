;extern <symbolName>
; first put .gloabal add_func
  ; next file .extern  add_func
  ; call add_func
  ;
  ; The buffer overflow overwrites the return address on the stack
  ;  a NOP slide, NOP sled or NOP ramp is a sequence of NOP (no-operation) instructions
  ;  meant to "slide" the CPU's instruction execution flow to its final,
  ;  desired destination whenever the program branches to a memory address anywhere on the slide.
  ;
  ; nop used to exploiting stack buffer overflow
  ;
  ; -- command line -- 
  ; argc = argument count 
  ; argv = argument vector (quadword addresses of the string for each argument. )  
  ; single precision = 7 decimal digits precision (float) s 
  ; double precision = 16 decima ldigits precision (double) d
  ; movss <dest>, <src>
  ; movsd <dest>, <src>
  ;
  ;cvtss2sd -- convert single precision to double precision  
  ;cvtsd2ss -- double to single 
  ;cvtss2si -- single to integer
  ;
  ;
  ;-- parallel processing --
  ;POSIX - Portable Operating System Interface
