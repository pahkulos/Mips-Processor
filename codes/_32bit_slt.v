module _32bit_slt(slt,a,b);

input [31:0] a,b;
output [31:0] slt;
wire [31:0] result;
wire carry_out;
_32bit_sub sub(result[31:0],carry_out,a[31:0],b[31:0],1'b1);
assign slt=result[31];

endmodule