module Question_5_one_Testbench();

	reg s1,s2,s3;
	reg enable;
	wire z1, z2, z3, z4, z5, z6, z7, z8;
	
	Question_5_one psichico(.s3(s3), .s1(s1), .s2(s2), .z1(z1), .z2(z2), .z3(z3), .z4(z4), .z5(z5), .z6(z6), .z7(z7), .z8(z8), .enable(enable) );
	
	initial begin
		#2;
		enable = 1;
		#2;
		repeat(100)
		begin
			s1 = 0;
			s2 = 0;
			s3 = 0;
			#2;
		end
		#2;
	end
endmodule