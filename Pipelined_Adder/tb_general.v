module tb_general();
reg [6:0]data;
wire [6:0]q;
reg clk ;


lpm_ff L1(.data(data), .q(q), .clk(clk));
always #5 clk = ~clk;								
initial begin

#2
clk=1;
data = 7'b0000000;


#2 

data = 7'b0000001;


#50 $finish();

end

initial begin
$monitor ("data=%b, q=%b, clk=%b",data,q,clk);
end

		
	
endmodule
