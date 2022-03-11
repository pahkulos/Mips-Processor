module mux_2to1_bit( out, I0, I1, S0);

input S0;
input I0,I1;
output out;

wire notS0,w1,w2;

not(notS0,S0);
and(w1,notS0,I0);
and(w2,I1,S0);
or(out,w1,w2);

endmodule