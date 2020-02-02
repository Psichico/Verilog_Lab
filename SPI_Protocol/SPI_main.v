
module SPI_main(mosi, miso, ss, m_reg, s_reg, get_data, global_clk, reset); //get_data = signal that tells master to get data from slave

	
	output mosi;
	input miso;
	input ss;
	
	input [0:7] m_reg;
	input [0:7] s_reg;
	
	reg [0:7] m_buffer;
	reg [0:7] s_buffer;
	
	input get_data;
	input global_clk;
	input reset;
	
	reg [23:0] counter_clk;
	
	reg sclk;
	
	// SPI clock generator
	always @ (posedge global_clk or negedge reset)
	begin
		
		if(reset != 1) //if not reset, then begin the process
		begin
				
				if(counter_clk != 24'h17D784) // decimal 1562500. 50Mhz / 32 24'h17D784
				begin
					counter_clk <= counter_clk + 1;
				end
				
				else
				begin
					counter_clk <= 24'h000000;
					sclk <= ~sclk;
				end
		end
		
		else
		begin
			counter_clk <= 0;
			sclk <= 0;
		end	
	
	end
	

endmodule
