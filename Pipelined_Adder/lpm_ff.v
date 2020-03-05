
module lpm_ff(data,q,clock);
	
	parameter lpm_width =2; 
	
	input [lpm_width - 1:0] data;
	output reg [lpm_width - 1:0] q;
	input clock;

	always @(posedge clock)
	begin
		q <= data;
	end

endmodule

