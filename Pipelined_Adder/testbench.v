module add_1p_testbench();
  
  reg [14:0] X,Y; //inputs
  wire [14:0] sum; //result
  reg clk; //clock
   
  add_1p uut(.X(X),.Y(Y),.sum(sum),.clk(clk));
  
  always #1 clk = ~clk;
  
  initial begin
		$monitor("X=%d, Y=%d, sum=%d", X, Y, sum);
  end
  
  initial begin
		$dumpfile("dump.vcd");
		$dumpvars();
  end
  
  initial begin
		clk = 0;
		#5;
		X = 14'd10;
		Y = 14'd00;
		#10;
		X = 14'b0000_1111_1010_01;
		Y = 14'b0000_1111_1010_01 ;
		#10;
		X = 14'b1111_0000_0101_11 ;
		Y = 14'b1111_0000_1010_10 ;
		#10;
		X = 14'b1111_1010_0000_11 ;
		Y = 14'b0000_1111_1111_11 ;
		#1000;
		$finish;
  end
  
endmodule
