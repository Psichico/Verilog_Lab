module memory(clk,reset,opcode,src,dest,target,alu_out,alu_src,mem_out1,mem_out2,opcode_out,src_out,dest_out,target_out,mwr_d,mwd_d,mwa_d,mra_d, mrd_d,r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31); 

input clk,reset;
input [5:0] opcode;  
input [4:0] src,dest,target;  
input [31:0] alu_out,alu_src;
input [31:0] mrd_d;    
output reg [31:0]mem_out1;  
output [31:0] mem_out2;  
output [5:0] opcode_out;  
output [4:0] src_out,dest_out,target_out;  
output reg [31:0] mra_d;  
output reg [31:0] mwd_d,mwa_d;  
output reg mwr_d;  

input [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r28,r29,r30,r31;

assign opcode_out   =  reset ? 5'b0 : opcode;  
assign src_out  	  =  reset ? 5'b0 : src;  
assign dest_out 	  =  reset ? 5'b0 : dest;  
assign target_out   =  reset ? 5'b0 : target;  
assign mem_out2_51  =  reset ? 5'b0 : alu_src;  

parameter lw 	= 6'd3; 
 
always @(*)    begin   
 if(reset)    
   begin     
    mem_out1 = 0;    
   end    
 else   
  begin    
  mwr_d = 1'b0;     
   case(opcode)       
    lw :         begin        
	mra_d = alu_out;  	
	mem_out1 = mrd_d;        
   end       
/* STW:        begin        
mwd_d = alu_src;          
mwa_d = alu_out;          
mwr_d = 1'b1;        
end    */
    
   default : mem_out1 = alu_out;      
  endcase    
 end    
end  
endmodule   
