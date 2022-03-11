module _32bit_adder (S,C,A,B,C0);
input [31:0] A,B;
input C0;
output C;
output [31:0] S;
wire C1,C2,C3,C4,C5,C6,C7;  //intermediate carries

//Instantiate the full addder
_4bit_adder _4bit_adder0(S[3:0], C1, A[3:0], B[3:0], C0),
			   _4bit_adder1(S[7:4], C2, A[7:4], B[7:4], C1),
			   _4bit_adder2(S[11:8], C3, A[11:8], B[11:8], C2),
				_4bit_adder4(S[15:12], C4, A[15:12], B[15:12], C3),
			   _4bit_adder5(S[19:16], C5, A[19:16], B[19:16], C4),
			   _4bit_adder6(S[23:20], C6, A[23:20], B[23:20], C5),
				_4bit_adder7(S[27:24], C7, A[27:24], B[27:24], C6),
			   _4bit_adder8(S[31:28], C, A[31:28], B[31:28], C7);
				
endmodule