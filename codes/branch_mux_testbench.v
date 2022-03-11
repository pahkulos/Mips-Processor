module branch_mux_testbench();
	wire [31:0] result_address;
	reg [31:0] branch_pc,pc_add_4;
	reg bne,branch,eqRes;
	
	branch_mux bMux(result_address,branch_pc,pc_add_4,eqRes,bne,branch);
	initial begin
	branch_pc=32'b00000000000000000000000000000001;
	pc_add_4= 32'b00000000000000000000000000000011;
	bne=1;
	eqRes=1;
	branch=1;
	#20;
	branch_pc=32'b00000000000000000000000000000001;
	pc_add_4= 32'b00000000000000000000000000000011;
	bne=1;
	eqRes=0;
	branch=1;
	#20;
	branch_pc=32'b00000000000000000000000000000001;
	pc_add_4= 32'b00000000000000000000000000000011;
	bne=0;
	eqRes=1;
	branch=1;
	#20;
	end
	initial begin
	$monitor("time=%2d, branch_pc=%32b, pc_add_4=%32b,\n bne=%1b, eqRes=%1b, branch=%1b, result_address=%32b"
				,$time,branch_pc,pc_add_4,bne,eqRes,branch,result_address);
	end
endmodule

	