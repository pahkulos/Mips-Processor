module equal_3bit(result,number1,number2);
	input [2:0] number1,number2;
	output result;
	wire [2:0] result_3bit;
	equal_1bit e1(result_3bit[2],number1[2],number2[2]);
	equal_1bit e2(result_3bit[1],number1[1],number2[1]);
	equal_1bit e3(result_3bit[0],number1[0],number2[0]);
	
	and(result,result_3bit[2],result_3bit[1],result_3bit[0]);
	endmodule