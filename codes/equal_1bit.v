module equal_1bit(result,number1,number2);
input number1,number2;
output result;

xnor equal(result,number1,number2);
endmodule
