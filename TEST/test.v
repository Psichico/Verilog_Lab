// 1st Stage of Pipeline: // ************* Fetch Stage*************
module fetch(clk_51,rst_51,mra_i_51,mrd_i_51,PC_in_51,NPC_51,IR_51,PC_sel_51);
input clk_51,rst_51;
input PC_sel_51; // used to select new pc line or not
input [31:0] mrd_i_51; // memory instruction read
input [31:0] PC_in_51; // PC data initiated
output reg [31:0] NPC_51; // After execution Next PC will be stored in this reg.
output reg [31:0]mra_i_51;
output [31:0] IR_51; // Instruction of 32 bit is stored in IR register
reg [31:0] PC; //PC will have current instruction memory location.
// Instructions from code memory will be stored in IR re
assign IR_51 = mrd_i_51;
// On reset pc will be have value 0 so the execution will start from first memory location.
always @(posedge clk_51 or posedge rst_51)
begin
if(rst_51)
begin
PC = 0;
end
else
begin
PC = PC_sel_51 ? PC_in_51 : PC;
mra_i_51 = rst_51 ? 32'bz :PC;
// Each of the instruction are at 4 bit difference to each other
PC = PC + 4;
NPC_51 = PC_sel_51 ? PC_in_51 : PC;
//$display("Instruction in the first stage: %b",IR_51);
end
end
endmodule
// 2nd Stage of Pipeline: // *************Decode Stage************* //
//This stage will decode all the instructions and
//Get the opcode out which will control whole the execution Module
module decode(clk_51,rst_51,IR_51,PC_51,a_51,b_51,NPC_51,PC_sel_51,sign_ext_51,opcode_51,src_reg_51,dest_reg_51,targ_reg_51,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31);
input clk_51,rst_51;
input [31:0] IR_51;
input [31:0] PC_51;
output reg [31:0] a_51,b_51;
output reg [31:0] NPC_51;
output reg PC_sel_51;
output reg [31:0] sign_ext_51;

output [5:0] opcode_51;
output [5:0] src_reg_51;
output [5:0] dest_reg_51;
output [5:0] targ_reg_51;
// These registers are from register bank which will store all execution val
// These 32 registers will require 5 memory locations.
input [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
input [31:0] r10,r11,r12,r13,r14,r15,r16,r17,r18,r19;
input [31:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29;
input [31:0] r30,r31;
// 5 wire pair is used to access each of the registers
wire [5:0] acce;
//. Each of the regs are stored with specific parameter which defines it's //memory locations
parameter R0 = 5'b00000;
parameter R1 = 5'b00001;
parameter R2 = 5'b00010;
parameter R3 = 5'b00011;
parameter R4 = 5'b00100;
parameter R5 = 5'b00101;
parameter R6 = 5'b00110;
parameter R7 = 5'b00111;
parameter R8 = 5'b01000;
parameter R9 = 5'b01001;
parameter R10 = 5'b01010;
parameter R11 = 5'b01011;
parameter R12 = 5'b01100;
parameter R13 = 5'b01101;
parameter R14 = 5'b01110;
parameter R15 = 5'b01111;
parameter R16 = 5'b10000;
parameter R17 = 5'b10001;
parameter R18 = 5'b10010;
parameter R19 = 5'b10011;
parameter R20 = 5'b10100;
parameter R21 = 5'b10101;
parameter R22 = 5'b10110;
parameter R23 = 5'b10111;
parameter R24 = 5'b11000;
parameter R25 = 5'b11001;
parameter R26 = 5'b11010;
parameter R27 = 5'b11011;
parameter R28 = 5'b11100;
parameter R29 = 5'b11101;
parameter R30 = 5'b11110;
parameter R31 = 5'b11111;
// Each of the MIPS instructions are have predefined 6-bit hex code //which is written below
parameter ADD = 6'b110001;// for adding two regs and stores value reg
parameter LDW = 6'b010111;// load data from memory to reg
parameter MUL = 6'b100111;// multiply two regs
parameter BLT = 6'b010110;// it will branch if less than other one
parameter STW = 6'b010101;// stores data from reg to mem
parameter BR = 6'b000110;// unconditional branch
parameter ADDI = 6'b000100;// addition of immediate data to reg

parameter BEQ = 6'b100110;// Branch if the values are equal
parameter NOPE = 6'b111111;// special instruction which do no operation

assign opcode_51 = rst_51 ? 6'b000000 : IR_51[5:0];
assign src_reg_51 = rst_51 ? 5'b000000 : IR_51[31:27];
assign dest_reg_51 = rst_51 ? 5'b000000 : IR_51[26:22];
assign targ_reg_51 = rst_51 ? 5'b000000 : IR_51[21:17];
assign j = rst_51 ? 5'b000000 : IR_51[16:11];
always @(*)
begin
if(rst_51)
begin
NPC_51 = 0;
PC_sel_51 = 0;
sign_ext_51 = 0;
a_51= 0;
b_51= 0;
end
// According to each individual instructions each of the temp regs assigned values.
else
begin
PC_sel_51 = 1'b0;
case(opcode_51)
ADD:
begin
// Value for the source reg stored in src
case(src_reg_51)
R0 : a_51 = r0;
R1 : a_51 = r1;
R2 : a_51 = r2;
R3 : a_51 = r3;
R4 : a_51 = r4;
R5 : a_51 = r5;
R6 : a_51 = r6;
R7 : a_51 = r7;
R8 : a_51 = r8;
R9 : a_51 = r9;
R10 : a_51 = r10;
R11 : a_51 = r11;
R12 : a_51 = r12;
R13 : a_51 = r13;
R14 : a_51 = r14;
R15 : a_51 = r15;
R16 : a_51 = r16;
R17 : a_51 = r17;
R18 : a_51 = r18;
R19 : a_51 = r19;
R20 : a_51 = r20;
R21 : a_51 = r21;
R22 : a_51 = r22;
R23 : a_51 = r23;
R24 : a_51 = r24;
R25 : a_51 = r25;
R26 : a_51 = r26;
R27 : a_51 = r27;

R28 : a_51 = r28;
R29 : a_51 = r29;
R30 : a_51 = r30;
R31 : a_51 = r31;
endcase
// Destination which is stored in b
case(dest_reg_51)
R0 : b_51 = r0;
R1 : b_51 = r1;
R2 : b_51 = r2;
R3 : b_51 = r3;
R4 : b_51 = r4;
R5 : b_51 = r5;
R6 : b_51 = r6;
R7 : b_51 = r7;
R8 : b_51 = r8;
R9 : b_51 = r9;
R10 : b_51 = r10;
R11 : b_51 = r11;
R12 : b_51 = r12;
R13 : b_51 = r13;
R14 : b_51 = r14;
R15 : b_51 = r15;
R16 : b_51 = r16;
R17 : b_51 = r17;
R18 : b_51 = r18;
R19 : b_51 = r19;
R20 : b_51 = r20;
R21 : b_51 = r21;
R22 : b_51 = r22;
R23 : b_51 = r23;
R24 : b_51 = r24;
R25 : b_51 = r25;
R26 : b_51 = r26;
R27 : b_51 = r27;
R28 : b_51 = r28;
R29 : b_51 = r29;
R30 : b_51 = r30;
R31 : b_51 = r31;
endcase
end
LDW:
begin
case(src_reg_51)
R0 : a_51 = r0;
R1 : a_51 = r1;
R2 : a_51 = r2;
R3 : a_51 = r3;
R4 : a_51 = r4;
R5 : a_51 = r5;
R6 : a_51 = r6;
R7 : a_51 = r7;
R8 : a_51 = r8;
R9 : a_51 = r9;
R10 : a_51 = r10;
R11 : a_51 = r11;

R12 : a_51 = r12;
R13 : a_51 = r13;
R14 : a_51 = r14;
R15 : a_51 = r15;
R16 : a_51 = r16;
R17 : a_51 = r17;
R18 : a_51 = r18;
R19 : a_51 = r19;
R20 : a_51 = r20;
R21 : a_51 = r21;
R22 : a_51 = r22;
R23 : a_51 = r23;
R24 : a_51 = r24;
R25 : a_51 = r25;
R26 : a_51 = r26;
R27 : a_51 = r27;
R28 : a_51 = r28;
R29 : a_51 = r29;
R30 : a_51 = r30;
R31 : a_51 = r31;
endcase
sign_ext_51 = IR_51[21] ? {16'hFFFF,IR_51[21:6]} : {16'h0000,IR_51[21:6]};
end
MUL:
begin
case(src_reg_51)
R0 : a_51 = r0;
R1 : a_51 = r1;
R2 : a_51 = r2;
R3 : a_51 = r3;
R4 : a_51 = r4;
R5 : a_51 = r5;
R6 : a_51 = r6;
R7 : a_51 = r7;
R8 : a_51 = r8;
R9 : a_51 = r9;
R10 : a_51 = r10;
R11 : a_51 = r11;
R12 : a_51 = r12;
R13 : a_51 = r13;
R14 : a_51 = r14;
R15 : a_51 = r15;
R16 : a_51 = r16;
R17 : a_51 = r17;
R18 : a_51 = r18;
R19 : a_51 = r19;
R20 : a_51 = r20;
R21 : a_51 = r21;
R22 : a_51 = r22;
R23 : a_51 = r23;
R24 : a_51 = r24;
R25 : a_51 = r25;
R26 : a_51 = r26;
R27 : a_51 = r27;
R28 : a_51 = r28;
R29 : a_51 = r29;
R30 : a_51 = r30;
R31 : a_51 = r31;
endcase

case(dest_reg_51)
R0 : b_51 = r0;
R1 : b_51 = r1;
R2 : b_51 = r2;
R3 : b_51 = r3;
R4 : b_51 = r4;
R5 : b_51 = r5;
R6 : b_51 = r6;
R7 : b_51 = r7;
R8 : b_51 = r8;
R9 : b_51 = r9;
R10 : b_51 = r10;
R11 : b_51 = r11;
R12 : b_51 = r12;
R13 : b_51 = r13;
R14 : b_51 = r14;
R15 : b_51 = r15;
R16 : b_51 = r16;
R17 : b_51 = r17;
R18 : b_51 = r18;
R19 : b_51 = r19;
R20 : b_51 = r20;
R21 : b_51 = r21;
R22 : b_51 = r22;
R23 : b_51 = r23;
R24 : b_51 = r24;
R25 : b_51 = r25;
R26 : b_51 = r26;
R27 : b_51 = r27;
R28 : b_51 = r28;
R29 : b_51 = r29;
R30 : b_51 = r30;
R31 : b_51 = r31;
endcase
end
BLT:
begin
case(src_reg_51)
R0 : a_51 = r0;
R1 : a_51 = r1;
R2 : a_51 = r2;
R3 : a_51 = r3;
R4 : a_51 = r4;
R5 : a_51 = r5;
R6 : a_51 = r6;
R7 : a_51 = r7;
R8 : a_51 = r8;
R9 : a_51 = r9;
R10 : a_51 = r10;
R11 : a_51 = r11;
R12 : a_51 = r12;
R13 : a_51 = r13;
R14 : a_51 = r14;
R15 : a_51 = r15;
R16 : a_51 = r16;
R17 : a_51 = r17;
R18 : a_51 = r18;
R19 : a_51 = r19;
R20 : a_51 = r20;

R21 : a_51 = r21;
R22 : a_51 = r22;
R23 : a_51 = r23;
R24 : a_51 = r24;
R25 : a_51 = r25;
R26 : a_51 = r26;
R27 : a_51 = r27;
R28 : a_51 = r28;
R29 : a_51 = r29;
R30 : a_51 = r30;
R31 : a_51 = r31;
endcase
case(dest_reg_51)
R0 : b_51 = r0;
R1 : b_51 = r1;
R2 : b_51 = r2;
R3 : b_51 = r3;
R4 : b_51 = r4;
R5 : b_51 = r5;
R6 : b_51 = r6;
R7 : b_51 = r7;
R8 : b_51 = r8;
R9 : b_51 = r9;
R10 : b_51 = r10;
R11 : b_51 = r11;
R12 : b_51 = r12;
R13 : b_51 = r13;
R14 : b_51 = r14;
R15 : b_51 = r15;
R16 : b_51 = r16;
R17 : b_51 = r17;
R18 : b_51 = r18;
R19 : b_51 = r19;
R20 : b_51 = r20;
R21 : b_51 = r21;
R22 : b_51 = r22;
R23 : b_51 = r23;
R24 : b_51 = r24;
R25 : b_51 = r25;
R26 : b_51 = r26;
R27 : b_51 = r27;
R28 : b_51 = r28;
R29 : b_51 = r29;
R30 : b_51 = r30;
R31 : b_51 = r31;
endcase
sign_ext_51 = IR_51[21] ? {16'hFFFF,IR_51[21:6]} : {16'h0000,IR_51[21:6]};
NPC_51 = (a_51<b_51) ? (PC_51 - sign_ext_51) : PC_51;
PC_sel_51 = 1'b1;
end
STW:
begin
case(src_reg_51)
R0 : a_51 = r0;
R1 : a_51 = r1;
R2 : a_51 = r2;
R3 : a_51 = r3;
R4 : a_51 = r4;
R5 : a_51 = r5;

R6 : a_51 = r6;
R7 : a_51 = r7;
R8 : a_51 = r8;
R9 : a_51 = r9;
R10 : a_51 = r10;
R11 : a_51 = r11;
R12 : a_51 = r12;
R13 : a_51 = r13;
R14 : a_51 = r14;
R15 : a_51 = r15;
R16 : a_51 = r16;
R17 : a_51 = r17;
R18 : a_51 = r18;
R19 : a_51 = r19;
R20 : a_51 = r20;
R21 : a_51 = r21;
R22 : a_51 = r22;
R23 : a_51 = r23;
R24 : a_51 = r24;
R25 : a_51 = r25;
R26 : a_51 = r26;
R27 : a_51 = r27;
R28 : a_51 = r28;
R29 : a_51 = r29;
R30 : a_51 = r30;
R31 : a_51 = r31;
endcase
case(dest_reg_51)
R0 : b_51 = r0;
R1 : b_51 = r1;
R2 : b_51 = r2;
R3 : b_51 = r3;
R4 : b_51 = r4;
R5 : b_51 = r5;
R6 : b_51 = r6;
R7 : b_51 = r7;
R8 : b_51 = r8;
R9 : b_51 = r9;
R10 : b_51 = r10;
R11 : b_51 = r11;
R12 : b_51 = r12;
R13 : b_51 = r13;
R14 : b_51 = r14;
R15 : b_51 = r15;
R16 : b_51 = r16;
R17 : b_51 = r17;
R18 : b_51 = r18;
R19 : b_51 = r19;
R20 : b_51 = r20;
R21 : b_51 = r21;
R22 : b_51 = r22;
R23 : b_51 = r23;
R24 : b_51 = r24;
R25 : b_51 = r25;
R26 : b_51 = r26;
R27 : b_51 = r27;
R28 : b_51 = r28;
R29 : b_51 = r29;
R30 : b_51 = r30;

R31 : b_51 = r31;
endcase
sign_ext_51 = IR_51[21] ? {16'hFFFF,IR_51[21:6]} : {16'h0000,IR_51[21:6]};
end
BR:
begin
sign_ext_51 = IR_51[21] ? {16'hFFFF,IR_51[21:6]} : {16'h0000,IR_51[21:6]};
NPC_51 = PC_51 - sign_ext_51;
PC_sel_51 = 1'b1;
end
ADDI:
begin
case(src_reg_51)
R0 : a_51 = r0;
R1 : a_51 = r1;
R2 : a_51 = r2;
R3 : a_51 = r3;
R4 : a_51 = r4;
R5 : a_51 = r5;
R6 : a_51 = r6;
R7 : a_51 = r7;
R8 : a_51 = r8;
R9 : a_51 = r9;
R10 : a_51 = r10;
R11 : a_51 = r11;
R12 : a_51 = r12;
R13 : a_51 = r13;
R14 : a_51 = r14;
R15 : a_51 = r15;
R16 : a_51 = r16;
R17 : a_51 = r17;
R18 : a_51 = r18;
R19 : a_51 = r19;
R20 : a_51 = r20;
R21 : a_51 = r21;
R22 : a_51 = r22;
R23 : a_51 = r23;
R24 : a_51 = r24;
R25 : a_51 = r25;
R26 : a_51 = r26;
R27 : a_51 = r27;
R28 : a_51 = r28;
R29 : a_51 = r29;
R30 : a_51 = r30;
R31 : a_51 = r31;
endcase
sign_ext_51 = IR_51[21] ? {16'hFFFF,IR_51[21:6]} : {16'h0000,IR_51[21:6]};
end
BEQ :
begin
case(src_reg_51)
R0 : a_51 = r0;
R1 : a_51 = r1;
R2 : a_51 = r2;
R3 : a_51 = r3;
R4 : a_51 = r4;
R5 : a_51 = r5;
R6 : a_51 = r6;
R7 : a_51 = r7;
R8 : a_51 = r8;
R9 : a_51 = r9;
R10 : a_51 = r10;
R11 : a_51 = r11;
R12 : a_51 = r12;
R13 : a_51 = r13;
R14 : a_51 = r14;
R15 : a_51 = r15;
R16 : a_51 = r16;
R17 : a_51 = r17;
R18 : a_51 = r18;
R19 : a_51 = r19;
R20 : a_51 = r20;
R21 : a_51 = r21;
R22 : a_51 = r22;
R23 : a_51 = r23;
R24 : a_51 = r24;
R25 : a_51 = r25;
R26 : a_51 = r26;
R27 : a_51 = r27;
R28 : a_51 = r28;
R29 : a_51 = r29;
R30 : a_51 = r30;
R31 : a_51 = r31;
endcase
case(dest_reg_51)
R0 : b_51 = r0;
R1 : b_51 = r1;
R2 : b_51 = r2;
R3 : b_51 = r3;
R4 : b_51 = r4;
R5 : b_51 = r5;
R6 : b_51 = r6;
R7 : b_51 = r7;
R8 : b_51 = r8;
R9 : b_51 = r9;
R10 : b_51 = r10;
R11 : b_51 = r11;
R12 : b_51 = r12;
R13 : b_51 = r13;
R14 : b_51 = r14;
R15 : b_51 = r15;
R16 : b_51 = r16;
R17 : b_51 = r17;
R18 : b_51 = r18;
R19 : b_51 = r19;
R20 : b_51 = r20;
R21 : b_51 = r21;
R22 : b_51 = r22;
R23 : b_51 = r23;
R24 : b_51 = r24;
R25 : b_51 = r25;
R26 : b_51 = r26;
R27 : b_51 = r27;
R28 : b_51 = r28;
R29 : b_51 = r29;
R30 : b_51 = r30;
R31 : b_51 = r31;
endcase

sign_ext_51 = IR_51[21] ? {16'hFFFF,IR_51[21:6]} : {16'h0000,IR_51[21:6]};
NPC_51 = (a_51==b_51) ? (PC_51 - sign_ext_51) : PC_51;
PC_sel_51 = (a_51==b_51) ? 1'b1 : 1'b0;
end
// Nope is special instruction which is used to put memory stall cycles
// It will avoid possible hazards
NOPE:
begin
end
endcase
end
end
endmodule
// During this stage acc to instruction execution takes place.
// 3rd Stage of Pipeline: // ************* Execution Stage*************
module execute(clk_51,rst_51,opcode_51,a_51,b_51,sign_ext_51,alu_out_51,alu_src_51,opcode_out_51,src_reg_51,dest_reg_51, targ_reg_51,src_reg_out_51,dest_reg_out_51,targ_reg_out_51);

parameter R0 = 5'b00000;
parameter R1 = 5'b00001;
parameter R2 = 5'b00010;
parameter R3 = 5'b00011;
parameter R4 = 5'b00100;
parameter R5 = 5'b00101;
parameter R6 = 5'b00110;
parameter R7 = 5'b00111;
parameter R8 = 5'b01000;
parameter R9 = 5'b01001;
parameter R10 = 5'b01010;
parameter R11 = 5'b01011;
parameter R12 = 5'b01100;
parameter R13 = 5'b01101;
parameter R14 = 5'b01110;
parameter R15 = 5'b01111;
parameter R16 = 5'b10000;
parameter R17 = 5'b10001;
parameter R18 = 5'b10010;
parameter R19 = 5'b10011;
parameter R20 = 5'b10100;
parameter R21 = 5'b10101;
parameter R22 = 5'b10110;
parameter R23 = 5'b10111;
parameter R24 = 5'b11000;
parameter R25 = 5'b11001;
parameter R26 = 5'b11010;
parameter R27 = 5'b11011;
parameter R28 = 5'b11100;
parameter R29 = 5'b11101;
parameter R30 = 5'b11110;
parameter R31 = 5'b11111;
// Each of the MIPS instructions are have predefined 6-bit hex code //which is written below
parameter ADD = 6'b110001;// for adding two regs and stores value reg
parameter LDW = 6'b010111;// load data from memory to reg
parameter MUL = 6'b100111;// multiply two regs
parameter BLT = 6'b010110;// it will branch if less than other one
parameter STW = 6'b010101;// stores data from reg to mem
parameter BR = 6'b000110;// unconditional branch
parameter ADDI = 6'b000100;// addition of immediate data to reg

parameter BEQ = 6'b100110;// Branch if the values are equal
parameter NOPE = 6'b111111;// special instruction which do no operation




input clk_51,rst_51;
input [5:0] opcode_51;
input [5:0] src_reg_51,dest_reg_51,targ_reg_51;
input [31:0] a_51,b_51,sign_ext_51;
output [5:0] opcode_out_51;
output reg [31:0] alu_out_51;
output [31:0] alu_src_51;
output [5:0] src_reg_out_51,dest_reg_out_51,targ_reg_out_51;
// If reset is found assigning value to 0
assign opcode_out_51 = rst_51 ? 0 : opcode_51;
assign src_reg_51_out = rst_51 ? 0 : src_reg_51;
assign dest_reg_out_51 = rst_51 ? 0 : dest_reg_51;
assign targ_reg_out_51 = rst_51 ? 0 : targ_reg_51;
assign alu_src_51 = rst_51 ? 0 : b_51;

always @ (*)
begin
#0;
if(rst_51)
begin
alu_out_51 = 0;
end
else
begin
case(opcode_51)
// According to various inst various execution takes place.
ADD : alu_out_51 = a_51 + b_51;
LDW : alu_out_51 = a_51 + sign_ext_51;
MUL : alu_out_51 = a_51 * b_51;
STW : alu_out_51 = a_51 + sign_ext_51;

ADDI: alu_out_51 = a_51 + sign_ext_51;
SUBI: alu_out_51 = a_51 - sign_ext_51;
CALL: alu_out_51 = b_51;
endcase
end
end
endmodule
// 4th Stage of Pipeline: // ************* Memory write ************* // During this stage memory will be accessed
//and data transfer from reg to mem // take place

module memory_write(clk_51,rst_51,opcode_51,src_reg_51,dest_reg_51,targ_reg_51,alu_out_51,alu_src_51,mem_out1_51,mem_out2_51,opcode_out_51,src_reg_out_51,dest_reg_out_51,targ_reg_out_51,mwr_d_51,mwd_d_51,mwa_d_51,mra_d_51, mrd_d_51,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31);

input clk_51,rst_51;
input [5:0] opcode_51;
input [5:0] src_reg_51,dest_reg_51,targ_reg_51;
input [31:0] alu_out_51,alu_src_51;
input [31:0] mrd_d_51;
output reg [31:0]mem_out1_51;
output [31:0] mem_out2_51;
output [5:0] opcode_out_51;
output [5:0] src_reg_out_51,dest_reg_out_51,targ_reg_out_51;
output reg [31:0] mra_d_51;
output reg [31:0] mwd_d_51,mwa_d_51;
output reg mwr_d_51;
// Each regs are intiated
input [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
// Each regs are intiated
input [31:0] r10,r11,r12,r13,r14,r15,r16,r17,r18,r19;
// Each regs are intiated
input [31:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29;
input [31:0] r30,r31;
assign opcode_out_51 = rst_51 ? 5'b0 : opcode_51;
assign src_reg_out_51 = rst_51 ? 5'b0 : src_reg_51;
assign dest_reg_out_51 = rst_51 ? 5'b0 : dest_reg_51;
assign targ_reg_out_51 = rst_51 ? 5'b0 : targ_reg_51;
assign mem_out2_51 = rst_51 ? 5'b0 : alu_src_51;
always @(*)
begin
if(rst_51)
begin
mem_out1_51 = 0;
end
else
begin
mwr_d_51 = 1'b0;
case(opcode_51)
LDW :
begin
mra_d_51 = alu_out_51;

mem_out1_51 = mrd_d_51;
end
STW:
begin
mwd_d_51 = alu_src_51;
mwa_d_51 = alu_out_51;
mwr_d_51 = 1'b1;
end
default : mem_out1_51 = alu_out_51;
endcase
end
end
endmodule
// During this stage data from the memory or reg will be transferred back to reg file.
// 5th Stage of Pipeline: // ************* Write Back Stage*************
module rw(clk_51,rst_51,opcode_51,src_reg_51,dest_reg_51,targ_reg_51,mem_out1_51,mem_out2_51,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19, r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31);



parameter R0 = 5'b00000;
parameter R1 = 5'b00001;
parameter R2 = 5'b00010;
parameter R3 = 5'b00011;
parameter R4 = 5'b00100;
parameter R5 = 5'b00101;
parameter R6 = 5'b00110;
parameter R7 = 5'b00111;
parameter R8 = 5'b01000;
parameter R9 = 5'b01001;
parameter R10 = 5'b01010;
parameter R11 = 5'b01011;
parameter R12 = 5'b01100;
parameter R13 = 5'b01101;
parameter R14 = 5'b01110;
parameter R15 = 5'b01111;
parameter R16 = 5'b10000;
parameter R17 = 5'b10001;
parameter R18 = 5'b10010;
parameter R19 = 5'b10011;
parameter R20 = 5'b10100;
parameter R21 = 5'b10101;
parameter R22 = 5'b10110;
parameter R23 = 5'b10111;
parameter R24 = 5'b11000;
parameter R25 = 5'b11001;
parameter R26 = 5'b11010;
parameter R27 = 5'b11011;
parameter R28 = 5'b11100;
parameter R29 = 5'b11101;
parameter R30 = 5'b11110;
parameter R31 = 5'b11111;
// Each of the MIPS instructions are have predefined 6-bit hex code //which is written below
parameter ADD = 6'b110001;// for adding two regs and stores value reg
parameter LDW = 6'b010111;// load data from memory to reg
parameter MUL = 6'b100111;// multiply two regs
parameter BLT = 6'b010110;// it will branch if less than other one
parameter STW = 6'b010101;// stores data from reg to mem
parameter BR = 6'b000110;// unconditional branch
parameter ADDI = 6'b000100;// addition of immediate data to reg

parameter BEQ = 6'b100110;// Branch if the values are equal
parameter NOPE = 6'b111111;// special instruction which do no operation








input clk_51,rst_51;
input [5:0] opcode_51;
input [5:0] src_reg_51,dest_reg_51,targ_reg_51;
input [31:0] mem_out1_51,mem_out2_51;
// initiating 32 bit regs
output reg [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
output reg [31:0] r10,r11,r12,r13,r14,r15,r16,r17,r18,r19;
output reg [31:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29;
output reg [31:0] r30,r31;
// if reset in set to 1 all the values will be transferred to 0
initial
begin
r0 = 0;
r1 = 0;
r2 = 0;
r3 = 0;
r4 = 3;
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
r18 = 0;
r19 = 0;
r20 = 0;
r21 = 0;

r22 = 0;
r23 = 0;
r24 = 0;
r25 = 0;
r26 = 0;
r27 = 0;
r28 = 0;
r29 = 32'h00000051;
r30 = 150;
r31 = 190;
end
always @(*)
begin
case(opcode_51)
ADD:
begin
case(targ_reg_51)
R0 : r0 = mem_out1_51;
R1 : r1 = mem_out1_51;
R2 : r2 = mem_out1_51;
R3 : r3 = mem_out1_51;
R4 : r4 = mem_out1_51;
R5 : r5 = mem_out1_51;
R6 : r6 = mem_out1_51;
R7 : r7 = mem_out1_51;
R8 : r8 = mem_out1_51;
R9 : r9 = mem_out1_51;
R10 : r10 = mem_out1_51;
R11 : r11 = mem_out1_51;
R12 : r12 = mem_out1_51;
R13 : r13 = mem_out1_51;
R14 : r14 = mem_out1_51;
R15 : r15 = mem_out1_51;
R16 : r16 = mem_out1_51;
R17 : r17 = mem_out1_51;
R18 : r18 = mem_out1_51;
R19 : r19 = mem_out1_51;
R20 : r20 = mem_out1_51;
R21 : r21 = mem_out1_51;
R22 : r22 = mem_out1_51;
R23 : r23 = mem_out1_51;
R24 : r24 = mem_out1_51;
R25 : r25 = mem_out1_51;
R26 : r26 = mem_out1_51;
R27 : r27 = mem_out1_51;
R28 : r28 = mem_out1_51;
R29 : r29 = mem_out1_51;
R30 : r30 = mem_out1_51;
R31 : r31 = mem_out1_51;
endcase
end
LDW:
begin
case(dest_reg_51)
R0 : r0 = mem_out1_51;
R1 : r1 = mem_out1_51;
R2 : r2 = mem_out1_51;
R3 : r3 = mem_out1_51;
R4 : r4 = mem_out1_51;

R5 : r5 = mem_out1_51;
R6 : r6 = mem_out1_51;
R7 : r7 = mem_out1_51;
R8 : r8 = mem_out1_51;
R9 : r9 = mem_out1_51;
R10 : r10 = mem_out1_51;
R11 : r11 = mem_out1_51;
R12 : r12 = mem_out1_51;
R13 : r13 = mem_out1_51;
R14 : r14 = mem_out1_51;
R15 : r15 = mem_out1_51;
R16 : r16 = mem_out1_51;
R17 : r17 = mem_out1_51;
R18 : r18 = mem_out1_51;
R19 : r19 = mem_out1_51;
R20 : r20 = mem_out1_51;
R21 : r21 = mem_out1_51;
R22 : r22 = mem_out1_51;
R23 : r23 = mem_out1_51;
R24 : r24 = mem_out1_51;
R25 : r25 = mem_out1_51;
R26 : r26 = mem_out1_51;
R27 : r27 = mem_out1_51;
R28 : r28 = mem_out1_51;
R29 : r29 = mem_out1_51;
R30 : r30 = mem_out1_51;
R31 : r31 = mem_out1_51;
endcase
end
MUL:
begin
case(targ_reg_51)
R0 : r0 = mem_out1_51;
R1 : r1 = mem_out1_51;
R2 : r2 = mem_out1_51;
R3 : r3 = mem_out1_51;
R4 : r4 = mem_out1_51;
R5 : r5 = mem_out1_51;
R6 : r6 = mem_out1_51;
R7 : r7 = mem_out1_51;
R8 : r8 = mem_out1_51;
R9 : r9 = mem_out1_51;
R10 : r10 = mem_out1_51;
R11 : r11 = mem_out1_51;
R12 : r12 = mem_out1_51;
R13 : r13 = mem_out1_51;
R14 : r14 = mem_out1_51;
R15 : r15 = mem_out1_51;
R16 : r16 = mem_out1_51;
R17 : r17 = mem_out1_51;
R18 : r18 = mem_out1_51;
R19 : r19 = mem_out1_51;
R20 : r20 = mem_out1_51;
R21 : r21 = mem_out1_51;
R22 : r22 = mem_out1_51;
R23 : r23 = mem_out1_51;
R24 : r24 = mem_out1_51;
R25 : r25 = mem_out1_51;
R26 : r26 = mem_out1_51;

R27 : r27 = mem_out1_51;
R28 : r28 = mem_out1_51;
R29 : r29 = mem_out1_51;
R30 : r30 = mem_out1_51;
R31 : r31 = mem_out1_51;
endcase
end
ADDI:
begin
case(dest_reg_51)
R0 : r0 = mem_out1_51;
R1 : r1 = mem_out1_51;
R2 : r2 = mem_out1_51;
R3 : r3 = mem_out1_51;
R4 : r4 = mem_out1_51;
R5 : r5 = mem_out1_51;
R6 : r6 = mem_out1_51;
R7 : r7 = mem_out1_51;
R8 : r8 = mem_out1_51;
R9 : r9 = mem_out1_51;
R10 : r10 = mem_out1_51;
R11 : r11 = mem_out1_51;
R12 : r12 = mem_out1_51;
R13 : r13 = mem_out1_51;
R14 : r14 = mem_out1_51;
R15 : r15 = mem_out1_51;
R16 : r16 = mem_out1_51;
R17 : r17 = mem_out1_51;
R18 : r18 = mem_out1_51;
R19 : r19 = mem_out1_51;
R20 : r20 = mem_out1_51;
R21 : r21 = mem_out1_51;
R22 : r22 = mem_out1_51;
R23 : r23 = mem_out1_51;
R24 : r24 = mem_out1_51;
R25 : r25 = mem_out1_51;
R26 : r26 = mem_out1_51;
R27 : r27 = mem_out1_51;
R28 : r28 = mem_out1_51;
R29 : r29 = mem_out1_51;
R30 : r30 = mem_out1_51;
R31 : r31 = mem_out1_51;
endcase
end
CALL :
begin
r31 = mem_out2_51;
end
SUBI:
begin
case(dest_reg_51)
R0 : r0 = mem_out1_51;
R1 : r1 = mem_out1_51;
R2 : r2 = mem_out1_51;
R3 : r3 = mem_out1_51;
R4 : r4 = mem_out1_51;
R5 : r5 = mem_out1_51;
R6 : r6 = mem_out1_51;
R7 : r7 = mem_out1_51;

R8 : r8 = mem_out1_51;
R9 : r9 = mem_out1_51;
R10 : r10 = mem_out1_51;
R11 : r11 = mem_out1_51;
R12 : r12 = mem_out1_51;
R13 : r13 = mem_out1_51;
R14 : r14 = mem_out1_51;
R15 : r15 = mem_out1_51;
R16 : r16 = mem_out1_51;
R17 : r17 = mem_out1_51;
R18 : r18 = mem_out1_51;
R19 : r19 = mem_out1_51;
R20 : r20 = mem_out1_51;
R21 : r21 = mem_out1_51;
R22 : r22 = mem_out1_51;
R23 : r23 = mem_out1_51;
R24 : r24 = mem_out1_51;
R25 : r25 = mem_out1_51;
R26 : r26 = mem_out1_51;
R27 : r27 = mem_out1_51;
R28 : r28 = mem_out1_51;
R29 : r29 = mem_out1_51;
R30 : r30 = mem_out1_51;
R31 : r31 = mem_out1_51;
endcase
end
endcase
end
endmodule
// Combining all these modules together:
//`include "fetch.v"
//`include "decode.v"
//`include "execute.v"
//`include "mw.v"
//`include "wb.v"
module proc(clk_51,rst_51,mrd_i_51,mwd_i_51,mra_i_51,mwa_i_51,mwr_i_51,mrd_d_51,mwd_d_51,mra_d_51,mwa_d_51,mwr_d_51);
input clk_51,rst_51;
input [31:0] mrd_i_51,mrd_d_51; //// memory access to read data
output [31:0] mwd_i_51,mwd_d_51; //// memory access to write data
output [31:0] mra_i_51,mra_d_51; //// memory access to read address
output [31:0] mwa_i_51,mwa_d_51; //// memory access to write address
output mwr_i_51,mwr_d_51; //// memory access to write enable
// Intiating  bit wires
wire [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9;
// Intiating 32 bit wires
wire [31:0] r10,r11,r12,r13,r14,r15,r16,r17,r18,r19;
// Intiating 32 bit wires
wire [31:0] r20,r21,r22,r23,r24,r25,r26,r27,r28,r29;

// Intiating 32 bit wires
wire [31:0] r30,r31;
// Transferring data from one to another stages:
wire [31:0] PC_in_fd_51;
wire [31:0] NPC_fd_51;
wire [31:0] IR_fd_51;
wire PC_sel_fd_51;
wire [31:0] sign_ext_de_51;
wire [5:0] opcode_de_51;
wire [5:0] src_reg_de_51;
wire [5:0] dest_reg_de_51;
wire [5:0] targ_reg_de_51;
wire [31:0] a_de_51;
wire [31:0] b_de_51;
wire [31:0] alu_out_em_51;
wire [31:0] alu_src_em_51;
wire [5:0] opcode_out_em_51;
wire [5:0] src_reg_out_em_51;
wire [5:0] dest_reg_out_em_51;
wire [5:0] targ_reg_out_em_51;
wire [31:0] mem_out1_mr_51;
wire [31:0] mem_out2_mr_51;
wire [5:0] opcode_out_mr_51;
wire [5:0] src_reg_out_mr_51;
wire [5:0] dest_reg_out_mr_51;
wire [5:0] targ_reg_out_mr_51;
// Till the clock arrives this regs stores the values till that time
reg [31:0] NPC_fd_f_51;
reg PC_sel_fd_f_51;
reg PC_in_fd_f_51;
reg [31:0] IR_fd_f_51;
reg [31:0] a_de_f_51;
reg [31:0] b_de_f_51;
reg [31:0] sign_ext_de_f_51,a_de_f_51,b_de_f_51;
reg [5:0] opcode_de_f_51,src_reg_de_f_51,dest_reg_de_f_51,targ_reg_de_f_51;
reg [31:0] alu_out_em_f_51,alu_src_em_f_51;
reg [5:0] opcode_out_em_f_51,src_reg_out_em_f_51,dest_reg_out_em_f_51,targ_reg_out_em_f_51;
reg [31:0] mem_out1_mr_f_51,mem_out2_mr_f_51,mem_out1_mr_ff_51;
reg [5:0] opcode_out_mr_f_51,src_reg_out_mr_f_51,dest_reg_out_mr_f_51,targ_reg_out_mr_f_51;
reg [31:0] a_de_m_51,b_de_m_51;
wire [31:0] alu_out_em_m_51,alu_src_em_m_51;
parameter ADD = 6'b110001;
parameter LDW = 6'b010111;
parameter MUL = 6'b100111;
parameter BLT = 6'b010110;
parameter STW = 6'b010101;
parameter ADDI = 6'b000100;
parameter SUBI = 6'b011111;
parameter NOPE = 6'b111111;
parameter BNE = 6'b101010;
parameter CALL = 6'b100001;
initial
begin
a_de_m_51 = 0;
b_de_m_51 = 0;

end
// initializing all values to zero,
always @(posedge clk_51 or posedge rst_51)
begin
if(rst_51)
begin
NPC_fd_f_51 <= 0;
PC_sel_fd_f_51 <= 0;
PC_in_fd_f_51 <= 0;
IR_fd_f_51 <= 0;
sign_ext_de_f_51 <= 0;
opcode_de_f_51 <= 0;
src_reg_de_f_51 <= 0;
dest_reg_de_f_51 <= 0;
targ_reg_de_f_51 <= 0;
a_de_f_51 <= 0;
b_de_f_51 <= 0;
alu_out_em_f_51 <= 0;
alu_src_em_f_51 <= 0;
opcode_out_em_f_51 <= 0;
src_reg_out_em_f_51 <= 0;
dest_reg_out_em_f_51 <= 0;
targ_reg_out_em_f_51 <= 0;
mem_out1_mr_f_51 <= 0;
mem_out2_mr_f_51 <= 0;
opcode_out_mr_f_51 <= 0;
src_reg_out_mr_f_51 <= 0;
dest_reg_out_mr_f_51 <= 0;
targ_reg_out_mr_f_51 <= 0;
mem_out1_mr_ff_51 <= 0;
end
else
// at every clock data will be transferred to the next stage:
begin
NPC_fd_f_51 <= NPC_fd_51;
PC_sel_fd_f_51 <= PC_sel_fd_51;
PC_in_fd_f_51 <= PC_in_fd_51;
IR_fd_f_51 <= IR_fd_51;
sign_ext_de_f_51 <= sign_ext_de_51;
opcode_de_f_51 <= opcode_de_51;
src_reg_de_f_51 <= src_reg_de_51;
dest_reg_de_f_51 <= dest_reg_de_51;
targ_reg_de_f_51 <= targ_reg_de_51;
a_de_f_51 <= a_de_51;
b_de_f_51 <= b_de_51;
alu_out_em_f_51 <= alu_out_em_51;
alu_src_em_f_51 <= alu_src_em_51;
opcode_out_em_f_51 <= opcode_out_em_51;
src_reg_out_em_f_51 <= src_reg_out_em_51;
dest_reg_out_em_f_51 <= dest_reg_out_em_51;
targ_reg_out_em_f_51 <= targ_reg_out_em_51;
mem_out1_mr_f_51 <= mem_out1_mr_51;
mem_out2_mr_f_51 <= mem_out2_mr_51;
opcode_out_mr_f_51 <= opcode_out_mr_51;
src_reg_out_mr_f_51 <= src_reg_out_mr_51;
dest_reg_out_mr_f_51 <= dest_reg_out_mr_51;

targ_reg_out_mr_f_51 <= targ_reg_out_mr_51;
mem_out1_mr_ff_51 <= mem_out1_mr_f_51;
end
end
// initiating each and every modules to the main module
fetch f(.clk_51(clk_51),.rst_51(rst_51),.mra_i_51(mra_i_51),.mrd_i_51(mrd_i_51),.PC_in_51(PC_in_fd_51),.NPC_51(NPC_fd_51),.IR_51 (IR_fd_51),.PC_sel_51(PC_sel_fd_51));

decode d(.clk_51(clk_51),.rst_51(rst_51),.IR_51(IR_fd_f_51),.PC_51(NPC_fd_f_51),.a_51(a_de_51),.b_51(b_de_51),.NPC_51(PC_in_fd_51),.PC_sel_51(PC_sel_fd_51),.sign_ext_51(sign_ext_de_51),.opcode_51(opcode_de_51),.src_reg_51(src_reg_de_51),.dest_reg_51(dest_reg_de_51),.targ_reg_51(targ_reg_de_51),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10),.r11(r11), .r12(r12),.r13(r13),.r14(r14),.r15(r15),.r16(r16),.r17(r17),.r18(r18),.r19(r19),.r20(r20),.r21(r21),.r22(r22),.r23(r23),.r24(r24),.r25(r25),.r26(r26),.r27(r27),.r28(r28),.r29(r29),.r30(r30),.r31(r31));

execute e(.clk_51(clk_51),.rst_51(rst_51),.opcode_51(opcode_de_f_51),.a_51(a_de_m_51),.b_51(b_de_m_51),.sign_ext_51(sign_ext_de_f_40),.alu_out_51(alu_out_em_51),.alu_src_51(alu_src_em_51),.opcode_out_51(opcode_out_em_51),.src_reg_51(src_reg_de_f_51),.dest_reg_51(dest_reg_de_f_51),.targ_reg_51(targ_reg_de_f_51),.src_reg_out_51(src_reg_out_em_51),.dest_reg_out_51(dest_reg_out_em_51),.targ_reg_out_51(targ_reg_out_em_51));

memory_write m(.clk_51(clk_51),.rst_51(rst_51),.opcode_51(opcode_out_em_f_51),.src_reg_51(src_reg_out_em_f_51),.dest_reg_51(dest_reg_out_em_f_51),.targ_reg_51(targ_reg_out_em_f_51),.alu_out_51(alu_out_em_f_51),.alu_src_51(alu_src_em_f_51),.mem_out1_51(mem_out1_mr_51),.mem_out2_51(mem_out2_mr_51),.opcode_out_51(opcode_out_mr_51),.src_reg_out_51(src_reg_out_mr_51),.dest_reg_out_51(dest_reg_out_mr_51),.targ_reg_out_51(targ_reg_out_mr_51),.mwr_d_51(mwr_d_51),.mwd_d_51(mwd_d_51),.mwa_d_51(mwa_d_51),.mra_d_51(mra_d_51),.mrd_d_51(mrd_d_51),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10),.r11(r11),.r12(r12),.r13(r13),.r14(r14),.r15(r15),.r16(r16),.r17(r17),.r18(r18),.r19(r19),.r20(r20),.r21(r21),.r22(r22),.r23(r23),.r24(r24),.r25(r25),.r26(r26),.r27(r27),.r28(r28),.r29(r29),.r30(r30),.r31(r31));

rw r(.clk_51(clk_51),.rst_51(rst_51),.opcode_51(opcode_out_mr_f_51),.src_reg_51(src_reg_out_mr_f_51),.dest_reg_51(dest_reg_out_mr_f_51),.targ_reg_51(targ_reg_out_mr_f_51),.mem_out1_51(mem_out1_mr_f_51),.mem_out2_51(mem_out2_mr_f_51),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10),.r11(r11),.r12(r12),.r13(r13),.r14(r14),.r15(r15),.r16(r16),.r17(r17), .r18(r18),.r19(r19),.r20(r20),.r21(r21),.r22(r22),.r23(r23),.r24(r24),.r25(r25),.r26(r26),.r27(r27),.r28(r28),.r29(r29),.r30(r30),.r31(r31));

always @(*)
begin
a_de_m_51 = a_de_f_51;
b_de_m_51 = b_de_f_51;

// decoding opcode and doing operation accordingly
case(opcode_out_em_f_51)
CALL:
begin
case(opcode_de_f_51)
ADD:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
MUL:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
ADDI:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
SUBI:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
LDW:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
STW:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
BNE:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
endcase
end
ADD:
begin
case(opcode_de_f_51)
ADD:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
MUL:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
ADDI:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
SUBI:
begin

a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
LDW:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
STW:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
BNE:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
endcase
end
MUL:
begin
case(opcode_de_f_51)
ADD:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
MUL:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
ADDI:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
SUBI:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
LDW:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
STW:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
BNE:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
endcase
end
ADDI:
begin
case(opcode_de_f_51)
ADD:

begin
a_de_m_51 = (dest_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (dest_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
MUL:
begin
a_de_m_51 = (dest_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (dest_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
ADDI:
begin
a_de_m_51 = (dest_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
SUBI:
begin
a_de_m_51 = (dest_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
LDW:
begin
a_de_m_51 = (dest_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
STW:
begin
a_de_m_51 = (dest_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (dest_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
BNE:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
endcase
end
SUBI:
begin
case(opcode_de_f_51)
ADD:
begin
a_de_m_51 = (dest_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (dest_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
MUL:
begin
a_de_m_51 = (dest_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (dest_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
ADDI:
begin
a_de_m_51 = (dest_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
SUBI:
begin
a_de_m_51 = (dest_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
LDW:
begin
a_de_m_51 = (dest_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
end
STW:

begin
a_de_m_51 = (dest_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (dest_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
BNE:
begin
a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
end
endcase
end
LDW:
begin
end
endcase
case(opcode_out_mr_f_51)
ADD:
begin
case(opcode_de_f_51)
ADD:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
MUL:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
ADDI:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
SUBI:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
LDW:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
STW:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
BNE:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
endcase
end
MUL:
begin
case(opcode_de_f_51)
ADD:
begin

a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
MUL:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
ADDI:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
SUBI:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
LDW:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
STW:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
BNE:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
endcase
end
ADDI:
begin
case(opcode_de_f_51)
ADD:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (dest_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
MUL:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (dest_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
ADDI:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
SUBI:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
LDW:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
STW:
begin

a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (dest_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
BNE:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
endcase
end
SUBI:
begin
case(opcode_de_f_51)
ADD:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (dest_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
MUL:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (dest_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
ADDI:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
SUBI:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
LDW:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
STW:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (dest_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
BNE:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
endcase
end
LDW:
begin
case(opcode_de_f_51)
ADD:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (dest_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
MUL:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (dest_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;

end
ADDI:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
SUBI:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
LDW:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
end
STW:
begin
a_de_m_51 = (dest_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (dest_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
BNE:
begin
a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
end
endcase
end
endcase
end
endmodule
