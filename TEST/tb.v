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
//Instruction memory
// Making instruction memory, where instruction will be store.
module ins_mem_51(input clk_51,input [31:0] waddr_51,input [31:0] wdata_51, input write_51,input [31:0] raddr_51, output [31:0] rdata_51);
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
endmodule // Test bench:
// Test Bench for the given instructions:
//`include "mem_code.v"
//`include "ins_mem_51.v"
//`include "combine_proce.v"

module proc_tb();
reg clk_51,rst_51;
wire [31:0] mrd_d_51,mrd_i_51;
wire [31:0] mwd_d_51,mwd_i_51;
wire [31:0] mwa_d_51,mwa_i_51;
wire [31:0] mra_d_51,mra_i_51;
wire mwr_d_51,mwr_i_51;
//proc DUT(clk,rst,mrd_i,mwd_i,mra_i,mwa_i,mwr_i,mrd_d,mwd_d,mra_d,mwa_d,mwr_d);
proc DUT(clk_51,rst_51,mrd_i_51,mwd_i_51,mra_i_51,mwa_i_51,mwr_i_51,mrd_d_51,mwd_d_51,mra_d_51,mwa_d_51,mwr_d_51);
ins_mem_51 m0(.clk_51(clk_51),.waddr_51(mwa_i_51),.wdata_51(mwd_i_51),.write_51(mwr_i_51),.raddr_51(mra_i_51),.rdata_51(mrd_i_51));

data_mem_51 m1(.clk_51(clk_51),.waddr_51(mwa_d_51),.wdata_51(mwd_d_51),.write_51(mwr_d_51),.raddr_51(mra_d_51),.rdata_51(mrd_d_51) );
initial
begin
clk_51 = 1'b0;
forever #5 clk_51 = ~clk_51;
end
initial
// Reset signal intiated.
begin
#2 rst_51 = 1'b1;
#5 rst_51 = 1'b0;
end
initial
begin
//$dumpfile ("proc.vcd");
//$dumpvars (0,proc_tb);
#2500 $finish();
end
endmodule