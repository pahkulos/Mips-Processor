module _32bit_alu(out,inp_A,inp_B,select);

input  [31:0] inp_A,inp_B;
input  [2:0] select;
output [31:0] out;

wire[31:0] out0, out1, out2, out3,out4,out5, out6, out7 ;
wire carry_out;

 _32bit_adder	  add32bit(out0,carry_out,inp_A, inp_B,1'b0);
 _32bit_xor		  xor32bit (out1, inp_A, inp_B);
 _32bit_sub		  sub32bit(out2, carry_out,inp_A, inp_B,1'b1);
 //_32bit_mulp      xor32bit(out3, inp_A, inp_B);
 _32bit_slt		  slt32bit(out4,inp_A, inp_B);
 _32bit_nor      nor32bit (out5, inp_A,inp_B);
 _32bit_and      and32bit (out6, inp_A,inp_B);
 _32bit_or       or32bit (out7, inp_A, inp_B);

mux_32bit MUX1(out, out0, out1, out2, out3 ,out4, out5, out6, out7, select[2],select[1],select[0]);

endmodule