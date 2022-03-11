module equal_32bit_testbench();
	reg [31:0] number1,number2;
	wire result;
	
	equal_32bit eq(result,number1,number2);
	
	initial begin
	number1= 32'b00000000000000000000000000000011;
	number2= 32'b00000000000000000000000000000011;
	#20;
	number1= 32'b00000000000000000000000000000000;
	number2= 32'b00000000000000000000000000000011;
	#20;
	number1= 32'b00000000000000000000000000000011;
	number2= 32'b00000000000000000000000000000001;
	#20;
	end
	
	initial begin
	$monitor("time=%2d, number1=%32b, number2=%32b, result=%1b,",$time, number1,number2,result);
	end
	endmodule