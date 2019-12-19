module Question_1A_Testbench();		//input becomes reg and output becomes wire

	// Inputs
	reg a;
	reg b;
	wire c;
	wire d;

	// Outputs
	wire x;

	// Instantiate the Unit Under Test (UUT)
	Question_1A psichico(.a(a), .b(b), .x(x), .c(c), .d(d) ); //testbench module name can be anything. I used 'psichico'
																				 

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
	
		// Wait 100 ns for global reset to finish
		#100;
		
		a = 0;
		b = 1;
		#10
		a = 1;
		b = 0;
		#10
		a = 0;
		b = 0;
	   #10
		a = 1;
		b = 0;
		#10
		a = 1;
		b = 1;
		#10
		a = 1;
		b = 0;
	   #10;
		// Add stimulus here

	end
      
endmodule
