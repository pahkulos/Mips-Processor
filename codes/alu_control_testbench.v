module alu_control_testbench();
	
	reg [2:0] alu_op;
	reg [2:0] func;
	wire [2:0] alu_ctr;
	alu_control my_ctr(func,alu_op,alu_ctr);
	initial begin
	alu_op = 3'b001; func =3'b000; // and
	#20;                        
	alu_op = 3'b001; func =3'b001; // add
	#20;                        
	alu_op = 3'b001; func =3'b010; // sub
	#20;                        
	alu_op = 3'b001; func =3'b011; // xor
	#20;                        
	alu_op = 3'b001; func =3'b100; // nor
	#20;                        
	alu_op = 3'b001; func =3'b101; // or
	#20;                                  
	end                              
	initial begin                    
	$monitor("time=%2d, alu_op=%3b, function=%3b, alu_ctr=%3b",$time,alu_op,func,alu_ctr);
	end                              
endmodule