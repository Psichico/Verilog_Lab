`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:50 04/18/2020 
// Design Name: 
// Module Name:    data_memory 
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
//Data memory
// Now making a Data memory where enrolment will be stored. It stores the data.
module data_mem_51(input clk_51,input [31:0] waddr_51,
input [31:0] wdata_51, input write_51,
input [31:0] raddr_51, output [31:0] rdata_51);
reg [31:0] mem_51[0:2000];
reg [31:0] rdata_51x;
wire [31:0] w0,w1,w2;
initial
begin
// Writing SJSU ID in the mem_51ory locations:
// SJSU ID: 010939851
// For 9 Digits 9 Location will be required
mem_51[26] = 32'h00000000; // Digit: 0(Decimal) = = = 0(Hex)
mem_51[30] = 32'h00000001; // Digit: 1(Decimal) = = = 1(Hex)
mem_51[34] = 32'h00000001; // Digit: 1(Decimal) = = = 1(Hex)
mem_51[38] = 32'h00000004; // Digit: 4(Decimal) = = = 4(Hex)
mem_51[42] = 32'h00000008; // Digit: 8(Decimal) = = = 8(Hex)
mem_51[46] = 32'h00000007; // Digit: 7(Decimal) = = = 7(Hex)
mem_51[50] = 32'h00000008; // Digit: 8(Decimal) = = = 8(Hex)
mem_51[54] = 32'h00000004; // Digit: 4(Decimal) = = = 4(Hex)
mem_51[58] = 32'h00000000; // Digit: 0(Decimal) = = = 0(Hex)
// Writing double of SJSU ID in the memory locations:

// SJSU ID: 0 1 0 9 3 9 8 5 1
// Double of it: 0 2 0 18 6 18 16 10 2
// For 9 Digits 9 Location will be required
mem_51[60] = 32'h00000000; // Digit: 0(Decimal) = = = 0(Hex)
mem_51[64] = 32'h00000002; // Digit: 2(Decimal) = = = 2(Hex)
mem_51[68] = 32'h00000002; // Digit: 2(Decimal) = = = 2(Hex)
mem_51[72] = 32'h00000008; // Digit: 8(Decimal) = = = 8(Hex)
mem_51[76] = 32'h00000010; // Digit: 16(Decimal) = = = 10(Hex)
mem_51[80] = 32'h0000000E; // Digit: 14(Decimal) = = = E(Hex)
mem_51[84] = 32'h00000010; // Digit: 16(Decimal) = = = 10(Hex)
mem_51[88] = 32'h00000008; // Digit: 8(Decimal) = = = 8(Hex)
mem_51[92] = 32'h00000000; // Digit: 0(Decimal) = = = 0(Hex)
end
assign rdata_51 = rdata_51x;
always @(*) begin
rdata_51x <= mem_51[raddr_51];
end
always @(posedge(clk_51)) begin
if(write_51) begin
mem_51[waddr_51]<=#2 wdata_51;
end
// $monitor (" mem_51 ----->>>> %d at time %t",mem_51[7],$realtime);
end
endmodule