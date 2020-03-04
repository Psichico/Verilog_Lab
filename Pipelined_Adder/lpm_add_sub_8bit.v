module lpm_add_sub_8bit(dataa,datab,cin,cout,result);

parameter lpm_width=7;
parameter lpm_direction="add";

input [7:0]dataa;
input [7:0]datab;
output [7:0]result;
output cout;
input cin;
/*
reg [7:0] temp;
	
	assign temp = dataa + datab + cin;
	assign result = temp[6:0];
	assign cout = temp[7];
*/
	assign {cout, result} = dataa + datab + cin;
endmodule
