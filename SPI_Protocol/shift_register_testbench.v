
module shift_register_testbench;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	shift_register uut (
		.clk(clk), 
		.reset(reset)
	);

//	always #1 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		#10;
		
		reset = 1;
		clk = 0;
		#10;
		clk = 1;
		#10;
		clk = 0;
		#10;
		
		clk = 1;
		#10;
		clk = 0;
		#10;
		
		
		#100;
		reset = 0;
		#100;
		clk = 0;
		#10;
		clk = 1;
		#10;
		clk = 0;
		#10;
		
		clk = 1;
		#10;
		clk = 0;
		#10;
		
		clk = 1;
		#10;
		clk = 0;
		#10;
		
		clk = 1;
		#10;
		clk = 0;
		#10;
		
		clk = 1;
		#10;
		clk = 0;
		#10;
		
		clk = 1;
		#10;
		clk = 0;
		#10;
		
		clk = 1;
		#10;
		clk = 0;
		#10;
		
		clk = 1;
		#10;
		clk = 0;
		#10;
		
		reset = 1;
		#100;
		
        
		// Add stimulus here

	end
      
endmodule

