
module Question1_testbench();

	reg d0,d1,d2,d3,d4,d5,d6,d7, s0, s1, s2;
	wire y;

	Question1 tb1(.d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7), .s0(s0), .s1(s1), .s2(s2), .y(y));
	
	initial begin
	
		d0 = $random;
		d1 = $random;
		d2 = $random;
		d3 = $random;
		d4 = $random;
		d5 = $random;
		d6 = $random;
		d7 = $random;
		#10;
		s0 = 0;
		s1 = 0;
		s2 = 0;
		#100;
		repeat(100)
		begin
		d0 = $random;
		d1 = $random;
		d2 = $random;
		d3 = $random;
		d4 = $random;
		d5 = $random;
		d6 = $random;
		d7 = $random;
		#10;
		s0 = $random;
		s1 = $random;
		s2 = $random;
		#100;
		end
		
	
	end
	
	
endmodule
