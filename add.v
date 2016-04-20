module add(a_input,b_input,sum);
  input[31:0] a_input,b_input;
  output sum;
 
  reg[31:0]sum;
  always@(*)
    begin 
      assign sum = a_input+b_input;
    end 
  endmodule


