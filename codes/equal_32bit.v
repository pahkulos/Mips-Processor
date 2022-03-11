module equal_32bit(result,number1,number2);

	input [31:0] number1,number2;
	output result;
	wire r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,res1,res2,res3;
	
	
	equal_3bit e1(r1,number1[2:0],number2[2:0]);
	equal_3bit e2(r2,number1[5:3],number2[5:3]);
	equal_3bit e3(r3,number1[8:6],number2[8:6]);
	equal_3bit e4(r4,number1[11:9],number2[11:9]);
	and(res1,r1,r2,r3,r4);
	equal_3bit e5(r5,number1[14:12],number2[14:12]);
	equal_3bit e6(r6,number1[17:15],number2[17:15]);
	equal_3bit e7(r7,number1[20:18],number2[20:18]);
	equal_3bit e8(r8,number1[23:21],number2[23:21]);
	and(res2,r5,r6,r7,r8);
	equal_3bit e9(r9,number1[26:24],number2[26:24]);
	equal_3bit e10(r10,number1[29:27],number2[29:27]);
	equal_1bit e11(r11,number1[30],number2[30]);
	equal_1bit e12(r12,number1[31],number2[31]);
	and(res3,r9,r10,r11,r12);
	
	and(result,res1,res2,res3);
	
	

endmodule