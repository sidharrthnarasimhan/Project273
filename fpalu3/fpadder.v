module fpadder(input_a,input_b,result,clock,reset_n);
input [31:0] input_a;
input [31:0] input_b;
input clock;
input reset_n;
output[31:0] result;
reg result;
reg a_sign,b_sign;
reg [7:0] a_exp,b_exp;
reg[23:0] a_mantissa,b_mantissa;

compare uut1() 