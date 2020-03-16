module add_1p_testbench();
  
  reg [14:0] X,Y; //inputs
  wire [14:0] sum; //result
  reg clk; //clock
   
  add_1p uut(.X(X),.Y(Y),.sum(sum),.clk(clk));
  
  always #1 clk = ~clk; //toggle clock every 1 unit of timescale
  
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
		X = 15'b0000_1001_0101_010;
		Y = 15'b0000_0000_1010_111 ;
		#10;
		X = 15'b1111_1111_1111_111;
		Y = 15'b0000_0000_000_000 ;
		#10;
		X = 15'b1111_1111_1111_111;
		Y = 15'b0000_0000_000_001 ;
		#100;
		$finish;
  end
endmodule
