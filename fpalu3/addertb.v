`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:41:46 04/22/2016
// Design Name:   fpadd
// Module Name:   T:/New folder/fpalu3/addertb.v
// Project Name:  fpalu3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fpadd
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module addertb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg clk;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	fpadd uut (
		.a(a), 
		.b(b), 
		.clk(clk), 
		.out(out)
	);
    initial begin
	 clk = 0;
	 forever #10 clk = ~clk;
	 end
	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		#20
		a = 32'hefabcd12;
		b = 32'haaaaaaaa;

		// Wait 100 ns for global reset to finish
		#100 $finish;
        
		// Add stimulus here

	end
      
endmodule

