
module Question1(d0,d1,d2,d3,d4,d5,d6,d7, s0, s1, s2, y );
	
	input d0,d1,d2,d3,d4,d5,d6,d7, s0, s1, s2;
	output y;
	
	wire a1,a2,a3,a4;
	wire b1,b2;

	mux2x1 uut1(.d0(d0), .d1(d1), .s(s0), .y(a1));
	mux2x1 uut2(.d0(d2), .d1(d3), .s(s0), .y(a2));
	mux2x1 uut3(.d0(d4), .d1(d5), .s(s0), .y(a3));
	mux2x1 uut4(.d0(d6), .d1(d7), .s(s0), .y(a4));
	mux2x1 uut5(.d0(a1), .d1(a2), .s(s1), .y(b1));
	mux2x1 uut6(.d0(a3), .d1(a4), .s(s1), .y(b2));
	mux2x1 uut7(.d0(b1), .d1(b2), .s(s2), .y(y));
	
endmodule


module mux2x1(d0,d1,s,y);
	
	input d0, d1;
	input s;
	output y;
	
	assign y = s ? d0 : d1;

endmodule
