`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:38:27 04/19/2020
// Design Name:   main_2
// Module Name:   A:/Cloud/Git/Verilog_Lab/MIPS_ISA/testbench_main_2.v
// Project Name:  MIPS_ISA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main_2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_main_2;

	// Inputs
	reg clock;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	main_2 uut (
		.clock(clock), 
		.reset(reset)
	);

	always #5 clock = ~clock;
	
	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
		
		reset = 0;
		#1000;
		$finish;
		
        
		// Add stimulus here

	end
      
endmodule

