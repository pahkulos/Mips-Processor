module sign_extender_testbench();
	reg signed [5:0] number;
	wire signed [31:0] signExtendImm;
	sign_extender sgn(number,signExtendImm);
	initial begin
	number = 6'b000000; //zero
	#20;
	number = 6'b000111; //positive
	#20;
	number = 6'b111111; //negative
	#20;
	end
	initial begin
	$monitor("time=%2d,number=%6b,signExtendImm=%32b",$time,number,signExtendImm);
	end
endmodule