`timescale 100ps / 100ps


module iiitb_brg_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire clk1152;
	wire clk384;
	wire clk192;
	wire clk96;

	// Instantiate the Unit Under Test (UUT)
	iiitb_brg uut (
		.clk(clk), 
		.reset(reset), 
		.clk1152(clk1152),
		.clk384(clk384),
		.clk192(clk192),
		.clk96(clk96)
	);

	initial begin
	
	
	clk=0;
	reset=0;
	#15 reset=1;
	#80 reset = 0;
	end
      always
		#40 clk=~clk;
		
		initial 
		#200000 $finish;
		
		initial
		begin
		$dumpfile("dump.vcd");
          $dumpvars(1, iiitb_brg_tb);
	 end
		
endmodule


