module _32bit_or(out,a,b);
input [31:0] a,b;
output [31:0] out;
genvar i;



	generate
	
		for (i = 0; i < 32; i = i + 1) begin:myFor
			or andGate (out[i],a[i],b[i]);
		end
	endgenerate
	
endmodule