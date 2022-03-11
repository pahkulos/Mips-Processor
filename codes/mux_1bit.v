module mux_1bit(out, I0, I1, I2, I3, I4, I5, I6, I7, S0, S1, S2);

input I0, I1, I2, I3, I4, I5, I6, I7;
input S0, S1, S2;
output out;

wire R0, R1, R2, R3, R4, R5, R6, R7, Ror1, Ror2;
wire notS0, notS1, notS2;

not not0 (notS0, S0);
not not1 (notS1, S1);
not not2 (notS2, S2);

and and0 (R0, I0, notS0, notS1, notS2);
and and1 (R1, I1, notS0, notS1, S2   );
and and2 (R2, I2, notS0, S1,    notS2);
and and3 (R3, I3, notS0, S1,    S2   );
and and4 (R4, I4, S0,    notS1, notS2);
and and5 (R5, I5, S0,    notS1, S2   );
and and6 (R6, I6, S0,    S1,    notS2);
and and7 (R7, I7, S0,    S1,    S2   );
or or1(Ror1, R0,R1,R2,R3);
or or2(Ror2, Ror1,R4,R5,R6);
or or3(out,Ror2,R7);

endmodule