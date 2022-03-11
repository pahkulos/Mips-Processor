module mux_32bit(out, I0, I1, I2, I3, I4, I5, I6, I7, S1, S2, S3);

	input  [31:0] I0, I1, I2, I3, I4, I5, I6,I7;
	input  S1,S2,S3;
	output [31:0] out;
	genvar i;

	generate

		for (i = 0; i < 32; i = i + 1) begin:myFor
			mux_1bit muxGate(out[i],  I0[i],  I1[i],  I2[i],  I3[i],  I4[i],  I5[i],  I6[i],  I7[i],  S1, S2, S3);
		end
	endgenerate

endmodule