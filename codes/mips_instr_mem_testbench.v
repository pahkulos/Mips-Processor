`define DELAYY 10
module mips_instr_mem_testbench();
 
reg [31:0] PC=32'b0;
wire [15:0] instruction ;

mips_instr_mem test(instruction,PC);
initial begin
PC = 32'b000000000000000000000000000000000;
#`DELAYY;

PC = 32'b000000000000000000000000000000001;
#`DELAYY;

PC = 32'b000000000000000000000000000000010;
end
 
 
initial
begin
$monitor(" time = %2d, PC= %32b, Instruction: %16b ", $time,PC, instruction );

end
 
endmodule