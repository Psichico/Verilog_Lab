//Code for 8x3 encoder. First
//Code by Psichico (https://github.com/Psichico)

module Question_6_one (in, out, enable);

	input [7:0] in;
	output[2:0] out;
	input enable;
	
	//always @ (in or enable)
	//begin

	 assign out[2] = in[7] | in[6] | in[5] | in[4];
	 assign out[1] = in[7] | in[6] | in[3] | in[2];
	 assign out[0] = in[7] | in[5] | in[3] | in[1];
		
	//end
	
endmodule
		