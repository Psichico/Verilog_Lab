`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:49:07 04/17/2020 
// Design Name: 
// Module Name:    execute 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module execute(clk,reset,a,b,sign_e,alu_out,alu_src,opcode,opcode_out,src,target,dest,src_out,target_out,dest_out);

input clk,reset;

input [31:0]a,b,sign_e;

output [31:0] alu_src;
output reg [31:0] alu_out;

input [5:0] opcode;

output [5:0] opcode_out;


input [4:0] src,dest,target;

output [4:0] src_out,dest_out,target_out;


parameter addu = 6'd1;
//parameter beq = 6'd2;
parameter lw = 6'd3;
parameter mult = 6'd4;
parameter addi = 6'd5;
//parameter j = 6'd6;
//parameter nop = 6'd7;
parameter call = 6'd8;
assign opcode_out = reset ? 0 : opcode;

assign src_out = reset ? 0 : src;

assign target_out = reset ? 0 : target;

assign dest_out = reset ? 0 : dest;

assign alu_src = reset ? 0 : b;



	always@(*)
		begin
		
		if(reset)begin	
			
			alu_out = 0;
	
			end
		else begin
		
			case(opcode)
				
				addu: alu_out = a+b;
				lw: alu_out = a + sign_e;
				mult: alu_out = a *b;
				addi: alu_out = a + sign_e;
				call: alu_out = b;

			endcase
		end
	end
endmodule
 
			













