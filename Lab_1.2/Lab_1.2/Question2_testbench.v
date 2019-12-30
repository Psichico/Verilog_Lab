
module Question2_testbench();

	reg s0,s1,s2;
	reg D;
	wire y0,y1,y2,y3,y4,y5,y6,y7;
	
	Question2 tb1(s0,s1,s2,D,y0,y1,y2,y3,y4,y5,y6,y7);

	initial begin
	
		s0 = $random;
		s1 = $random;
		s2 = $random;
		D = $random;
		#50;
		repeat(100)
		begin
			s0 = $random;
			s1 = $random;
			s2 = $random;
			D = $random;
			#10;
		end
		
	end
	
endmodule
