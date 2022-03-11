module mips_registers_testbench();
	
	wire [31:0] read_data_1, read_data_2;
	reg [31:0] write_data;
	reg [2:0] read_reg_1, read_reg_2, write_reg;
	reg signal_reg_write, clk;
	
	mips_registers reg1( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );
	
	initial begin
	clk=1;
	write_data=32'b00000000000000000000000000001111; 
	read_reg_1=3'b001;
	read_reg_2=3'b010;
	write_reg=3'b011;
	signal_reg_write=1'b0;							//write to register off
	#20;
	clk = ~clk; 
	write_data=32'b00000000000000000000000001111111; 
	read_reg_1=3'b011;
	read_reg_2=3'b010;
	write_reg=3'b100;
	signal_reg_write=1'b1;							//write to register on
	#20;
	clk = ~clk; 
	write_data=32'b00000000000000000000000000000011; 
	read_reg_1=3'b100;
	read_reg_2=3'b010;
	write_reg=3'b100;
	signal_reg_write=1'b0;							//write to register on
	#20;
	clk = ~clk; 
	
	//try to write write_data to 0 register
	write_data=32'b00000000000000000000000000000011; 
	read_reg_1=3'b001;
	read_reg_2=3'b010;
	write_reg=3'b000;
	signal_reg_write=1'b1;		
	#20;
	clk = ~clk; 
	read_reg_1=3'b000;
	#20;
	clk = ~clk;  
	end
	
	initial begin
	$monitor("time=%2d, read_data_1=%32b,  read_data_2=%32b,  write_data=%32b,\n read_reg_1=%3b, read_reg_2=%3b, write_reg=%3b, signal_reg_write=%1b\n"
	         ,$time,read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write);
	end
endmodule