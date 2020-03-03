module lpm_ff(data,q,clock);
parameter lpm_width = 7; 
input [6:0]data;
output reg [6:0]q;
input clock;

always @(posedge clock)
begin
q <= data;
end

endmodule

