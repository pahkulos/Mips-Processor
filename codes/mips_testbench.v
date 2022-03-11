module mips_testbench ();

reg clock;

  mini_mips test(clock);

  initial begin
    clock=1;
    
	 #580 
	 $writememb("res_registers.mem",test.registers1.registers);
	 $writememb("res_data.mem",test.memory.data_mem);
	 $finish;
  end

  always begin
    #10;
    clock=~clock;
  end


endmodule