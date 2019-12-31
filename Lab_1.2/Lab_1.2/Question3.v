
module Question3(in,out);

	input [3:0] in;
	output [15:0] out;
	
	wire [7:0] c;
	
	decoder2x4 uut1(.a(in[1:0]),.d(c[3:0]));
	decoder2x4 uut2(.a(in[3:2]),.d(c[7:4]));
	
	assign out[0] = c[0] & c[4];
	assign out[4] = c[0] & c[5];
	assign out[8] = c[0] & c[6];
	assign out[12] = c[0] & c[7];
	
	assign out[1] = c[1] & c[4];
	assign out[5] = c[1] & c[5];
	assign out[9] = c[1] & c[6];
	assign out[13] = c[1] & c[7];
	
	assign out[2] = c[2] & c[4];
	assign out[6] = c[2] & c[5];
	assign out[10] = c[2] & c[6];
	assign out[14] = c[2] & c[7];
	
	assign out[3] = c[3] & c[4];
	assign out[7] = c[3] & c[5];
	assign out[11] = c[3] & c[6];
	assign out[15] = c[3] & c[7];
	
	initial begin
	
		$monitor("/n in = %b , out = %b ",in,out);
	
	end

endmodule

module decoder2x4(a,d);

	input [1:0] a;
	output [3:0] d;
	
	assign d[0] = ~a[0] & ~a[1];
	assign d[1] = a[0] & ~a[1];
	assign d[2] = ~a[0] & a[1];
	assign d[3] = a[0] & a[1];
	
endmodule

