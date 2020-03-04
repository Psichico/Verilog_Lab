module lpm_ff_8bit(data,q,clock);
parameter lpm_width = 7; 
input [7:0]data;
output reg [7:0]q;
input clock;

always @(posedge clock)
begin
q <= data;
end

endmodule

