module alu_control(func,AluOp,Aluctr);
input [2:0] func;//001
input[2:0] AluOp;//001
output [2:0] Aluctr;
wire r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13;
wire notF0,notF1,notF2,notAluOp0,notAluOp1,notAluOp2,isRtype,notRtype;




not(notF0,func[0]);
not(notF1,func[1]);
not(notF2,func[2]);

not(notAluOp0,AluOp[0]); 
not(notAluOp1,AluOp[1]); 
not(notAluOp2,AluOp[2]); 
and(isRtype,AluOp[0],notAluOp1,notAluOp2);
not(notRtype,isRtype);


//Aluctr<2>
and(r1,notF0,notF1,notF2); //000 condition
or(r2,r1,func[2]);	// 1xx or 000 condition 
and(r3,r2,isRtype); // rtype

and(r4,notRtype,AluOp[2]);// if notRtype and AluOp[2]==1
or(Aluctr[2],r3,r4);

//Aluctr<1>
and(r5,notF0,notF2);  //0x0 condition
and(r6,func[0],func[2]);	//1x1 cond
or(r7,r5,r6); //1x1 or 0x0
and(r8,r7,isRtype); // rtype

and(r9,notRtype,AluOp[1]); // if notRtype and AluOp[1]==1
or(Aluctr[1],r9,r8);

//Aluctr<0>
and(r10,func[0],func[1]); // x11 cond
or(r11,r10,func[2]); // x11 or 1xx
and(r12,r11,isRtype); // rtype

and(r13,notRtype,AluOp[0]);// if notRtype and AluOp[0]==1
or(Aluctr[0],r13,r12);
endmodule
