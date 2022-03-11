module sign_extender(number,signExtImm);
output [31:0] signExtImm;
input [5:0] number;


assign signExtImm = { {26{number[5]} }, number };
endmodule
