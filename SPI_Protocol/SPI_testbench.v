
module SPI_testbench;

	// Inputs
	reg miso;
	reg ss;
	reg [0:7] m_reg;
	reg [0:7] s_reg;
	reg get_data;
	reg global_clk;
	reg reset;

	// Outputs
	wire mosi;

	// Instantiate the Unit Under Test (UUT)
	SPI_main uut (
		.mosi(mosi), 
		.miso(miso), 
		.ss(ss), 
		.m_reg(m_reg), 
		.s_reg(s_reg), 
		.get_data(get_data), 
		.global_clk(global_clk), 
		.reset(reset)
	);

	always #0.1 global_clk = ~global_clk;
	
	initial begin
		// Initialize Inputs
		miso = 0;
		ss = 0;
		m_reg = 0;
		s_reg = 0;
		get_data = 0;
		global_clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		reset = 0;
		
		#1000000;
        
		// Add stimulus here

	end
      
endmodule

