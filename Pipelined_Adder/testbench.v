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
		#2;
		X = 15'd10;
		Y = 15'd00;
		#10;
		X = 15'b0000_1111_1010_010;
		Y = 15'b0000_1111_1010_010 ;
		#10;
		X = 15'b0000_1111_1111_111;
		Y = 15'b0000_1111_1111_111 ;
		#10;
		#1000;
		$finish;
  end
  
endmodule
