//Gate level coding
//Code by Psichico (https://github.com/Psichico)

module Question_1B(x1, x2, x3, x4, f, a, b, c, d, g, h); //in Xilinx the order of all the parameters in here matters.
			
	input x1, x2, x3, x4;
	output f, a, b, c, d, g, h;
	wire a, b, c, d, g, h;

	and (a, x1, x3);
	and (b, x2, x4);
	or (c, x1, ~x3);  //Use of ~ or ! varies.
	or (d, ~x2, x4);
	or (g, a, b);
	and (h, c, d);
	or (f, g, h);
	
endmodule
