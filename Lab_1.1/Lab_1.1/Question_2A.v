//Code by Psichico (https://github.com/Psichico)

module Question_2A(x1, x2, x3, x4, f, a, b, c, d, e);

	input x1, x2, x3, x4;
	output f,a,b,c,d,e;
	wire f,a,b,c,d,e;
	
	assign a = x1 & ~x3 ;
	assign b = x2 & ~x3 ; 
	assign c = ~x3 & ~x4 ;
	assign d = x1 & x2;
	assign e = x1 & ~x4;
	assign f = a | b | c | d | e;
	

endmodule
