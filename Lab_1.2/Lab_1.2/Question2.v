
module Question2(s0,s1,s2,D,y0,y1,y2,y3,y4,y5,y6,y7);

	input s0,s1,s2;
	input D;
	output y0,y1,y2,y3,y4,y5,y6,y7;
	
	wire a,b,c,d,e,f;
	
	demux2x1 uut1(.s(s0),.d(D),.y0(a),.y1(b));
	demux2x1 uut2(.s(s1),.d(a),.y0(c),.y1(d));
	demux2x1 uut3(.s(s1),.d(b),.y0(e),.y1(f));

	demux2x1 uut4(.s(s2),.d(c),.y0(y0),.y1(y1));
	demux2x1 uut5(.s(s2),.d(d),.y0(y2),.y1(y3));
	demux2x1 uut6(.s(s2),.d(e),.y0(y4),.y1(y5));
	demux2x1 uut7(.s(s2),.d(f),.y0(y6),.y1(y7));

endmodule

module demux2x1(s,d,y0,y1);
	
	input s;
	input d;
	output y0,y1;
	
	assign y0 = s & d;
	assign y1 = ~s & d;

endmodule