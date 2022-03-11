
module control_32bit_testbench();

 reg [63:0] multiplier;
 reg [31:0] multiplicand;

 
 wire [63:0] result;
 
 control_32bit c1(result[63:0] , multiplier[63:0] ,multiplicand[31:0]);

initial begin

     multiplier = 64'h76543211; multiplicand = 5; #40;

     multiplier =   64'h76543211; multiplicand = 5; #40;
end
 
initial
begin
$monitor("multiplier: %64b  multiplicand: %32b  result:  %64b",multiplier,multiplicand, result);
end
      
endmodule