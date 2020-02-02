
module Question4(in,out);

	input [15:0] in;
	output [3:0] out;
	
	wire [7:0] c;

	encoder4x2 uut1(.a(in[3:1]),.y(c[1:0]));
	encoder4x2 uut2(.a(in[7:5]),.y(c[3:2]));
	encoder4x2 uut3(.a(in[11:9]),.y(c[5:4]));
	encoder4x2 uut4(.a(in[15:13]),.y(c[7:6]));
	
	encoder4x2 uut5(.a(c[3:1]),.y(out[1:0]));
	encoder4x2 uut6(.a(c[7:5]),.y(out[3:2]));

	initial begin
		$monitor ("/n input = %b,  output = %h ",in, out);
	end
endmodule

module encoder4x2(a,y);

	input [3:1] a;
	output [1:0] y;
	
	assign y[0] = a[1] | a[3];
	assign y[1] = a[2] | a[3];
	
endmodule

