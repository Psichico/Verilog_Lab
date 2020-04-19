`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:19:50 04/18/2020 
// Design Name: 
// Module Name:    instruction_memory 
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
//Instruction memory
// Making instruction memory, where instruction will be store.
module ins_mem_51(input clk_51,input [31:0] waddr_51,
input [31:0] wdata_51, input write_51,
input [31:0] raddr_51, output [31:0] rdata_51);
reg [31:0] mem_51[0:2000];
reg [31:0] rdatax_51;
wire [31:0] w0,w1,w2;
initial
begin
mem_51[0] = 32'h0000003F; //// nope
mem_51[4] = 32'h0000003F; //// nope
mem_51[8] = 32'h00800684; //// addi r2,avector,r0
mem_51[12] = 32'h00C00F04; //// addi r3,bvector,r0
mem_51[16] = 32'h01000284; //// r4,N,r0
mem_51[20] = 32'h0000003F; //// nope(ldw r4,0,r4)
mem_51[24] = 32'h000A0031; //// add r5,r0,r0
mem_51[28] = 32'h11800017; //// ldw r6,0,r2 LOOP STARTS FROM HERE
mem_51[32] = 32'h19C00017; //// ldw r7,0,r3
mem_51[36] = 32'h0000003F; //// nope
mem_51[51] = 32'h39900027; //// mul r8,r6,r7
mem_51[44] = 32'h414A0031; //// add r5,r5,r8
mem_51[48] = 32'h10800104; //// addi r2,r2,4
mem_51[52] = 32'h18C00104; //// addi r3,r3,4
mem_51[56] = 32'h2100005F; //// subi r4,r4,1
mem_51[60] = 32'h01000716; //// blt r0,r4,loop
mem_51[64] = 32'h0000003F; //// nope
mem_51[68] = 32'h01510115; //// stw r5,dotproduct(r0)
mem_51[72] = 32'h00000106; //// br stop Loop stops here

end
assign rdata_51 = rdatax_51;
always @(*) begin
rdatax_51 <= mem_51[raddr_51];
end
always @(posedge(clk_51)) begin
if(write_51) begin
mem_51[waddr_51]<=#2 wdata_51;
end
end
endmodule

