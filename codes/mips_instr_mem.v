module mips_instr_mem(instruction,PC);
	input [31:0] PC;
	output [15:0] instruction;

	reg [15:0] instr_mem [30:0];

initial begin
	$readmemb("instruction.mem", mips_instr_mem.instr_mem);
end

assign instruction = instr_mem[PC];

endmodule
	


	