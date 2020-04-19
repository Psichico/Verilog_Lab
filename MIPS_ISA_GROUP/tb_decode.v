`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:21:37 04/17/2020
// Design Name:   decode
// Module Name:   A:/Cloud/Git/Verilog_Lab/MIPS_ISA_GROUP/tb_decode.v
// Project Name:  MIPS_ISA_GROUP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decode
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_decode;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] ir;
	reg [31:0] pc_in;
	reg [31:0] r0;
	reg [31:0] r1;
	reg [31:0] r2;
	reg [31:0] r3;
	reg [31:0] r4;
	reg [31:0] r5;
	reg [31:0] r6;
	reg [31:0] r7;
	reg [31:0] r8;
	reg [31:0] r9;
	reg [31:0] r10;
	reg [31:0] r11;
	reg [31:0] r12;
	reg [31:0] r13;
	reg [31:0] r14;
	reg [31:0] r15;
	reg [31:0] r16;
	reg [31:0] r17;
	reg [31:0] r18;
	reg [31:0] r19;
	reg [31:0] r20;
	reg [31:0] r21;
	reg [31:0] r22;
	reg [31:0] r23;
	reg [31:0] r24;
	reg [31:0] r25;
	reg [31:0] r26;
	reg [31:0] r27;
	reg [31:0] r28;
	reg [31:0] r29;
	reg [31:0] r30;
	reg [31:0] r31;
	reg [31:0] r32;

	// Outputs
	wire [31:0] npc;
	wire pc_s;
	wire [31:0] sign_e;
	wire [31:0] a;
	wire [31:0] b;
	wire [5:0] opcode;
	wire [4:0] src;
	wire [4:0] target;
	wire [4:0] dest;

	// Instantiate the Unit Under Test (UUT)
	decode uut (
		.clk(clk), 
		.reset(reset), 
		.ir(ir), 
		.pc_in(pc_in), 
		.npc(npc), 
		.pc_s(pc_s), 
		.sign_e(sign_e), 
		.a(a), 
		.b(b), 
		.opcode(opcode), 
		.src(src), 
		.target(target), 
		.dest(dest), 
		.r0(r0), 
		.r1(r1), 
		.r2(r2), 
		.r3(r3), 
		.r4(r4), 
		.r5(r5), 
		.r6(r6), 
		.r7(r7), 
		.r8(r8), 
		.r9(r9), 
		.r10(r10), 
		.r11(r11), 
		.r12(r12), 
		.r13(r13), 
		.r14(r14), 
		.r15(r15), 
		.r16(r16), 
		.r17(r17), 
		.r18(r18), 
		.r19(r19), 
		.r20(r20), 
		.r21(r21), 
		.r22(r22), 
		.r23(r23), 
		.r24(r24), 
		.r25(r25), 
		.r26(r26), 
		.r27(r27), 
		.r28(r28), 
		.r29(r29), 
		.r30(r30), 
		.r31(r31), 
		.r32(r32)
	);

	always #2 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		ir = 0;
		pc_in = 0;
		r0 = 0;
		r1 = 0;
		r2 = 0;
		r3 = 0;
		r4 = 0;
		r5 = 0;
		r6 = 0;
		r7 = 0;
		r8 = 0;
		r9 = 0;
		r10 = 0;
		r11 = 0;
		r12 = 0;
		r13 = 0;
		r14 = 0;
		r15 = 0;
		r16 = 0;
		r17 = 0;
		r19 = 0;
		r18 = 0;
		r20 = 0;
		r21 = 0;
		r22 = 0;
		r23 = 0;
		r24 = 0;
		r25 = 0;
		r26 = 0;
		r27 = 0;
		r28 = 0;
		r29 = 0;
		r30 = 0;
		r31 = 0;
		r32 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		reset = 0;
		#50;
		ir = 32'b000001_00001_00001_00001_00000000000;
		#100;
		ir = 32'b000010_00001_00001_00001_00000000000;
		#100;
		$finish;
		// Add stimulus here

	end
      
endmodule

