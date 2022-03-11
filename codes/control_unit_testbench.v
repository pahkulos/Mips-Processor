module control_unit_testbench();
	reg [3:0] opcode;
	wire branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, RegDest; 
	wire [2:0] ALUOp;			
	control_unit control(opcode,branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, RegDest,ALUOp);
	initial begin
	opcode = 4'b0000; //r-type
	#20;
	opcode = 4'b0001; // addi
	#20;
	opcode = 4'b0010; // andi
	#20;
	opcode = 4'b0011; // ori
	#20;
	opcode = 4'b0100; // nori
	#20; 
	opcode = 4'b0101; // beq
	#20;
	opcode = 4'b0110; // bne
	#20;
	opcode = 4'b0111; // slti
	#20;
	opcode = 4'b1000; // lw
	#20;
	opcode = 4'b1001; // sw
	#20;
	end
	initial begin
	$monitor("time=%2d,opcode=%4b,branch=%1b,MemRead=%1b,MemtoReg=%1b,MemWrite=%1b,ALUSrc=%1b,RegWrite=%1b,RegDest=%1b,ALUOp=%3b"
	          ,$time,opcode,branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, RegDest,ALUOp);
	end
endmodule