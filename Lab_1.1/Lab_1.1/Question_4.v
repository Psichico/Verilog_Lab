//Code for 1x4 Demultiplexer
//Code by Psichico (https://github.com/Psichico)


module Question_4(data,s0,s1,a,b,c,d);
	
	input data;
	input s0,s1;
	output a,b,c,d;
	
	and (a, data, s0, s1);
	and (b, data, s0, ~s1);
	and (c, data, ~s0, s1);
	and (d, data, ~s0, ~s1);
	
endmodule
