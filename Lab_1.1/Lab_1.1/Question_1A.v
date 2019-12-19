//Gate level coding
//Code by Psichico (https://github.com/Psichico)

module Question_1A(a,b,x,c,d); //All the input and output must be declared.
										 //Ignore the wire and reg.

	input a,b;
	output x,c,d;
	wire c,d;
		
	and (c, ~a, b);
	and (d, a, ~b);
	or  (x, c, d);
	
	initial begin               // If you want to display in simulation
		$display("\n \n Question 1A || Gate Level Coding \n \n");
	end

endmodule