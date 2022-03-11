module mips_registers
( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );

	output [31:0] read_data_1, read_data_2;
	input [31:0] write_data;
	input [2:0] read_reg_1, read_reg_2, write_reg;
	input signal_reg_write, clk;
	wire check_zero_reg,equal;
	reg [31:0] registers [7:0];
	
	initial begin

		$readmemb("registers.mem", registers);
	end
	
	assign read_data_1 = registers[read_reg_1];
	assign read_data_2 = registers[read_reg_2];
	
	equal_3bit eq(equal, write_reg,3'b0);
	not notEqual(check_zero_reg,equal);
	
	always @(negedge clk ) begin
		if (signal_reg_write && check_zero_reg) begin
			registers[write_reg] <= write_data;
		end
	end
	
endmodule
