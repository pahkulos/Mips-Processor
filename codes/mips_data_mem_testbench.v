module mips_data_mem_testbench();
		wire [31:0] read_data;
		reg [31:0] mem_address; 
		reg [31:0] write_data;
		reg sig_mem_read,sig_mem_write;
		
		mips_data_mem mem(read_data, mem_address, write_data, sig_mem_read, sig_mem_write);
		
		initial begin
		
		//mem_read signal is 1
		write_data = 32'b01111111100000000000000000000001; 
		mem_address = 32'b00000000000000000000000000000001; //1st adress
		sig_mem_read = 1'b0;
		sig_mem_write = 1'b0;
		#20;
		write_data = 32'b01111111100000000000000000000001; 
		mem_address = 32'b00000000000000000000000000000001; //1st adress
		sig_mem_read = 1'b1;
		sig_mem_write = 1'b1;
		#20;
		write_data = 32'b01111111100000000000000000000001; 
		mem_address = 32'b00000000000000000000000000000001; //1st adress
		sig_mem_read = 1'b1;
		sig_mem_write = 1'b0;
		#20;
		end
		initial begin
			$monitor("time=%2d, write_data=%32b,  adress=%32b,  \n mem_read=%1b,  mem_write=%1b,  read_data=%32b "
						,$time,write_data,mem_address,sig_mem_read,sig_mem_write,read_data);
		end
endmodule