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

always @ (posedge clock or posedge reset)
begin
	if(reset)
		state <= s0;
		//r0 <= 0; just a reminder
	else
		state <= nstate;
end

wire [4:0] source1, source2;

assign source1 = memory[temp1] ;
assign source2 = memory[temp2] ;

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
			
			
			//Decode
			op <= instruction_reg[31:26];
			rs <= instruction_reg[25:21];
			rt <= instruction_reg[20:16];
			rd <= instruction_reg[15:11];
			//fetch
			instruction_reg <= instruction;
			
			nstate <= s2;
		end
		
		
		
		//default:
	endcase
	
end

endmodule
