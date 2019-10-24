//Code for 3x8 decoder. First
//Code by Psichico (https://github.com/Psichico)

module Question_5_one(z1,z2,z3,z4,z5,z6,z7,z8,s1,s2,s3,enable);

	output z1, z2, z3, z4, z5, z6, z7, z8;
	input s1, s2, s3;
	input enable;

//	if (enable == 1'b1)
//	begin
		and (z1, s1, s2, s3);
		and (z2, s1, s2, ~s3);
		and (z3, s1, ~s2, s3);
		and (z4, s1, ~s2, ~s3);
		and (z5, ~s1, s2, s3);
		and (z6, ~s1, s2, ~s3);
		and (z7, ~s1, ~s2, s3);
		and (z8, ~s1, ~s2, ~s3);
	
//	end

endmodule