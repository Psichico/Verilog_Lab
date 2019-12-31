
module Question3_testbench( );

	reg [3:0] in;
	wire [15:0] out;

	Question3 tb1(.in(in),.out(out));
	
	initial begin
		
		in = 4'b0000;
		#200;
		in = 4'h0;
		#10;
		in = 4'h1;
		#10;
		in = 4'h2;
		#10;
		in = 4'h3;
		#10;
		in = 4'h4;
		#10;
		in = 4'h5;
		#10;
		in = 4'h6;
		#10;
		in = 4'h7;
		#10;
		in = 4'h8;
		#10;
		in = 4'h9;
		#10;
		in = 4'hA;
		#10;
		in = 4'hB;
		#10;
		in = 4'hC;
		#10;
		in = 4'hD;
		#10;
		in = 4'hE;
		#10;
		in = 4'hF;
		#10;
		#100;
	/*	repeat(100)
		begin
			in = $random;
			#10;
		end
	*/
	
		
		
	end
endmodule
