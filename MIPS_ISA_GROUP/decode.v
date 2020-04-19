`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:47:22 04/17/2020 
// Design Name: 
// Module Name:    decode 
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

module decode(clk,reset,ir,pc_i,npc,pc_s,sign_e,a,b,opcode,src,target,dest,
	r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31,r32
					);

input clk,reset;
input [31:0]ir;
input [31:0] pc_i;

output reg pc_s;
output reg [31:0]npc;
output reg [31:0] sign_e;
output reg [31:0] a,b;
output [5:0]opcode;
output [4:0]src;
output [4:0]target;
output [4:0] dest;

input [31:0] r0;
input [31:0] r1;
input [31:0] r2;
input [31:0] r3;
input [31:0] r4;
input [31:0] r5;
input [31:0] r6;
input [31:0] r7;
input [31:0] r8;
input [31:0] r9;
input [31:0] r10;
input [31:0] r11;
input [31:0] r12;
input [31:0] r13;
input [31:0] r14;
input [31:0] r15;
input [31:0] r16;
input [31:0] r17;
input [31:0] r18;
input [31:0] r19;
input [31:0] r20;
input [31:0] r21;
input [31:0] r22;
input [31:0] r23;
input [31:0] r24;
input [31:0] r25;
input [31:0] r26;
input [31:0] r27;
input [31:0] r28;
input [31:0] r29;
input [31:0] r30;
input [31:0] r31;
input [31:0] r32;


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
parameter R25 =  5'b11001;
parameter R26 =  5'b11010;
parameter R27 =  5'b11011;                                           
parameter R28 =  5'b11100;          
parameter R29 =  5'b11101;
parameter R30 =  5'b11110;
parameter R31 =  5'b11111;

//opcode

parameter addu = 6'd1;
parameter beq 	= 6'd2;
parameter lw 	= 6'd3;
parameter mult = 6'd4;
parameter addi = 6'd5;
parameter j 	= 6'd6;
parameter nop 	= 6'd7;

assign opcode =	reset ? 6'd0 : ir[31:26];
assign src    = 	reset ? 5'd0 : ir[25:21];
assign target = 	reset ? 5'd0 : ir[20:16];
assign dest   =	reset ? 5'd0 : ir[15:11];

            
always @ (posedge clk or posedge reset)
begin
	if(reset) begin
		npc = 0;
		//pc_i = 0;
		sign_e = 0;
		a = 0;
		b = 0;
	end

	else begin
		pc_s = 0;
		case (opcode)
		 
		 addu:
		 begin
		case(src)         
			R0:	a=r0;
			R1:	a=r1;
			R2:	a=r2;
			R3:	a=r3;
			R4:	a=r4;
			R5:	a=r5;
			R6:	a=r6;
			R7  :a=r7 ;
			R8  :a=r8 ;
			R9  :a=r9;
			R10 :a=r10;
			R11 :a=r11;
			R12 :a=r12;
			R13 :a=r13;
			R14 :a=r14 ;
			R15 :a=r15 ;
			R16 :a=r16;
			R17 :a=r17;
			R18 :a=r18;
			R19 :a=r19;
			R20 :a=r20;
			R21 :a=r21 ;
			R22 :a=r22 ;
			R23 :a=r23;
			R24 :a=r24;
			R25 :a=r25;
			R26 :a=r26;
			R27 :a=r27;
			R28 :a=r28; 
			R29 :a=r29;
			R30 :a=r30;
			R31 :a=r31;
		endcase

		case(target)
			R0:	b=r0;		 	
			R1:	b=r1;
			R2:	b=r2;
			R3:	b=r3;
			R4:	b=r4;
			R5:	b=r5;
			R6:	b=r6;
			R7:	b=r7 ;
			R8  :b=r8 ;
			R9  :b=r9;
			R10 :b=r10;
			R11 :b=r11;
			R12 :b=r12;
			R13 :b=r13;
			R14 :b=r14 ;
			R15 :b=r15 ;
			R16 :b=r16;
			R17 :b=r17;
			R18 :b=r18;
			R19 :b=r19;
			R20 :b=r20;
			R21 :b=r21 ; 
			R22 :b=r22 ;
			R23 :b=r23;
			R24 :b=r24;
			R25 :b=r25;
			R26 :b=r26;
			R27 :b=r27;
			R28 :b=r28; 
			R29 :b=r29;
			R30 :b=r30;
			R31 :b=r31;
		endcase
			end

			beq:
			begin
			case(src)         
			R0:a=r0;
						 R1:a=r1;
						 R2:a=r2;
						 R3:a=r3;
						 R4:a=r4;
						 R5:a=r5;
						 R6:a=r6;
							
						 R7  :a=r7 ;
						 R8  :a=r8 ;
						 R9  :a=r9;
						 R10 :a=r10;
						 R11 :a=r11;
						 R12 :a=r12;
						 R13 :a=r13;
							 
							 
						 R14 :a=r14 ;
						 R15 :a=r15 ;
						 R16 :a=r16;
						 R17 :a=r17;
						 R18 :a=r18;
						 R19 :a=r19;
						 R20 :a=r20;
							 
							 
						 R21 :a=r21 ;
						 R22 :a=r22 ;
						 R23 :a=r23;
						 R24 :a=r24;
						 R25 :a=r25;
						 R26 :a=r26;
						 R27 :a=r27;
							 
							 
						 R28 :a=r28; 
						 R29 :a=r29;
						 R30 :a=r30;
						 R31 :a=r31;
		endcase
			case(target)
			
				  R0:b=r0;		 	
						 R1:b=r1;
						 R2:b=r2;
						 R3:b=r3;
						 R4:b=r4;
						 R5:b=r5;
						 R6:b=r6;


			 R7  :b=r7 ;
						  R8  :b=r8 ;
						  R9  :b=r9;
						  R10 :b=r10;
						  R11 :b=r11;
						  R12 :b=r12;
						  R13 :b=r13;
							  
							  
						  R14 :b=r14 ;
						  R15 :b=r15 ;
						  R16 :b=r16;
						  R17 :b=r17;
						  R18 :b=r18;
						  R19 :b=r19;
						  R20 :b=r20;
							  
			R21 :b=r21 ; 
						 R22 :b=r22 ;
						 R23 :b=r23;
						 R24 :b=r24;
						 R25 :b=r25;

						  R26 :b=r26;
						  R27 :b=r27;
							  
						  
						  R28 :b=r28; 
						  R29 :b=r29;
						  R30 :b=r30;
						  R31 :b=r31;
			endcase

			 sign_e = ir[15] ? {16'hffff,ir[15:0]} : {16'h0000,ir[15:0]};
			 npc = (a==b) ? pc_i - sign_e : pc_i;
			 pc_s = (a==b) ? 1 : 0;
			
			end
						 
			 lw:
			begin
			case(src)

				R0:a=r0;
									R1:a=r1;
									R2:a=r2;
									R3:a=r3;
									R4:a=r4;
									R5:a=r5;
									R6:a=r6;
									  
									R7  :a=r7 ;
									R8  :a=r8 ;
									R9  :a=r9;
									R10 :a=r10;
									R11 :a=r11;
									R12 :a=r12;
									R13 :a=r13;
										
										
									R14 :a=r14 ;
									R15 :a=r15 ;
									R16 :a=r16;
									R17 :a=r17;
									R18 :a=r18;
									R19 :a=r19;
									R20 :a=r20;
										
										
									R21 :a=r21 ;
									R22 :a=r22 ;
									R23 :a=r23;
									R24 :a=r24;
									R25 :a=r25;
									R26 :a=r26;
						R27 :a=r27;  
										  
										  
					  R28 :a=r28;  
									R29 :a=r29;
									R30 :a=r30;
									R31 :a=r31;
			endcase

			sign_e = ir[15] ? {16'hffff,ir[15:0]} : {16'h0000,ir[15:0]} ;
			end

			mult:
			begin
			case(src)         
			R0:a=r0;
						 R1:a=r1;
						 R2:a=r2;
						 R3:a=r3;
						 R4:a=r4;
						 R5:a=r5;
						 R6:a=r6;
							
						 R7  :a=r7 ;
						 R8  :a=r8 ;
						 R9  :a=r9;
						 R10 :a=r10;
						 R11 :a=r11;
						 R12 :a=r12;
						 R13 :a=r13;
							 
							 
						 R14 :a=r14 ;
						 R15 :a=r15 ;
						 R16 :a=r16;
						 R17 :a=r17;
						 R18 :a=r18;
						 R19 :a=r19;
						 R20 :a=r20;
							 
							 
						 R21 :a=r21 ;
						 R22 :a=r22 ;
						 R23 :a=r23;
						 R24 :a=r24;
						 R25 :a=r25;
						 R26 :a=r26;
						 R27 :a=r27;
							 
							 
						 R28 :a=r28; 
						 R29 :a=r29;
						 R30 :a=r30;
						 R31 :a=r31;
		endcase
			case(target)
		
				  R0:b=r0;		 	
						 R1:b=r1;
						 R2:b=r2;
						 R3:b=r3;
						 R4:b=r4;
						 R5:b=r5;
						 R6:b=r6;


			 R7  :b=r7 ;
						  R8  :b=r8 ;
						  R9  :b=r9;
						  R10 :b=r10;
						  R11 :b=r11;
						  R12 :b=r12;
						  R13 :b=r13;
							  
							  
						  R14 :b=r14 ;
						  R15 :b=r15 ;
						  R16 :b=r16;
						  R17 :b=r17;
						  R18 :b=r18;
						  R19 :b=r19;
						  R20 :b=r20;
							  
			R21 :b=r21 ; 
						 R22 :b=r22 ;
						 R23 :b=r23;
						 R24 :b=r24;
						 R25 :b=r25;

						  R26 :b=r26;
						  R27 :b=r27;
							  
						  
						  R28 :b=r28; 
						  R29 :b=r29;
						  R30 :b=r30;
						  R31 :b=r31;
			endcase
			end

			addi:
			begin
			case(src)         
			R0:a=r0;
						 R1:a=r1;
						 R2:a=r2;
						 R3:a=r3;
						 R4:a=r4;
						 R5:a=r5;
						 R6:a=r6;
							
						 R7  :a=r7 ;
						 R8  :a=r8 ;
						 R9  :a=r9;
						 R10 :a=r10;
						 R11 :a=r11;
						 R12 :a=r12;
						 R13 :a=r13;
							 
							 
						 R14 :a=r14 ;
						 R15 :a=r15 ;
						 R16 :a=r16;
						 R17 :a=r17;
						 R18 :a=r18;
						 R19 :a=r19;
						 R20 :a=r20;
							 
							 
						 R21 :a=r21 ;
						 R22 :a=r22 ;
						 R23 :a=r23;
						 R24 :a=r24;
						 R25 :a=r25;
						 R26 :a=r26;
						 R27 :a=r27;
							 
							 
						 R28 :a=r28; 
						 R29 :a=r29;
						 R30 :a=r30;
						 R31 :a=r31;
		endcase
		
		sign_e = ir[15] ? {16'hffff,ir[15:0]} : {16'h0000,ir[15:0]} ; 
			end
			j:
			begin
			sign_e = ir[15] ? {16'hffff,ir[15:0]} : {16'h0000,ir[15:0]};
			npc = pc_i - sign_e;
			pc_s = 1;
			end

			nop:
			begin 
			end
			endcase
		end
		end
endmodule

		
		
		
		











 

