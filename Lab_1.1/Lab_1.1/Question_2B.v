//Code by Psichico (https://github.com/Psichico)

module Question_2B(x1,x2,x3,x4,a,b,c,f);
	
	input x1,x2,x3,x4;
	output a,b,c,f;
	
	//No need for initial begin when using assign statements
	assign a = x1 | ~x3; 
	assign b = x1 | x2 | ~x4;
	assign c = x2 | ~x3 | ~x4;
	assign f = a & b & c;
		
endmodule
		