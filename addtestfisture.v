module addtest(a_input,b_input,sum);
  input[31:0] a_input,b_input;
  output[31:0] sum;
  wire [31:0] sum;
  reg[31:0]a_input,b_input;
  fpalu_add add1(a_input,b_input,sum);
  initial
    begin
      a_input = 32'h12345678;
      b_input = 32'h82346782;
    end
endmodule
      