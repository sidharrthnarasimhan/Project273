module fpalu_add(a_input.b_inout,sum)
input[31:0]a_input,b_input;module fpalu_add(a_input.b_inout,sum)
input[31:0]a_input,b_input;
output[31:0]sum;
<<<<<<< HEAD

reg sumneg;//the sign bit is represented as neg
reg[7:0] sumexp;//the exponent bit is represented as exp
reg[22:0] sumsig;//the significand or mantissa or fraction part is represented as sig
reg[31:0]sum;

//the output format assign statements
assign sum[31] = sumneg;
assign sum[30:23] = sumexp;
assign sum[22:0] = sumsig; 

//for internal computations
reg[31:0]a,b;
reg[22:0]asig,bsig;
reg[7:0]aexp,bexp;
reg aneg,bneg;
reg[7:0] shift;

//Compare exponents and swap the values for computation
always @(*)
//Compare exponents
 if ( a_input[30:23] < b_input[30:23] ) 
 begin
 a = b_input;  b = a_input;
 end else begin
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
bsig = bsig >> diff;

 //negate the significands.
 if ( aneg ) asig = -asig;
 if ( bneg ) bsig = -bsig;

 //Sum calculation
 sumsig = asig + bsig;
 
 //Take absolute value of sum.
 sumneg = sumsig[23];
 if ( sumneg ) sumsig = -sumsig;
 
 bsig = bsig >> shift;

 //negate significands.
 if ( aneg ) asig = -asig;
 if ( bneg ) bsig = -bsig;

 //Sum computation
 sumsig = asig + bsig;
 
 
 
 endmodule
 