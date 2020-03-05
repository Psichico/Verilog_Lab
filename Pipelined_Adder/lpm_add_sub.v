module lpm_add_sub (dataa, datab, cin, cout, result);
	
	parameter lpm_width = 2;
	
	input [lpm_width - 1:0] dataa;
	input [lpm_width - 1:0] datab;
	input cin;

	output [lpm_width - 1:0] result;
	output cout;

	assign {cout, result} = dataa + datab + cin;
endmodule
