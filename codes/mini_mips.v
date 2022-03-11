module mini_mips(clock);
	input clock;
	reg [31:0] pc=0;
	wire [15:0] instr;
	wire RegWrite,AluSrc,RegDst,MemtoReg,MemRead,MemWrite,Branch,Jump,bne;
	wire [2:0]Aluop;
	wire [31:0] read_data_1, read_data_2, mux32_result , read_data, pc_add_1, branch_pc,end_of_cycle;
	wire [31:0] write_data, signExtImm, shiftResult,Aluresult;
	wire [2:0]  out;
	wire eqRes,c0,c1;
	wire[2:0] Aluctr;
	wire [31:0] next_pc;
	
	// instruction okunur
	mips_instr_mem  mem(instr, pc);
	
	// instruction girer sinyaller uretilir
	control_unit cont(instr[15:12],Branch,MemRead,MemtoReg,MemWrite,AluSrc,RegWrite,RegDst,Aluop,bne);
	//rs rt register mux
	mux_3to1_bit regMux(out,instr[8:6],instr[5:3],RegDst);
	//registerlar okunur
	mips_registers registers(read_data_1, read_data_2,write_data,instr[11:9], instr[8:6], out, RegWrite, clock);
	
	// instruction 6 bit sign extend unite gonderilir
	sign_extender signEx(instr[5:0], signExtImm);
	
	// instruction 5 bit alu controla gonderilir
	alu_control aluCont( instr[2:0], Aluop, Aluctr );
	
	//I type or R type
	mux_32to1_bit mux32(mux32_result,read_data_2, signExtImm, AluSrc );
	
	//alu process
	_32bit_alu alu(Aluresult,read_data_1,mux32_result,Aluctr);
	
	//memory
	mips_data_mem memory(read_data, Aluresult,read_data_2,MemRead,MemWrite);
	
	//mux memory
	mux_32to1_bit muxMemory(write_data,Aluresult, read_data, MemtoReg );
	
	//sıradaki pc için işlemler
	_32bit_adder adpc_1(pc_add_1,c0,pc,32'b00000000000000000000000000000001,1'b0);
	_32bit_adder adpc_2(branch_pc,c1,pc_add_1,signExtImm,1'b0);
	
	//Branch process
	equal_32bit branchEqual(eqRes,Aluresult,32'b0);
	branch_mux branchMux(next_pc,branch_pc,pc_add_1,eqRes,bne,Branch);
	
	mips_registers registers1(read_data_1, read_data_2,write_data,instr[11:9], instr[8:6], out, RegWrite, clock);
	always @(posedge clock)
	begin
	
	$display("Time:%2d, clk:%1b,\n--Sinyaller--\nregWrite:%1b, AluSrc:%1b, RegDst:%1b, MemtoReg:%1b, MemRead:%1b, MemWrite:%1b, Branch:%1b\n------------\nProgram Counter:%32b,\Next Program Counter %32b,\nIslemdeki instruction:%16b\nALU_input1:%32b, ALU_input2:%32b\nresult:%32b  ALUControl:%3b write_data=%32b write_reg=%3b\n",
          $time,clock,RegWrite, AluSrc, RegDst, MemtoReg, MemRead, MemWrite, Branch,pc,pc_add_1, instr, read_data_1, mux32_result, Aluresult, Aluctr,write_data,out);
	
	pc <= next_pc;
	end
endmodule
	
	
	