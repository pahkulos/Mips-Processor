module _32bit_sub(sum,carry_out,a,b,carry_in);

input [31:0] a,b;
input carry_in;

output [31:0] sum;
output carry_out;

wire [31:0] bNot;

not not0(bNot[0],b[0]),
    not1(bNot[1],b[1]),
    not2(bNot[2],b[2]),
	 not3(bNot[3],b[3]),
	 not4(bNot[4],b[4]),
	 not5(bNot[5],b[5]),
	 not6(bNot[6],b[6]),
	 not7(bNot[7],b[7]),
	 not8(bNot[8],b[8]),
	 not9(bNot[9],b[9]),
	 not10(bNot[10],b[10]),
	 not11(bNot[11],b[11]),
	 not12(bNot[12],b[12]),
	 not13(bNot[13],b[13]),
	 not14(bNot[14],b[14]),
	 not15(bNot[15],b[15]),
	 not16(bNot[16],b[16]),
	 not17(bNot[17],b[17]),
	 not18(bNot[18],b[18]),
	 not19(bNot[19],b[19]),
	 not20(bNot[20],b[20]),
	 not21(bNot[21],b[21]),
	 not22(bNot[22],b[22]),
	 not23(bNot[23],b[23]),
	 not24(bNot[24],b[24]),
	 not25(bNot[25],b[25]),
	 not26(bNot[26],b[26]),
	 not27(bNot[27],b[27]),
	 not28(bNot[28],b[28]),
	 not29(bNot[29],b[29]),
	 not30(bNot[30],b[30]),
	 not31(bNot[31],b[31]);
	 

_32bit_adder subb(sum,carry_out,a,bNot,carry_in);
	 

	
endmodule