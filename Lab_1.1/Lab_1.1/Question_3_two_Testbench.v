module Question_3_two_Testbench();

	reg a,b,c,d;
	reg s0,s1;
	wire out;
	
	Question_3_two psichico(.a(a), .b(b), .c(c), .d(d), .s0(s0), .s1(s1), .out(out));
	
	initial begin
	
		#20;
		a = 1;
		b = 1;
		c = 1;
		d = 1;
		#50;
		s0 = 0;
		s1 = 0;
		#50;
		s0 = 0;
		s1 = 1;
		#50;
		s0 = 1;
		s1 = 0;
		#50;
		s0 = 1;
		s1 = 1;
		#50;
		
	end
	
endmodule