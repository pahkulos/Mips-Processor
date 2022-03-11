module control_unit(opcode,branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, RegDest,ALUOp,bne);

	input [3:0] opcode;
	output branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, RegDest;
	output [2:0] ALUOp;
	output bne;

wire R_type,lw,sw,beq,ori,addi,andi,nori,slti,add_Itype,src;
wire opnot0,opnot1,opnot2,opnot3;


not(opnot0,opcode[0]);
not(opnot1,opcode[1]); 
not(opnot2,opcode[2]);
not(opnot3,opcode[3]);

and(R_type,opnot0,opnot1,opnot2,opnot3);
and(lw,opcode[3],opnot2,opnot1,opnot0);
and(sw,opcode[3],opnot2,opnot1,opcode[0]);
and(beq,opnot3,opcode[2],opnot1,opcode[0]);
and(bne,opnot3,opcode[2],opcode[1],opnot0);

and(addi,opnot3,opnot2,opnot1,opcode[0]);
and(andi,opnot3,opnot2,opcode[1],opnot0);
and(ori,opnot3,opnot2,opcode[1],opcode[0]);
and(nori,opnot3,opcode[2],opnot1,opnot0);
and(slti,opnot3,opcode[2],opcode[1],opcode[0]);

//AluSrc
or(add_Itype,lw,sw,addi,andi);
or(RegWrite,R_type,lw,addi,andi,ori,nori,slti);
or(ALUSrc,add_Itype,ori,nori,slti);


//ALUOp
or(ALUOp[2],andi,ori,nori,slti);
or(ALUOp[1],andi,ori,beq,bne);
or(ALUOp[0],ori,nori,R_type);


assign RegDest = R_type;    // RegDst Signal
assign MemtoReg = lw;      // MemtoReg Signal
assign MemRead = lw;       // MemRead Signal
assign MemWrite = sw;      // MemWrite Signal
or(branch,beq,bne);
endmodule