`include "lpm_ff.v"
`include "lpm_add_sub.v"

module add_1p( X, Y, sum, clk);

	parameter	WIDTH = 15, //Total bit width
				WIDTH1 = 7, //bit width of lsb's
				WIDTH2 = 8; //bit width 

	input [WIDTH-1:0] X, Y; //inputs
	output [WIDTH-1:0] sum; //result
	input clk; //clock

	reg [WIDTH1-1:0] I1,I2;// lsb's of input
	wire [WIDTH1-1:0] q1,r1;//lsb's of input

	reg [WIDTH2-1:0] I3, I4; //msb's of input
	wire [WIDTH2-1:0] r2, q2, u2; //MSB's of input
	
	reg [WIDTH-1:0] s; //output register
	
	wire cr1,cq1; //lsb's carry signal

	wire [WIDTH2-1:0] h2; //auxiliary msb's of input
	
	wire clkena, ADD, ena, aset, sclr; //auxiliary signal
	wire sset, aload, sload, aclr, ovf1, cin1;

	//default for add:
	assign cin1=0; assign aclr=0; assign ADD=1;
	assign ena=1; assign aclr=0; //default for FF
	assign sclr=0; assign sset=0; assign aload=0;
	assign sload=0; assign clkena=0; assign aset=0;

	//Split in MSB'S and lsb's and store in registers
	always @(posedge clk)
	begin
		//split lsb's from input x,y
		I1[WIDTH1-1:0] <= X[WIDTH1-1:0];
		I2[WIDTH1-1:0] <= Y[WIDTH1-1:0];

		//split msb's from input x,y
		I3[WIDTH2-1:0] <= X[WIDTH2-1 + WIDTH1:WIDTH1];
		I4[WIDTH2-1:0] <= Y[WIDTH2-1 + WIDTH1:WIDTH1];
	end

	/*********************First stage of Adder *************/
	
	lpm_add_sub add_1 //add lsb's of x &y
	(.result(r1), .dataa(I1), .datab(I2), .cout(cr1), .cin(cin1)); //used ports
	defparam add_1.lpm_width = WIDTH1;
	
	lpm_ff reg_1 //save lsbs of x+y 
	(.data(r1), .q(q1), .clock(clk));
	defparam reg_1.lpm_width = WIDTH1;
	
	lpm_add_sub add_2 //add msb's of x and y
	(.dataa(I3), .datab(I4), .result(r2), .cin(cin1)); // used ports
	defparam add_2.lpm_width = WIDTH2;
	//defparam add_2.lpm_direction = "add";

	lpm_ff reg_2 //save lsb's carry
	(.data(cr1), .q(cq1), .clock(clk));//used ports
	defparam reg_2.lpm_width = 1;

	lpm_ff reg_3 //Save MSB's of x+y
	(.data(r2), .q(q2), .clock(clk)); //used ports;
	defparam reg_3.lpm_width = WIDTH2;

	/**************Second stage of Adder *************/

	// One operand is zero

	assign h2 = {WIDTH2{1'b0}};

	lpm_add_sub add_3 // Add MSB's (x+y) and carry from LSB's
	(.cin(cq1), .dataa(q2), .datab(h2), .result(u2)); //used ports

	defparam add_3.lpm_width = WIDTH2;
	//defparam add_3.lpm_direction = "add";

	always @(posedge clk)
	begin
		s = {u2[WIDTH2-1:0],q1[WIDTH1-1:0]}; //output word
	end //of WIDTH=WIDTH1+WIDTH2

	assign sum = s; //Connect s to output pins

endmodule