`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:42 04/14/2020 
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
module main(
	input clock,
	input [31:0] instruction,
	input reset
    );

parameter s1 = 8'd1;
parameter s2 = 8'd2;
parameter s3 = 8'd3;
parameter s4 = 8'd4;

reg [7:0] state, nstate;
reg [32:0] instruction_reg;

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
always @ (posedge clock or posedge reset)
begin

	case(state)
		s0:
		begin
			instruction_reg <= instruction;
			nstate <= s1;
		end
		
		s1:
		begin
			//Decode
			op <= instruction_reg[31:26];
			temp1 <= instruction_reg[25:21];
			temp2 <= instruction_reg[20:16];
			
			temp3 <= instruction_reg[15:11];
			//fetch
			instruction_reg <= instruction;
			
			nstate <= s2;
		end
		
		s2:
		begin
			//execute
			alu_out <= source1 + source2;
			
			
			//Decode
			op <= instruction_reg[31:26];
			temp1 <= instruction_reg[25:21];
			temp2 <= instruction_reg[20:16];
			temp3 <= instruction_reg[15:11];
			
			nstate <= s3;
		end
		
		s3:
		begin
			//memory state
			dest <= alu_out;
			
			//execute
			if(source1 == source2)
			begin
				//jump to done label
			end
			
			else
			begin
				//fetch
				instruction_reg <= instruction;
				
				nstate <= s4;
			end
		end
		
		s4:
		begin
			//writeback
			memory[temp3] <= dest;
			
			//memory
			
			//decode
			op <= instruction_reg[31:26];
			temp1 <= instruction_reg[25:21];
			temp2 <= instruction_reg[20:16];
			temp3 <= instruction_reg[15:11];
			
			//fetch
			instruction_reg <= instruction;
				
			nstate <= s5;
			
		end
		
		s5:
		begin
			//writeback
			
			//execute of lw $r2 0($r3)
			alu_out <= source1 + source2;
			
			//decode lw $r4 0($r5)
			op <= instruction_reg[31:26];
			temp1 <= instruction_reg[25:21];
			temp2 <= instruction_reg[20:16];
			temp3 <= instruction_reg[15:11];
			
			//
			
		end
		
		
		
		//default:
	endcase
	
end

endmodule
