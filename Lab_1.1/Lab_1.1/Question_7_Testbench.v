//Improve the functionality

module Question_7_Testbench();

	reg [3:0] in;
	reg [1:0] sel;
	reg enable;
	wire out;
	
	Question_7 psichico(.in(in), .sel(sel), .enable(enable), .out(out));
	
	initial begin
	
		#5;
		enable = 1; //add code to use enable??????
		#5;
		in = 4'b1010;
		#50;
		sel = 2'b00;
		#50;
		sel = 2'b01;
		#50;
		sel = 2'b10;
		#50;
		sel = 2'b11;
		#50;
		
	end
endmodule