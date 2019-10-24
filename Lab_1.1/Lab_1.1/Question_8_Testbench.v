module Question_8_Testbench();

	reg a,b;
	wire cout, sum;
	
	Question_8 psichico(.a(a), .b(b), .cout(cout), .sum(sum));
	
	initial begin
	
		#20;
		a = 0;
		b = 0;
		#20;
		a = 0;
		b = 1;
		#20;
		a = 1;
		b = 0;
		#20;
		a = 1;
		b = 1;
		#20;
	end
	
endmodule
		