module mux_32to1_bit( out, I0, I1, S0 );

input S0;
input[31:0] I0 , I1;
output [31:0] out;

mux_3to1_bit mux1(out[2:0],I0[2:0],I1[2:0], S0);
mux_3to1_bit mux2(out[5:3],I0[5:3],I1[5:3], S0);
mux_3to1_bit mux3(out[8:6],I0[8:6],I1[8:6], S0);
mux_3to1_bit mux4(out[11:9],I0[11:9],I1[11:9], S0);
mux_3to1_bit mux5(out[14:12],I0[14:12],I1[14:12], S0);
mux_3to1_bit mux6(out[17:15],I0[17:15],I1[17:15], S0);
mux_3to1_bit mux7(out[20:18],I0[20:18],I1[20:18], S0);
mux_3to1_bit mux8(out[23:21],I0[23:21],I1[23:21], S0);
mux_3to1_bit mux9(out[26:24],I0[26:24],I1[26:24], S0);
mux_3to1_bit mux10(out[29:27],I0[29:27],I1[29:27], S0);
mux_2to1_bit mux11(out[30],I0[30],I1[30],S0);
mux_2to1_bit mux12(out[31],I0[31],I1[31],S0);


endmodule