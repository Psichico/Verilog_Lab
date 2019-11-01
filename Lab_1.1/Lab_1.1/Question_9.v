//Code for Full Adder.
//Code by Psichico (https://github.com/Psichico)

module Question_9(a,b,cin,carryout,sum,c,d,e);

	input  a,b,cin;
	output carryout, sum;
	output c,d,e;
	
	assign c = a ^ b;
	assign sum = cin ^ c;
	assign d = c & 
	
	
