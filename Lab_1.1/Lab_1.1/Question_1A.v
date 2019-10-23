//Gate level coding
//Code by Psichico (https://github.com/Psichico)

module Question_1A(a,b,x,c,d); //every parameter here should be declared as input or output

	input a,b;
	output x,c,d;
	wire c,d;
		
	and (c, ~a, b);
	and (d, a, ~b);
	or  (x, c, d);
	
	initial begin
		$display("\n \n Question 1A || Gate Level Coding \n \n");
	end

endmodule