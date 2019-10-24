module Question_3_one_Testbench();
	reg a,b,c,d,s0,s1;
	wire x1,x2,x3,x4,f;
	
	Question_3_one psichico(.a(a), .b(b), .c(c), .d(d), .s0(s0), .s1(s1), .x1(x1), .x2(x2), .x3(x3), .x4(x4), .f(f));
	
	initial begin
		//select each input a,b,c,d, one by one
		#200;
		a = 1;
		b = 1;
		c = 1;
		d = 1;
		#20;
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
		