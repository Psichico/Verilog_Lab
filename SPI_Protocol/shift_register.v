module shift_register( clk, reset);
	
	input clk;
	input reset;
	
	reg [7:0] master;
	reg [7:0] slave;
	
	reg [3:0] counter_1;
	reg [3:0] counter_2;
	
	always @ (posedge clk or negedge reset)
	begin
		if(reset==1)
		begin
			master <= 8'b11110000;
			slave <= 8'b00001111;
		end
		
		else
		begin
			if(clk == 1)
			begin
				master[counter_2] <= slave[counter_2];
			end
		end
	end
	
	always @ (posedge clk or negedge reset)
	begin
		if(reset==1)
		begin
			counter_1 <= 4'h0;
			counter_2 <= 4'h7;
		end
		
		else
		begin
			if(clk==1 && counter_1 != 4'h7 && counter_2 != 4'h0)
			begin
				counter_1 <= counter_1 + 4'h1;
				counter_2 <= counter_2 - 4'h1;
			end
		
		end
	end
endmodule
