////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:28:10 02/02/2020
// Design Name:   SPI_main
// Module Name:   A:/Cloud/Git/Verilog_Lab/SPI_Protocol/SPI_testbench_1.v
// Project Name:  SPI_Protocol
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SPI_main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SPI_testbench_1;

	// Inputs
	reg miso;
	reg [0:7] m_reg;
	reg [0:7] s_reg;
	reg get_data;
	reg global_clk;
	reg reset;

	// Outputs
	wire mosi;
	wire ss;

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
	
	always #1 global_clk = ~global_clk;

	initial begin
		// Initialize Inputs
		miso = 0;
		m_reg = 0;
		s_reg = 0;
		get_data = 0;
		global_clk = 0;
		reset = 1;
		#1;
		reset = 0;
		#1;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
		reset = 0;
		m_reg = 8'b11110000;
		s_reg = 8'b00001111;
		#100;
		get_data= 1'b0;
		#1;
		get_data= 1'b1;
		#1;
		get_data= 1'b0;
		
		#1000;
        
		// Add stimulus here

	end
      
endmodule

