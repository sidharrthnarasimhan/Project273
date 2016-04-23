//module for floating point addition logic
//independent module 
module fpalu_add(a_input,b_input,clock,reset_n,sum);
input[31:0]a_input,b_input;
output[31:0]sum;
input clock,reset;
reg sumneg;//the sign bit is represented as neg
reg[7:0] sumexp;//the exponent bit is represented as exp
reg[22:0] sumsig;//the significand or mantissa or fraction part is represented as sig
reg[31:0]sum;

//for internal computations
reg[31:0]a,b;
reg[25:0]asig,bsig;
reg[7:0]aexp,bexp;
reg aneg,bneg;
reg[7:0] shift;
always @(posedge clock or negedge reset_n)
begin
if(!reset_n)
begin
a_input = 0;
b_input = 0;
sum = 0;
end
else
sum = a_input+b_input;
end 
//Compare exponents and swap the values for computation
 always @(*) 
 begin
//Compare exponents
 if ( a_input[30:23] < b_input[30:23] ) 
 begin
 a = b_input;  b = a_input;
 end 
 else 
 begin
 a = a_input;  b = b_input;
 end
//split the value of a,b into sign(neg), exponent(exp), and significand(sig).

//aneg = signbit of a, bneg = signbit of b
  aneg = a[31];     bneg = b[31];

//aexp is exponent part of a, bexp is exponent part of b
aexp = a[30:23];  bexp = b[30:23];

        asig = { 2'b0, aexp ? 1'b1 : 1'b0,a[22:0] };
        bsig = { 2'b0, bexp ? 1'b1 : 1'b0,b[22:0] };

//de-normalize b so that aexp == bexp.

shift = aexp - bexp;
bsig = bsig >> shift;

 //negate the significands.
 if ( aneg ) asig = -asig;
 if ( bneg ) bsig = -bsig;

 //Sum calculation
 sumsig = asig + bsig;
 assign sum = {sumneg,sumexp,sumsig}
 
 //the output format assign statements
 assign sum[31] = sumneg;
 assign sum[30:23] = sumexp;
 assign sum[22:0] = sumsig; 
 
 
 //Take absolute value of sum.
 sumneg = sumsig[22];
 if ( sumneg ) sumsig = -sumsig;
 
//normalization
if(sumsig[21]) 
  begin
 //Sum overflow.
      sumexp = aexp + 1;
      sumsig = sumsig >> 1;

      end else if ( sumsig ) 
  begin
      //not a overflow.
	  integer pos, val, i;

// Find position of first non-zero digit.
       pos = 0;
       for (i = 23; i >= 0; i = i - 1 ) 
	   if ( !pos && sumsig[i] ) pos = i;
 // Compute amount to shift significand and reduce exponent.
           val = 23 - pos;
    if ( aexp < val ) 
   begin
 //  Exponent too small, floating point underflow, set to zero.

            sumexp = 0;
            sumsig = 0;
            sumneg = 0;

           end else 
   begin
              
              // Adjust significand and exponent.

              sumexp = aexp - val;
              sumsig = sumsig << val;

    end

    end else 
    begin
           
           // Sum is zero.

           sumexp = 0;
           sumsig = 0;

     end
end 

endmodule
 