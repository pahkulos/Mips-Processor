module _32bit_slt_testbench();
`define DELAY 20
 // Inputs
 reg [31:0] a,b;
 // Outputs
 wire  result;
 _32bit_slt slt32bit(result,a[31:0],b[31:0]);

initial begin
a[31:0] = 32'h11111111; b[31:0] = 32'h99999999;
#`DELAY;
a[31:0] = 32'h99999999; b[31:0] = 32'h11111111;
#`DELAY;
a[31:0] = 32'h11111111; b[31:0] = 32'h11111111;
end
 
 
initial
begin
$monitor("time = %2d, a =%32h, b=%32h, result=%1h", $time, a, b, result);
end
      
endmodule