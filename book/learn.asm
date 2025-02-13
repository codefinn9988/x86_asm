;imp registers 
;1. general purpose registers
;2. rflags 
;3. instruction pointer
;4. SSE registers
;5. AVX registers
;
;mov rax , rbx ; now if rbx = 10 rax = 10 & rbx = 10 (copy behind)
;
;mov rax, ebx  ; now high order rax will filled with sign bit positive(00000) negative(1111)
;
;test vs cmp = test  use bitwise AND operation (affecting flags zf,sf) 
;cmp = subtraction (cf ,zf)
;
;movzbl = extend  with zeros  for lower bit to higher bit
;movslq = preserve the sign
;
;important flags 
;1. cf (carry)
;2. zf  (zero)
;3. sf (sign)
;3. of (overflow)
;
;e = zf(1) ne(not equal) = zf(0)
;
;each stack frame contains  (stack frame is a data structure that manages data for each function call)
;1. parameters 
;2. return address 
;3. previous frame pointer 
;4. local variables
;
;xor rax , rax(zeroing the reg) is quicker than mov rax, 0 (put constants in reg)
;
;floating numbers

;movsd = double precision floating-point (SEE instruction)
MOVSD xmm1, xmm2

  ;1st s-single p -> packed(vector)
  ;2nd s-single precision d-> double precision
  ss -> single precison float
  sd ->  double 
  ps ->  vector of single 
  pd ->  vector of double

  ; ymm  total 256bit 
  ; higher 128 bit |  xmm low 128bit
  ;
  ; float value in computer 
  ; | sign | exponent | mantissa
    | 0  | 00001111 | 110000000000000000000000
