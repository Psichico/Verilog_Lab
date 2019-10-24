// 4 to 1 Multiplexer. Second way
//Code by Psichico (https://github.com/Psichico)

module Question_3_two(a,b,c,d,s0,s1,out);

	input a,b,c,d;
	input s0,s1;
	output out;
	
	assign out = s0 ? (s1 ? a:b) : (s1 ? c:d);
	
endmodule