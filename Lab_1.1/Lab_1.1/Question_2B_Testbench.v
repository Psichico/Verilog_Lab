module Question_2B_Testbench();
	
	reg x1,x2,x3,x4; //be carefull to not change the size of Reg in testbench vs code
	wire a,b,c,f;
	
	Question_2B psichico(.x1(x1), .x2(x2), .x3(x3), .x4(x4), .a(a), .b(b), .c(c), .f(f));
	
		initial begin
		
			#20;
			x1 = 1'b0;
			x2 = 1'b0;
			x3 = 1'b0;
			x4 = 1'b0;
			#20;
			x1 = 1'b1;
			x2 = 1'b0;
			x3 = 1'b1;
			x4 = 1'b0;
			#20;
			x1 = 1'b0;
			x2 = 1'b1;
			x3 = 1'b0;
			x4 = 1'b1;
			#20;
			x1 = 1'b1;
			x2 = 1'b1;
			x3 = 1'b0;
			x4 = 1'b0;
			#20;
			x1 = 1'b0;
			x2 = 1'b0;
			x3 = 1'b1;
			x4 = 1'b1;
			#20;
			x1 = 1'b1;
			x2 = 1'b1;
			x3 = 1'b1;
			x4 = 1'b1;
			#20;
		end
endmodule
			