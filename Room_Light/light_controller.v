//`timescale 1ns / 1ps

module light_controller( clk, reset, s1, s2, light  );

	input clk;
	input reset;
	input s1, s2;
	output light;
	
	int [32:0] counter = 32'b0;
	
	parameter state_off = 1'b0;
	parameter state_on = 1'b1;
	
	reg state;
	wire nstate;
	
	always @ (posedge clk or reset)
	begin
		if(reset)
		begin
			state <= state_off;
		end
		else
		begin
			state <= nstate;
		end
	end
	
	always @ (posedge clk or reset)
	begin
		
		if (reset)
		begin
			counter <= 32'b0;
			light <= 0;
		end
		
		else
		begin
			case (state)
			
			state_off: if(s1 == 1)
							begin
								if ()
							end
			
			
		end
		
	
	
	end

endmodule
