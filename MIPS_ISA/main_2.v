`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:06:30 04/15/2020 
// Design Name: 
// Module Name:    main_2 
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

//////////////////////////
/* op source1 source2 dest remain 6 5 5 5 11
dot_product: 

	addu $r1 $r0 $r0 ;	// 000001 00000 00000 00001 00000000000 

loop: 

	beq $r7 $r0 done ;   // 000010 00111 00000 00000 00000000110 (done)
	lw $r2 0($r3) ;  		// 000011 00011 00010 00000 00000000000
	lw $r4 0($r5) ;  		// 000011 00101 00100 00000 00000000000
	mul $r2 $r2 $r4 ;    // 000100 00010 00100 00010 00000000000
	addu $r1 $r1 $r2 ;   // 000001 00001 00010 00001 00000000000
	addiu $r3 $r3 #4 		// 000101 00011 00011 00000 00000000100
	addiu $r5 $r5 #4 		// 000101 00101 00101 00000 00000000100
	addiu $r7 $r7 #-1 	// 000101 00111 00111 00000 10000000001 (1 means negative)

j loop                  // 000111 00000 00000 00000 00000000111 (loop)

done: 

	jr $r31

*/
//////////////////////////
module main_2(	
					input clock,
					input reset
						
						);

parameter s0 = 8'd0;
parameter s1 = 8'd1;
parameter s2 = 8'd2;
parameter s3 = 8'd3;
parameter s4 = 8'd4;
parameter s5 = 8'd5;
parameter s6 = 8'd6;
parameter s7 = 8'd7;
parameter s8 = 8'd8;
parameter s9 = 8'd9;
parameter s10 = 8'd10;
parameter s11 = 8'd11;
parameter s12 = 8'd12;
parameter s13 = 8'd13;
parameter s14 = 8'd14;
parameter s15 = 8'd15;
parameter s16 = 8'd16;
parameter s17 = 8'd17;
parameter s18 = 8'd18;
// ----- define more states as needed

reg [7:0] state, nstate;
reg [31:0] reg_instruction;

//reg [4:0] program_counter; //memory[program_counter]

reg [5:0] op;
reg [4:0] rd, rdtemp;
reg [31:0] a, b, atemp;
reg [31:0] alu_out;

reg [4:0] ex_out;
reg [15:0] immi;

reg flag_beq;

///////////////////////////////////////////////////// given instructions
reg [31:0] memory [31:0];
initial begin
	memory[0] = 32'b000001_00000_00000_00001_00000000000;
	memory[1] = 32'b000010_00111_00000_00000_00000000110;
	memory[2] = 32'b000011_00011_00010_00000_00000000000;
	memory[3] = 32'b000011_00101_00100_00000_00000000000;
	memory[4] = 32'b000100_00010_00100_00010_00000000000;
	memory[5] = 32'b000001_00001_00010_00001_00000000000;
	memory[6] = 32'b000101_00011_00011_00000_00000000100;
	memory[7] = 32'b000101_00101_00101_00000_00000000100;
	memory[8] = 32'b000101_00111_00111_00000_10000000001;
	memory[9] = 32'b000111_00000_00000_00000_00000000111;
	memory[10]= 32'b000000_00000_00000_00000_00000000000;
	memory[11] = 32'b000000_00000_00000_00000_00000000000;
	memory[12] = 32'b000000_00000_00000_00000_00000000000;
	memory[13] = 32'b000000_00000_00000_00000_00000000000;
	memory[14] = 32'b000000_00000_00000_00000_00000000000;
	memory[15] = 32'b000000_00000_00000_00000_00000000000;
	memory[16] = 32'b000000_00000_00000_00000_00000000000;
	memory[17] = 32'b000000_00000_00000_00000_00000000000;
	memory[18] = 32'b000000_00000_00000_00000_00000000000;
	memory[19] = 32'b000000_00000_00000_00000_00000000000;
	memory[20] = 32'b000000_00000_00000_00000_00000000000;
	memory[21] = 32'b000000_00000_00000_00000_00000000000;
	memory[22] = 32'b000000_00000_00000_00000_00000000000;
	memory[23] = 32'b000000_00000_00000_00000_00000000000;
	memory[24] = 32'b000000_00000_00000_00000_00000000000;
	memory[25] = 32'b000000_00000_00000_00000_00000000000;
	memory[26] = 32'b000000_00000_00000_00000_00000000000;
	memory[27] = 32'b000000_00000_00000_00000_00000000000;
	memory[28] = 32'b000000_00000_00000_00000_00000000000;
	memory[29] = 32'b000000_00000_00000_00000_00000000000;
	memory[30] = 32'b000000_00000_00000_00000_00000000000;
	memory[31] = 32'b000000_00000_00000_00000_00000000000;
	//memory[] = 32'b000000_00000_00000_00000_00000000000;
	
end
//////////////////////////////////////////////////////////

//////////////////////////////////////////////////////// MIPS reg
// MIPS registers that stores values.
reg [31:0] register [31:0];
initial begin
	register[0] = 32'b000001_00000_00000_00001_00000000000;
	register[1] = 32'b000010_00111_00000_00000_00000000110;
	register[2] = 32'b000011_00011_00010_00000_00000000000;
	register[3] = 32'b000011_00101_00100_00000_00000000000;
	register[4] = 32'b000100_00010_00100_00010_00000000000;
	register[5] = 32'b000001_00001_00010_00001_00000000000;
	register[6] = 32'b000101_00011_00011_00000_00000000100;
	register[7] = 32'b000101_00101_00101_00000_00000000100;
	register[8] = 32'b000101_00111_00111_00000_10000000001;
	register[9] = 32'b000111_00000_00000_00000_00000000111;
	register[10]= 32'b000000_00000_00000_00000_00000000000;
	register[11] = 32'b000000_00000_00000_00000_00000000000;
	register[12] = 32'b000000_00000_00000_00000_00000000000;
	register[13] = 32'b000000_00000_00000_00000_00000000000;
	register[14] = 32'b000000_00000_00000_00000_00000000000;
	register[15] = 32'b000000_00000_00000_00000_00000000000;
	register[16] = 32'b000000_00000_00000_00000_00000000000;
	register[17] = 32'b000000_00000_00000_00000_00000000000;
	register[18] = 32'b000000_00000_00000_00000_00000000000;
	register[19] = 32'b000000_00000_00000_00000_00000000000;
	register[20] = 32'b000000_00000_00000_00000_00000000000;
	register[21] = 32'b000000_00000_00000_00000_00000000000;
	register[22] = 32'b000000_00000_00000_00000_00000000000;
	register[23] = 32'b000000_00000_00000_00000_00000000000;
	register[24] = 32'b000000_00000_00000_00000_00000000000;
	register[25] = 32'b000000_00000_00000_00000_00000000000;
	register[26] = 32'b000000_00000_00000_00000_00000000000;
	register[27] = 32'b000000_00000_00000_00000_00000000000;
	register[28] = 32'b000000_00000_00000_00000_00000000000;
	register[29] = 32'b000000_00000_00000_00000_00000000000;
	register[30] = 32'b000000_00000_00000_00000_00000000000;
	register[31] = 32'b000000_00000_00000_00000_00000000000;
end
////////////////////////////////////////////////////////

always @ (posedge clock or posedge reset)
begin
	if(reset)
	begin
		state <= s0;
		flag_beq <= 1'b0;
		//r0 <= 0; just a reminder
	end
	else
	begin
		//program_counter <= 5'b00000;
		state <= nstate;
	end
end


always @ (posedge clock or posedge reset)
begin

	case(state)
		s0:
		begin
			//fetch addu $r1 $r0 $r0 ;	// 000001 00000 00000 00001 00000000000
			reg_instruction <= memory[0];
			nstate <= s1;
		end
		
		s1:
		begin
			if(flag_beq == 1'b0)
			begin
				//Decode addu $r1 $r0 $r0 ;	// 000001 00000 00000 00001 00000000000
				op <= reg_instruction[31:26];
				a <= register[reg_instruction[25:21]];
				b <= register[reg_instruction[20:16]];
				rd <= reg_instruction[15:11];
			end
			else
			begin
				//do nothing
			end
			//fetch beq $r7 $r0 done ;   // 000010 00111 00000 00000 00000000110 (done)
			reg_instruction <= memory[1];
			
			nstate <= s2;
		end
		
		s2:
		begin
			if(flag_beq == 1'b0)
			begin
				//execute addu $r1 $r0 $r0 ;	// 000001 00000 00000 00001 00000000000
				register[rd] <= b + a;
			end
			else
			begin
				//do nothing
			end
			
			//Decode beq $r7 $r0 done ;   // 000010 00111 00000 00000 00000000110 (done)
			op <= reg_instruction[31:26];
			a <= register[reg_instruction[25:21]];
			b <= register[reg_instruction[20:16]];
			rd <= reg_instruction[15:11];
			
			//stall
			
			nstate <= s3;
		end
		
		s3:
		begin
			//memory state addu $r1 $r0 $r0 ;	// 000001 00000 00000 00001 00000000000
			
			//execute beq $r7 $r0 done ;   // 000010 00111 00000 00000 00000000110 (done)
			if(a == b)
			begin
				//jump to done label
				nstate <= s18;
				//set some flag to 1
			end
			
			else
			begin
				//fetch $r2 0($r3) ;  			// 000011 00011 00010 00000 00000000000
				reg_instruction <= memory[2];
				
				nstate <= s4;
			end
		end
		
		s4:
		begin
			//writeback addu $r1 $r0 $r0 ;	// 000001 00000 00000 00001 00000000000
			
			//memory beq $r7 $r0 done ;   	// 000010 00111 00000 00000 00000000110 (done)
			
			//decode lw $r2 0($r3) ;  			// 000011 00011 00010 00000 00000000000
			op <= reg_instruction[31:26];
			a <= register[reg_instruction[25:21]];
			b <= register[reg_instruction[20:16]];
			immi <= reg_instruction[15:0];
			
			//fetch lw $r4 0($r5) ;  		// 000011 00101 00100 00000 00000000000
			reg_instruction <= memory[3];
				
			nstate <= s5;
			
		end
		
		s5:
		begin
			//writeback
			
			//execute lw $r2 0($r3) ;  			// 000011 00011 00010 00000 00000000000
			alu_out <= b + {immi[15] ? 14'b11_1111_1111_1111 : 14'b0000_0000_0000_0000, immi};
			atemp   <= a;
			
			//decode lw $r4 0($r5) ;  		// 000011 00101 00100 00000 00000000000
			op <= reg_instruction[31:26];
			a <= register[reg_instruction[25:21]];
			b <= register[reg_instruction[20:16]];
			immi <= reg_instruction[15:0];
			
			nstate <= s6;
			
		end
		
		s6:
		begin
			//memory lw $r2 0($r3) ;  			// 000011 00011 00010 00000 00000000000
			register[atemp] <= memory[alu_out];
			
			//execute lw $r4 0($r5) ;  		// 000011 00101 00100 00000 00000000000
			alu_out <= b + {immi[15] ? 14'b11_1111_1111_1111 : 14'b0000_0000_0000_0000, immi};
			atemp   <= a;
			
			nstate <= s7;
			
		end
		
		s7:
		begin
			//writeback lw $r2 0($r3) ;  			// 000011 00011 00010 00000 00000000000
			
			//memory lw $r4 0($r5) ;  		// 000011 00101 00100 00000 00000000000
			register[atemp] <= memory[alu_out];
			
			nstate <= s8;
			
		end
		
		s8:
		begin
			//writeback lw $r4 0($r5) ;  		// 000011 00101 00100 00000 00000000000
			
			//fetch mul $r2 $r2 $r4 ;    // 000100 00010 00100 00010 00000000000
			reg_instruction <= memory[4];
			
			nstate <= s9;
		end
		
		s9:
		begin
			//decode mul $r2 $r2 $r4 ;    // 000100 00010 00100 00010 00000000000
			op <= reg_instruction[31:26];
			a <= register[reg_instruction[25:21]];
			b <= register[reg_instruction[20:16]];
			rd <= reg_instruction[15:11];
			
			nstate <= s10;
		end
		
		s10:
		begin
			//execute mul $r2 $r2 $r4 ;    // 000100 00010 00100 00010 00000000000
			alu_out <= a * b;
			rdtemp <= rd;
			
			nstate <= s11;
		end
		
		s11:
		begin
			//memory mul $r2 $r2 $r4 ;    // 000100 00010 00100 00010 00000000000
			
			//fetch addu $r1 $r1 $r2 ;   // 000001 00001 00010 00001 00000000000
			reg_instruction <= memory[5];
			
			nstate <= s12;
		end
		
		s12:
		begin
			//writeback mul $r2 $r2 $r4 ;    // 000100 00010 00100 00010 00000000000
			
			//decode addu $r1 $r1 $r2 ;   // 000001 00001 00010 00001 00000000000
			op <= reg_instruction[31:26];
			a <= register[reg_instruction[25:21]];
			b <= register[reg_instruction[20:16]];
			rd <= reg_instruction[15:11];
			
			//fetch 	addiu $r3 $r3 #4 		// 000101 00011 00011 00000 00000000100
			reg_instruction <= memory[6];

			nstate <= s13;
		end
		
		s13:
		begin
			//execute addu $r1 $r1 $r2 ;   // 000001 00001 00010 00001 00000000000
			alu_out <= a + b;
			rdtemp <= rd;
			
			//decode addiu $r3 $r3 #4 		// 000101 00011 00011 00000 00000000100
			op <= reg_instruction[31:26];
			rd <= reg_instruction[25:21];
			b <= register[reg_instruction[20:16]];
			immi <= reg_instruction[15:0];
			
			//fetch addiu $r5 $r5 #4 		// 000101 00101 00101 00000 00000000100
			reg_instruction <= memory[7];
			
			nstate <= s14;
		end
		
		s14:
		begin
			//memory addu $r1 $r1 $r2 ;   // 000001 00001 00010 00001 00000000000
			register[rdtemp] <= alu_out;
			
			//execute addiu $r3 $r3 #4 		// 000101 00011 00011 00000 00000000100
			alu_out <= b + {immi[15] ? 14'b11_1111_1111_1111 : 14'b0000_0000_0000_0000, immi};
			rdtemp <= rd;
			
			//decode addiu $r5 $r5 #4 		// 000101 00101 00101 00000 00000000100
			op <= reg_instruction[31:26];
			rd <= reg_instruction[25:21];
			b <= register[reg_instruction[20:16]];
			immi <= reg_instruction[15:0];
			
			//fetch 	addiu $r7 $r7 #-1 	// 000101 00111 00111 00000 10000000001 (1 means negative)
			reg_instruction <= memory[8];

			nstate <= s15;
		end
		
		s15:
		begin
			//writeback addu $r1 $r1 $r2 ;   // 000001 00001 00010 00001 00000000000
			
			//memory addiu $r3 $r3 #4 		// 000101 00011 00011 00000 00000000100
			register[rdtemp] <= alu_out;
			
			//execute addiu $r5 $r5 #4 		// 000101 00101 00101 00000 00000000100
			alu_out <= b + {immi[15] ? 14'b11_1111_1111_1111 : 14'b0000_0000_0000_0000, immi};
			rdtemp <= rd;
			
			//decode addiu $r7 $r7 #-1 	// 000101 00111 00111 00000 10000000001 (1 means negative)
			op <= reg_instruction[31:26];
			rd <= reg_instruction[25:21];
			b <= register[reg_instruction[20:16]];
			immi <= reg_instruction[15:0]; //value should be one because we are subtracting (hardcoded)
			
			//fetch j loop                  // 000111 00000 00000 00000 00000000111 (loop)
			reg_instruction <= memory[9];
			
			nstate <= s16;
		end
		
		s16:
		begin
			//writeback addiu $r3 $r3 #4 		// 000101 00011 00011 00000 00000000100
			
			//memory addiu $r5 $r5 #4 		// 000101 00101 00101 00000 00000000100
			register[rdtemp] <= alu_out;
			
			//execute addiu $r7 $r7 #-1 	// 000101 00111 00111 00000 10000000001 (1 means negative)
			alu_out <= b - {immi[15] ? 14'b11_1111_1111_1111 : 14'b0000_0000_0000_0000, immi};
			rdtemp <= rd;
			
			//decode j loop                  // 000111 00000 00000 00000 00000000111 (loop)
			op <= reg_instruction[31:26];
			rd <= reg_instruction[25:21];
			b <= register[reg_instruction[20:16]];
			immi <= reg_instruction[15:0];
			
			nstate <= s17;
		end
		
		s17:
		begin
			//writeback addiu $r5 $r5 #4 		// 000101 00101 00101 00000 00000000100
			
			//memory addiu $r7 $r7 #-1 	// 000101 00111 00111 00000 10000000001 (1 means negative)
			register[rdtemp] <= alu_out;
			
			//execute j loop                  // 000111 00000 00000 00000 00000000111 (loop)
			flag_beq <= 1'b1;
			nstate <= s1;
		end
		
		s18:
		begin
			//jr $31
		end
		
		//default:
	endcase
	
end


endmodule





/*
reg [5:0] op;
reg [4:0] r0, r2, r3, r1, r4, r5, r6, r7, r8, r9;

reg [31:0] memory [0:7];

reg [4:0] temp1, temp2, temp3;
/////////////////////////////////////////////////
//reg [31:0] memory[0] = 0;
/////////////////////////////////////////////////

//reg [4:0] rd;
//reg [10:0] shift_func; 

//memory block. can be variable
initial begin

	memory[0] = 8'd0;
	memory[1] = 8'd1;
	memory[2] = 8'd2;
	memory[3] = 8'd3;
	memory[4] = 8'd4;
	memory[5] = 8'd5;
	memory[6] = 8'd6;
	memory[7] = 8'd7;

end

always @ (posedge clock or posedge reset)
begin
	if(reset)
		state <= s0;
		//r0 <= 0; just a reminder
	else
		state <= nstate;
end

wire [4:0] source1, source2;
reg  [4:0] dest;

assign source1 = memory[temp1] ;
assign source2 = memory[temp2] ;
//assign memory[temp3] = memory[temp3] ;

////combinational logic
//always @ (*)
//begin
//
////	if(get_)
//	
//	source1 <= memory[temp1] ;
//	source2 <= memory[temp2] ;
//end


//sequential logic


endmodule
*/

