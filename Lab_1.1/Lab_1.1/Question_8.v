//Code for Half Adder
//Code by Psichico (https://github.com/Psichico)

module Question_8(a, b, cout, sum);

	input a,b;
	output cout, sum;
	
	and(cout, a,b);
	xor(sum, a,b);
	
endmodule
	