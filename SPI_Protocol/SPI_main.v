
module SPI_main(mosi, miso, ss, m_reg, s_reg, get_data, global_clk, reset); //get_data = signal that tells master to get data from slave

	
	output mosi;
	input miso;
	output reg ss;
	
	input [0:7] m_reg;
	input [0:7] s_reg;
	
	reg [0:7] m_buffer;
	reg [0:7] s_buffer;
	
	input get_data;
	input global_clk;
	input reset;
	
	reg [23:0] counter_clk;
	reg busy_flag;
	reg sclk;
	reg [3:0] posedge_counter;
	
	// SPI clock generator
	always @ (posedge global_clk or negedge reset)
	begin
		
		if(reset != 1) //if not reset, then begin the process
		begin
		
				if(counter_clk != 24'h000011) // decimal 1562500. 50Mhz / 32 24'h17D784
				begin
					counter_clk <= counter_clk + 1'b1;
				end
				
				else
				begin
					sclk <= ~sclk;
					counter_clk <= 24'h000000;
				end
		end
		
		else
		begin
			counter_clk <= 0;
			sclk <= 0;
			busy_flag <= 1'b1;
			posedge_counter <= 4'b0000;
		end	
	
	end
	
	//Master side processes
	always @ (posedge global_clk or negedge reset)
	begin
	
		if(reset!=1)
		begin
			if(get_data==1) //get_data should be a pulse
			begin
				m_buffer <= m_reg;
				busy_flag <= 1'b1;
				ss <= 1'b0;
				s_buffer <= s_reg;
			end
			
			else
			begin
				busy_flag <= busy_flag; //unnecessary
			end
		end
		
		else
		begin
			busy_flag <= 1'b0;
			ss <= 1'b1;
		end
	
	end
	
	//send data to slave
	always @ (posedge sclk or negedge reset)// or posedge_counter)
	begin
		
		posedge_counter <= posedge_counter + 1'b1;
		
		if(reset!=1)
		begin
			if(posedge_counter != 4'h08 && busy_flag == 1'b1)
			begin
				s_buffer[0] <= m_buffer[7];
				s_buffer <= s_buffer >> 1;
				m_buffer <= m_buffer >> 1;
				
			end
			else
			begin
				busy_flag <= 1'b0; 
			end
			
			
		end
		
		else
		begin
			posedge_counter <= 8'h00;
		end
	
		
		
	end
	

endmodule
