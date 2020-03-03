module lpm_add_sub(dataa,datab,cin,cout,result);

parameter lpm_width=7;
parameter lpm_direction="add";

input [6:0]dataa;
input [6:0]datab;
output [6:0]result;
output cout;
input cin;
 assign {cout, result} = dataa + datab;

endmodule
