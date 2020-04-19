`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:18:12 04/16/2020
// Design Name:   fetch
// Module Name:   A:/Cloud/Git/Verilog_Lab/MIPS_ISA_GROUP/tb_fetch.v
// Project Name:  MIPS_ISA_GROUP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_fetch;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] inst_r;
	reg [31:0] pc_i;
	reg pc_s;

	// Outputs
	wire [31:0] inst_a;
	wire [31:0] ir;
	wire [31:0] npc;

	// Instantiate the Unit Under Test (UUT)
	fetch uut (
		.clk(clk), 
		.reset(reset), 
		.inst_a(inst_a), 
		.inst_r(inst_r), 
		.ir(ir), 
		.pc_i(pc_i), 
		.npc(npc), 
		.pc_s(pc_s)
	);


	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		inst_r = 0;
		pc_i = 0;
		pc_s = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		clk = 1;
		pc_i = 4;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		
		#100;
		// Add stimulus here

	end
      
endmodule

