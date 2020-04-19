`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:50 04/18/2020 
// Design Name: 
// Module Name:    main 
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
`include "fetch.v"
`include "decode.v"
`include "execute.v"
`include "memory.v"
`include "writeback.v"

module main(clock, reset, mrd_i,mwd_i,mra_i,mwa_i,mwr_i,mrd_d,mwd_d,mra_d,mwa_d,mwr_d);

input clock,reset;
input [31:0] mrd_i,mrd_d; //// memory access to read data
output [31:0] mwd_i,mwd_d; //// memory access to write data
output [31:0] mra_i,mra_d; //// memory access to read address
output [31:0] mwa_i,mwa_d; //// memory access to write address
output mwr_i,mwr_d; //// memory access to write enable

wire [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31;

wire [31:0] PC_in_fd_51;
wire [31:0] NPC_fd_51;
wire [31:0] IR_fd_51;
wire PC_sel_fd_51;
wire [31:0] sign_ext_de_51;
wire [5:0] opcode_de_51;
wire [4:0] src_reg_de_51;
wire [4:0] dest_reg_de_51;
wire [4:0] targ_reg_de_51;
wire [31:0] a_de_51;
wire [31:0] b_de_51;
wire [31:0] alu_out_em_51;
wire [31:0] alu_src_em_51;
wire [5:0] opcode_out_em_51;
wire [4:0] src_reg_out_em_51;
wire [4:0] dest_reg_out_em_51;
wire [4:0] targ_reg_out_em_51;
wire [31:0] mem_out1_mr_51;
wire [31:0] mem_out2_mr_51;
wire [5:0] opcode_out_mr_51;
wire [4:0] src_reg_out_mr_51;
wire [4:0] dest_reg_out_mr_51;
wire [4:0] targ_reg_out_mr_51;
// Till the clock arrives this regs stores the values till that time
reg [31:0] NPC_fd_f_51;
reg PC_sel_fd_f_51;
reg PC_in_fd_f_51;
reg [31:0] IR_fd_f_51;
//reg [31:0] a_de_f_51;
//reg [31:0] b_de_f_51;
reg [31:0] sign_ext_de_f_51 , a_de_f_51 , b_de_f_51;
reg [5:0] opcode_de_f_51;
reg [4:0] src_reg_de_f_51,dest_reg_de_f_51,targ_reg_de_f_51;
reg [31:0] alu_out_em_f_51,alu_src_em_f_51;
reg [5:0] opcode_out_em_f_51;
reg [4:0] src_reg_out_em_f_51,dest_reg_out_em_f_51,targ_reg_out_em_f_51;
reg [31:0] mem_out1_mr_f_51,mem_out2_mr_f_51,mem_out1_mr_ff_51;
reg [5:0] opcode_out_mr_f_51;
reg [4:0] src_reg_out_mr_f_51,dest_reg_out_mr_f_51,targ_reg_out_mr_f_51;
reg [31:0] a_de_m_51,b_de_m_51;
wire [31:0] alu_out_em_m_51,alu_src_em_m_51;

parameter addu = 6'd1;
parameter beq 	= 6'd2;
parameter lw 	= 6'd3;
parameter mult = 6'd4;
parameter addi = 6'd5;
parameter j 	= 6'd6;
parameter nop 	= 6'd7;
parameter call = 6'd8;

initial
begin
	a_de_m_51 = 0;
	b_de_m_51 = 0;
end
// initializing all values to zero,

always @(posedge clock or posedge reset)
begin
	if(reset)
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

fetch f(.clk(clock),.reset(reset),.inst_a(mra_i),.inst_r(mrd_i),.pc_i(PC_in_fd_51), .npc(NPC_fd_51), .ir(IR_fd_51), .pc_s(PC_sel_fd_51));

decode d(.clk(clock),.reset(reset),.ir(IR_fd_f_51),.pc_i(NPC_fd_f_51),.a(a_de_51),.b(b_de_51),.npc(PC_in_fd_51),.pc_s(PC_sel_fd_51),.sign_e(sign_ext_de_51),.opcode(opcode_de_51),.src(src_reg_de_51),.dest(dest_reg_de_51),.target(targ_reg_de_51),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10),.r11(r11), .r12(r12),.r13(r13),.r14(r14),.r15(r15),.r16(r16),.r17(r17),.r18(r18),.r19(r19),.r20(r20),.r21(r21),.r22(r22),.r23(r23),.r24(r24),.r25(r25),.r26(r26),.r27(r27),.r28(r28),.r29(r29),.r30(r30),.r31(r31));
					
execute e(.clk(clock),.reset(reset),.opcode(opcode_de_f_51),.a(a_de_m_51),.b(b_de_m_51),.sign_e(sign_ext_de_f_51),.alu_out(alu_out_em_51),.alu_src(alu_src_em_51),.opcode_out(opcode_out_em_51),.src(src_reg_de_f_51),.dest(dest_reg_de_f_51),.target(targ_reg_de_f_51),.src_out(src_reg_out_em_51),.dest_out(dest_reg_out_em_51),.target_out(targ_reg_out_em_51));

memory m(.clk(clock),.reset(reset),.opcode(opcode_out_em_f_51),.src(src_reg_out_em_f_51),.dest(dest_reg_out_em_f_51),.target(targ_reg_out_em_f_51),.alu_out(alu_out_em_f_51),.alu_src(alu_src_em_f_51),.mem_out1(mem_out1_mr_51),.mem_out2(mem_out2_mr_51),.opcode_out(opcode_out_mr_51),.src_out(src_reg_out_mr_51),.dest_out(dest_reg_out_mr_51),.target_out(targ_reg_out_mr_51),.mwr_d(mwr_d),.mwd_d(mwd_d),.mwa_d(mwa_d),.mra_d(mra_d),.mrd_d(mrd_d),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10),.r11(r11),.r12(r12),.r13(r13),.r14(r14),.r15(r15),.r16(r16),.r17(r17),.r18(r18),.r19(r19),.r20(r20),.r21(r21),.r22(r22),.r23(r23),.r24(r24),.r25(r25),.r26(r26),.r27(r27),.r28(r28),.r29(r29),.r30(r30),.r31(r31));

writeback w(.clk(clock),.reset(reset),.opcode(opcode_out_mr_f_51),.src(src_reg_out_mr_f_51),.dest(dest_reg_out_mr_f_51),.target(targ_reg_out_mr_f_51),.mem_out1(mem_out1_mr_f_51),.mem_out2(mem_out2_mr_f_51),.r0(r0),.r1(r1),.r2(r2),.r3(r3),.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),.r10(r10),.r11(r11),.r12(r12),.r13(r13),.r14(r14),.r15(r15),.r16(r16),.r17(r17), .r18(r18),.r19(r19),.r20(r20),.r21(r21),.r22(r22),.r23(r23),.r24(r24),.r25(r25),.r26(r26),.r27(r27),.r28(r28),.r29(r29),.r30(r30),.r31(r31));

always @(*)
begin
    a_de_m_51 = a_de_f_51;
    b_de_m_51 = b_de_f_51;


    // decoding opcode and doing operation accordingly
    case(opcode_out_em_f_51)
        call:
        begin
            case(opcode_de_f_51)
            addu:
            begin
                a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
            end
            mult:
            begin
                a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
            end
            addi:
            begin
                a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
            end
            //SUBI:
            //begin
                //a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
            //end
            lw:
            begin
                a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
            end
            //STW:
            //begin
                //a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                //b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
            //end
            beq:
            begin
                a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ?  a_de_f_51 : alu_out_em_f_51;
                b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ?  b_de_f_51 : alu_out_em_f_51;
            end
            endcase
        end
        addu:
        begin
            case(opcode_de_f_51)
                addu:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                    b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
                end
                mult:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                    b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
                end
                addi:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                end
                //SUBI:
                //begin
                    //a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                //end
                lw:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                end
                //STW:
                //begin
                    //a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                    //b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
                //end
                beq:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ?  a_de_f_51 : alu_out_em_f_51;
                    b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ?  b_de_f_51 : alu_out_em_f_51;
                end
                
            endcase
        end
        mult:
        begin
            case(opcode_de_f_51)
                addu:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                    b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
                end
                mult:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                    b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
                end
                addi:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                end
                //SUBI:
                //begin
                    //a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                //end
                lw:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                end
                //STW:
                //begin
                    //a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                    //b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
                //end
                beq:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ?  a_de_f_51 : alu_out_em_f_51;
                    b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ?  b_de_f_51 : alu_out_em_f_51;
                end
                
            endcase
        end
        addi:
        begin
            case(opcode_de_f_51)
            addu:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                    b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
                end
                mult:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                    b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
                end
                addi:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                end
                //SUBI:
                //begin
                    //a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                //end
                lw:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                end
                //STW:
                //begin
                    //a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ? alu_out_em_f_51 : a_de_f_51;
                    //b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ? alu_out_em_f_51 : b_de_f_51;
                //end
                beq:
                begin
                    a_de_m_51 = (targ_reg_out_em_f_51 == src_reg_de_f_51 ) ?  a_de_f_51 : alu_out_em_f_51;
                    b_de_m_51 = (targ_reg_out_em_f_51 == dest_reg_de_f_51) ?  b_de_f_51 : alu_out_em_f_51;
                end
            endcase
        end
        
        lw:
        begin
        end
    endcase

/////////////////////////////////////////////////////////////////////////////////////////////
    case(opcode_out_mr_f_51)
    addu:
    begin
        case(opcode_de_f_51)
            addu:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
                b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
            end
            mult:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
                b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
            end
            addi:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            end
            //SUBI:
            //begin
            //a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            //end
            lw:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            end
            //STW:
            //begin
            //a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            //b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
            //end
            beq:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ?  a_de_m_51 : mem_out1_mr_f_51;
                b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ?  b_de_m_51 : mem_out1_mr_f_51;
            end
        endcase
    end
    mult:
    begin
        case(opcode_de_f_51)
            addu:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
                b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
            end
            mult:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
                b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
            end
            addi:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            end
            //SUBI:
            //begin
            //a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            //end
            lw:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            end
            //STW:
            //begin
            //a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            //b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
            //end
            beq:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ?  a_de_m_51 : mem_out1_mr_f_51;
                b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ?  b_de_m_51 : mem_out1_mr_f_51;
            end
        endcase
    end
    addi:
    begin
        case(opcode_de_f_51)
            addu:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
                b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
            end
            mult:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
                b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
            end
            addi:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            end
            //SUBI:
            //begin
            //a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            //end
            lw:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            end
            //STW:
            //begin
            //a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            //b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
            //end
            beq:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ?  a_de_m_51 : mem_out1_mr_f_51;
                b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ?  b_de_m_51 : mem_out1_mr_f_51;
            end
        endcase    
    end
    
    lw:
    begin
        case(opcode_de_f_51)
            addu:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
                b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
            end
            mult:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
                b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
            end
            addi:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            end
            //SUBI:
            //begin
            //a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            //end
            lw:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            end
            //STW:
            //begin
            //a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ? mem_out1_mr_f_51 : a_de_m_51;
            //b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ? mem_out1_mr_f_51 : b_de_m_51;
            //end
            beq:
            begin
                a_de_m_51 = (targ_reg_out_mr_f_51 == src_reg_de_f_51 ) ?  a_de_m_51 : mem_out1_mr_f_51;
                b_de_m_51 = (targ_reg_out_mr_f_51 == dest_reg_de_f_51) ?  b_de_m_51 : mem_out1_mr_f_51;
            end
        endcase
    end
    endcase
end
endmodule
