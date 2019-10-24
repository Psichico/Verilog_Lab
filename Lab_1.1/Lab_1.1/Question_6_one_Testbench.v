module Question_6_one_Testbench();

	reg [7:0] in;
	wire [2:0] out;
	reg enable;
	
	Question_6_one psichico(.in(in), .out(out), .enable(enable));
	
	initial begin;
	
		#5;
		enable = 1; // how to use the enable in the code?????
		#50;
		in = 8'b00000001;
		#50;
		in = 8'b00000010;
		#50;
		in = 8'b00000100;
		#50;
		in = 8'b00001000;
		#50;
		in = 8'b00010000;
		#50;
		in = 8'b00100000;
		#50;
		in = 8'b01000000;
		#50;
		in = 8'b10000000;
		#50;
		
	end
	
endmodule