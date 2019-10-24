// 4x1 Multiplexer with conditional operator
//Code by Psichico (https://github.com/Psichico)

module Question_7(in, sel, out, enable);

	input [3:0] in;
	input [1:0] sel;
	input enable;
	output out;
	
	
	assign out = sel[0] ? (sel[1] ? in[0]:in[1]) : (sel[1] ? in[2]:in[3]);
/*	assign a = in[3] & sel[0] & sel[1];
	assign b = in[2] & sel[0] & ~sel[1];
	assign c = in[1] & ~sel[0] & sel[1];
	assign d = in[0] & ~sel[0] & ~sel[1];
*/	


endmodule