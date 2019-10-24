module Question_4_Testbench();

	reg data;
	reg s0, s1;
	wire a, b, c, d;
	
	Question_4 psichico(.data(data), .s0(s0), .s1(s1), .a(a), .b(b), .c(c), .d(d));
	
	initial begin
	
		#20;
		data = 1;
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