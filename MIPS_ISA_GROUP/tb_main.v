`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:20:33 04/18/2020
// Design Name:   main
// Module Name:   A:/Cloud/Git/Verilog_Lab/MIPS_ISA_GROUP/tb_main.v
// Project Name:  MIPS_ISA_GROUP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`include "data_memory.v"
`include "instruction_memory.v"
//`include "combine_proce.v"
/*
module proc_tb();
reg clk_51,rst_51;
wire [31:0] mrd_d_51,mrd_i_51;
wire [31:0] mwd_d_51,mwd_i_51;
wire [31:0] mwa_d_51,mwa_i_51;
wire [31:0] mra_d_51,mra_i_51;
wire mwr_d_51,mwr_i_51;
*/

module tb_main;

	// Inputs
	reg clock;
	reg reset;
	reg [31:0] mrd_i;
	reg [31:0] mrd_d;

	// Outputs
	wire [31:0] mwd_i;
	wire [31:0] mra_i;
	wire [31:0] mwa_i;
	wire mwr_i;
	wire [31:0] mwd_d;
	wire [31:0] mra_d;
	wire [31:0] mwa_d;
	wire mwr_d;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clock(clock), 
		.reset(reset), 
		.mrd_i(mrd_i), 
		.mwd_i(mwd_i), 
		.mra_i(mra_i), 
		.mwa_i(mwa_i), 
		.mwr_i(mwr_i), 
		.mrd_d(mrd_d), 
		.mwd_d(mwd_d), 
		.mra_d(mra_d), 
		.mwa_d(mwa_d), 
		.mwr_d(mwr_d)
	);
	

ins_mem_51 m0(.clk_51(clock),.waddr_51(mwa_i),.wdata_51(mwd_i),.write_51(mwr_i),.raddr_51(mra_i),.rdata_51(mrd_i));

data_mem_51 m1(.clk_51(clock),.waddr_51(mwa_d),.wdata_51(mwd_d),.write_51(mwr_d),.raddr_51(mra_d),.rdata_51(mrd_d) );

initial
begin
clock = 1'b0;
forever #5 clock = ~clock;
end
initial
// Reset signal intiated.
begin
#2 reset = 1'b1;
#5 reset = 1'b0;
end
initial
begin
//$dumpfile ("proc.vcd");
//$dumpvars (0,proc_tb);
#2500 $finish;
end


	initial begin
		// Initialize Inputs
		//clock = 0;
		//reset = 0;
		mrd_i = 0;
		mrd_d = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

