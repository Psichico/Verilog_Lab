
module Question_2A_Testbench();

	reg x1,x2,x3,x4;
	wire f,a,b,c,d,e;
	
	Question_2A psichico(.x1(x1), .x2(x2), .x3(x3), .x4(x4), .f(f), .a(a), .b(b), .c(c), .d(d), .e(e));
	
	initial begin
	
		x1 = 1;
		x2 = 1;
		x3 = 1;
		x4 = 1;
		#50;
		
		forever begin
			x1 = ~x1;
			#10
			x2 = ~x2;
			#10
			x3 = ~x3;
			#10
			x4 = ~x4;		
			#10;
		end
		$finish; //Most important command when using Forever loop
	end
	
endmodule
	
	