//Code for 3x8 decoder. Second, using register
//Code by Psichico (https://github.com/Psichico)

module Question_5_two(in, out, enable);

	input [2:0] in;
	input enable;
	output [7:0] out;
	wire [7:0] out;

	initial begin
		
		assign out = enable ? 
	
		