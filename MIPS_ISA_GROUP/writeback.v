// 5th Stage of Pipeline: // ************* Write Back Stage*************   

module writeback(clk,reset,opcode,src,dest,target,mem_out1,mem_out2,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31);  

input clk,reset;  
input [5:0] opcode;  
input [4:0] src,dest,target;  
input [31:0] mem_out1,mem_out2;  

// initiating 32 bit regs 
output reg [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31;

// if reset in set to 1 all the values will be transferred to 0 
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

parameter addu = 6'd1;
parameter beq 	= 6'd2;
parameter lw 	= 6'd3;
parameter mult = 6'd4;
parameter addi = 6'd5;
parameter j 	= 6'd6;
parameter nop 	= 6'd7;
parameter call = 6'd8;

initial begin  
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
r30 = 32'd150;    
r31 = 32'd190;  
end

always @(*)  
  begin
     case(opcode)
       addu:
        begin
          case(target)          
  		R0 : r0 = mem_out1;            
		R1 : r1 = mem_out1;            
		R2 : r2 = mem_out1;            
		R3 : r3 = mem_out1;            
		R4 : r4 = mem_out1;            
		R5 : r5 = mem_out1;            
		R6 : r6 = mem_out1;            
		R7 : r7 = mem_out1;            
		R8 : r8 = mem_out1;            
		R9 : r9 = mem_out1;            
		R10 : r10 = mem_out1;            
		R11 : r11 = mem_out1;            
		R12 : r12 = mem_out1;            
		R13 : r13 = mem_out1;            
		R14 : r14 = mem_out1;            
		R15 : r15 = mem_out1;            
		R16 : r16 = mem_out1;            
		R17 : r17 = mem_out1;            
		R18 : r18 = mem_out1;            
		R19 : r19 = mem_out1;            
		R20 : r20 = mem_out1;            
		R21 : r21 = mem_out1;            
		R22 : r22 = mem_out1;            
		R23 : r23 = mem_out1;            
		R24 : r24 = mem_out1;            
		R25 : r25 = mem_out1;            
		R26 : r26 = mem_out1;            
		R27 : r27 = mem_out1;            
		R28 : r28 = mem_out1;            
		R29 : r29 = mem_out1;            
		R30 : r30 = mem_out1;            
		R31 : r31 = mem_out1;
      endcase 
      end  
      lw:
       begin 
         case(dest)   
                R0 : r0 = mem_out1;            
		R1 : r1 = mem_out1;            
		R2 : r2 = mem_out1;            
		R3 : r3 = mem_out1;            
		R4 : r4 = mem_out1;            
		R5 : r5 = mem_out1;            
		R6 : r6 = mem_out1;            
		R7 : r7 = mem_out1;            
		R8 : r8 = mem_out1;            
		R9 : r9 = mem_out1;            
		R10 : r10 = mem_out1;            
		R11 : r11 = mem_out1;            
		R12 : r12 = mem_out1;            
		R13 : r13 = mem_out1;            
		R14 : r14 = mem_out1;            
		R15 : r15 = mem_out1;            
		R16 : r16 = mem_out1;            
		R17 : r17 = mem_out1;            
		R18 : r18 = mem_out1;            
		R19 : r19 = mem_out1;            
		R20 : r20 = mem_out1;            
		R21 : r21 = mem_out1;            
		R22 : r22 = mem_out1;            
		R23 : r23 = mem_out1;            
		R24 : r24 = mem_out1;            
		R25 : r25 = mem_out1;            
		R26 : r26 = mem_out1;            
		R27 : r27 = mem_out1;            
		R28 : r28 = mem_out1;            
		R29 : r29 = mem_out1;            
		R30 : r30 = mem_out1;            
		R31 : r31 = mem_out1;
          endcase 
       end  
  mult: 
       begin       
        case(target)     
		R0 : r0 = mem_out1;            
		R1 : r1 = mem_out1;            
		R2 : r2 = mem_out1;            
		R3 : r3 = mem_out1;            
		R4 : r4 = mem_out1;            
		R5 : r5 = mem_out1;            
		R6 : r6 = mem_out1;            
		R7 : r7 = mem_out1;            
		R8 : r8 = mem_out1;            
		R9 : r9 = mem_out1;            
		R10 : r10 = mem_out1;            
		R11 : r11 = mem_out1;            
		R12 : r12 = mem_out1;            
		R13 : r13 = mem_out1;            
		R14 : r14 = mem_out1;            
		R15 : r15 = mem_out1;            
		R16 : r16 = mem_out1;            
		R17 : r17 = mem_out1;            
		R18 : r18 = mem_out1;            
		R19 : r19 = mem_out1;            
		R20 : r20 = mem_out1;            
		R21 : r21 = mem_out1;            
		R22 : r22 = mem_out1;            
		R23 : r23 = mem_out1;            
		R24 : r24 = mem_out1;            
		R25 : r25 = mem_out1;            
		R26 : r26 = mem_out1;            
		R27 : r27 = mem_out1;            
		R28 : r28 = mem_out1;            
		R29 : r29 = mem_out1;            
		R30 : r30 = mem_out1;            
		R31 : r31 = mem_out1;
   endcase  
      end 
       addi:        
        begin        
        case(dest)        
		R0 : r0 = mem_out1;            
		R1 : r1 = mem_out1;            
		R2 : r2 = mem_out1;            
		R3 : r3 = mem_out1;            
		R4 : r4 = mem_out1;            
		R5 : r5 = mem_out1;            
		R6 : r6 = mem_out1;            
		R7 : r7 = mem_out1;            
		R8 : r8 = mem_out1;            
		R9 : r9 = mem_out1;            
		R10 : r10 = mem_out1;            
		R11 : r11 = mem_out1;            
		R12 : r12 = mem_out1;            
		R13 : r13 = mem_out1;            
		R14 : r14 = mem_out1;            
		R15 : r15 = mem_out1;            
		R16 : r16 = mem_out1;            
		R17 : r17 = mem_out1;            
		R18 : r18 = mem_out1;            
		R19 : r19 = mem_out1;            
		R20 : r20 = mem_out1;            
		R21 : r21 = mem_out1;            
		R22 : r22 = mem_out1;            
		R23 : r23 = mem_out1;            
		R24 : r24 = mem_out1;            
		R25 : r25 = mem_out1;            
		R26 : r26 = mem_out1;            
		R27 : r27 = mem_out1;            
		R28 : r28 = mem_out1;            
		R29 : r29 = mem_out1;            
		R30 : r30 = mem_out1;            
		R31 : r31 = mem_out1;
   endcase     
   end  
      call :        
	begin   
       r31 = mem_out2;       
        end
 endcase 
 end  
endmodule




  
         

