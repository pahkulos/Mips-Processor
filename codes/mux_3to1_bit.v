module mux_3to1_bit( out, I0, I1, S0);

input S0;
input[2:0] I0 , I1;
output [2:0] out;

mux_2to1_bit mux1(out[0],I0[0],I1[0],S0);
mux_2to1_bit mux2(out[1],I0[1],I1[1],S0);
mux_2to1_bit mux3(out[2],I0[2],I1[2],S0);

endmodule
