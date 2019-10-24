// 4 to 1 Multiplexer. First way
//Code by Psichico (https://github.com/Psichico)

module Question_3_one(a,b,c,d,s0,s1,x1,x2,x3,x4,f);

	input a,b,c,d;
	input s0,s1;
	output x1,x2,x3,x4,f;
	
	initial begin
	
		and(x1,a,s0,s1);
		and(x2,b,s0,~s1);
		and(x3,c,~s0,s1);
		and(x4,d,~s0,~s1);
		
		or(f,x1,x2,x3,x4);
		
	end
	
endmodule