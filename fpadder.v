module fpalu_add(a_input.b_inout,sum)
input[31:0]a_input,b_input;
output[31:0]sum;
reg[31:0]sum;
reg[31:0]a,b;
reg[22:0]asig,bsig;
reg[22:0]sumsig;
//Compare exponents
 if ( a_input[30:23] < b_input[30:23] ) 
 begin
 a = b_input;  b = a_input;
 end else begin
 a = a_input;  b = b_input;
 end
 //Break operand into sign (neg), exponent, and significand.
 //aneg = signbit of a, bneg = signbit of b
aneg = a[31];     bneg = b[31];
//aexp is exponent part of a, bexp is exponent part of b
aexp = a[30:23];  bexp = b[30:23];
 // Step 3: de-normalize b so that aexp == bexp.
 //asig = significand part of a, bsig = significand part of b
diff = aexp - bexp;
bsig = bsig >> diff;

 // Step 4: If necessary, negate significands.
 if ( aneg ) asig = -asig;
 if ( bneg ) bsig = -bsig;

 /// Step 5: Compute sum.
 sumsig = asig + bsig;
 endmodule
 