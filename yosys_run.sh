read_verilog iiitb_brg.v
synth -top iiitb_brg
dfflibmap -liberty/home/rohitr/iverilog/BaudRateGen.v/iiitb_brg/Lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty/home/rohitr/iverilog/BaudRateGen.v/iiitb_brg/Lib/sky130_fd_sc_hd__tt_025C_1v80.lib
clean
flatten
