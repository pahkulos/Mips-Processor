module branch_mux(result_address,branch_pc,pc_add_4,eqRes,bne,branch);
	output [31:0] result_address;
	input [31:0] branch_pc,pc_add_4;
	input bne,branch,eqRes;
	wire r1,r2,r3,NotEqRes,beq;
	not notEq(NotEqRes,eqRes);
	not notBeq(beq,bne);
	and(r1,bne,NotEqRes);//bne
	and(r2,branch,eqRes,beq);//beq
	
	or(r3,r1,r2);
	
	mux_32to1_bit muxRes(result_address, pc_add_4,branch_pc,r3);
	endmodule
	