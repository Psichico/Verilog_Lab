`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:23 04/16/2020 
// Design Name: 
// Module Name:    fetch 
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

module fetch (clk,reset,inst_a,inst_r,ir, pc_i,npc,pc_s);


input clk, reset; //well I dont need to explain this
input [31:0]pc_i; //specific program counter address used for branch and jump
input [31:0] inst_r; // instruction read(fetched) from memory
input pc_s; //this is program counter selection line. If we have specific program counter address other than sequence it will be 1 used for branch and jump

output reg [31:0]npc; //next address for program counter
output reg [31:0] inst_a; //,this is the instruction address that the program counter will have
output [31:0] ir; //instruction register

reg [31:0]tmp_pc; //this is for updating program counter


assign ir = inst_r; // This will transfer instruction read from memory to instruction register which will give it to controller

always @ (posedge clk or posedge reset)
begin

	if(reset)begin
		tmp_pc <= 0; 
	end
	
	else begin

		tmp_pc <= pc_s ? pc_i : tmp_pc;// so if we have any branch or jump instruction pc_s will be high and the location of branch instruction in pc_i will be given in tmp_pc or else normal sequential pc
		inst_a <= reset ? 32'bz : tmp_pc; //this is the instruction address that program counter will store to fetch instruction from memory. 
		tmp_pc <= tmp_pc + 4; //next pc 
		npc 	 <= pc_s?pc_i : tmp_pc; //next pc depends on pc_s if it is high that means we have special instruction branch or jump or else the updated pc. 

	end

end

endmodule

