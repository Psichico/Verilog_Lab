module Question1B_Testbench();

	// Inputs
	reg x1;
	reg x2;
	reg x3;
	reg x4;

	// Outputs
	wire f;
	wire a;
	wire b;
	wire c;
	wire d;
	wire g;
	wire h;

	// Instantiate the Unit Under Test (UUT)
	Question_1B psichico(
		.x1(x1), 
		.x2(x2), 
		.x3(x3), 
		.x4(x4), 
		.f(f), 
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.g(g), 
		.h(h)
	);

	initial begin
		// Initialize Inputs
		x1 = 0;
		x2 = 0;
		x3 = 0;
		x4 = 0;
		#50
		
		forever begin 
		x1 = ~x1;
		#10
		x2 = ~x2;
		#10
		x3 = ~x3;
		#10
		x4 = ~x4;		
		#10;
		end
		$finish; //make a habit of using finish command when you use forever loop
	end
      
endmodule

