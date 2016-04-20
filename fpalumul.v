module fpalumul(clock,reset,a_input,b_input,result,overflow);
input clock, reset;
input [31:0] a_input, b_input;
output [31:0]result;
output overflow;
reg overflow;
reg [31:0] result;
reg sign;
reg [7:0] exp;
reg bias = 8'b10000001;
reg [47:0]mantissa;
reg [23:0] mantissa_a, mantissa_b;
reg [47:0] product;
always@(posedge clock or negedge reset)
begin 
     if (!reset)
	  begin
	  overflow<=1'b0;
     result<=32'b0;
	  sign<=1'b0;
     exp<=8'b0;  
	  bias <= 8'b0;
     mantissa<=48'b0;
	  mantissa_a<=24'b0;
	  mantissa_b<=24'b0;
     product<=48'b0;
	  end 
	  else 
	  begin
	  overflow<=overflow;
     result<=result;
	  sign<=sign;
	  exp<=exp;  
	  bias <= bias;
	  mantissa<=mantissa;
     mantissa_a<=mantissa_a; 
	  mantissa_b<=mantissa_b;
     product<=product;
	  end 
end 
always@(*)
begin 
//sign bits of a_input and b_input xor
       sign = a_input[31]^b_input[31];
//if exponents in the range 0 to 255
if ((8'b0<a_input[30:23]<8'b1111111) & (8'b0<b_input[30:23]<8'b1111111))
//adding the biased exponents of a_input and b_input and adding with bias = -127
	    exp= a_input[30:23]+ b_input[30:23]+ bias;
//if exponents greater than 255 or less than 0 assert overflow    
else 
       overflow = 1'b1;
//multiply the mantissa 	 
       mantissa_a = {1,a_input[22:0]};
		 mantissa_b = {1,b_input[22:0]};
       product = mantissa_a * mantissa_b;
//normalize the product by shifting left 1 spot if 10
       if (product[47:46]== 2'b10)
		 begin
		 product = product<<1;
		 mantissa = product[46:0];
		 end 
       else if (product[47:46] == 2'b01)
		 begin 
		  mantissa = product[46:0];
		 end  
//checking for overflow
      if (exp==8'b11111111)
      overflow = 1'b1;
      else
      overflow = 1'b0;
//rounding of logic 
      if (mantissa[22:21]==1'b1)
      mantissa[46:23] = mantissa[46:23] + 1'b1;
		else if (mantissa [22]== 1 & mantissa [21] == 0 & mantissa[20] == 1)
		mantissa[46:23] = mantissa[46:23] + 1'b1;
		else if (mantissa [22]== 1 & mantissa [21] == 0 & mantissa[20] == 0 & mantissa[23] == 1)
		mantissa [46:23] = mantissa[46:23] + 1'b1;
//Re-Normalizing 
      if (mantissa[47:46] == 2'b10)
          mantissa = mantissa >>1;
//Result
      result = {sign,exp,mantissa[46:23]};
end 
endmodule
