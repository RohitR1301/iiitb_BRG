// Code your design here
`timescale 100ps / 100ps

module iiitb_brg( clk,reset,clk1152,clk384,clk192,clk96);
	 
input clk,reset;
output reg clk1152,clk384,clk192,clk96;

parameter DIV1=34;//fsystem/f1152*2,fsystem=125Mhz

reg[5:0] cnt1;
reg[1:0] cnt2;
reg[2:0] cnt3;
reg[3:0] cnt4;

//clk for 115200bps
always@(posedge clk)
	begin
	if(reset)
		begin
		cnt1<=0;
		clk1152<=0;
		end
	else
		if(cnt1==(DIV1-1))
			begin
			cnt1 <= 0;
			clk1152<=~clk1152;
		end
		else
			cnt1<=cnt1+1;
	end

//clk for 38400bps
always @(posedge clk)
	begin
	if(reset)
		begin
		cnt2<=0;
		clk384<=0;
		end
	else
	if(cnt1==(DIV1-1))
		begin
		if(cnt2==2)
			begin
			cnt2<=0;
			clk384<=~clk384;
			end
	else
		cnt2<=cnt2+1;
	end
end


//clk for 19200bps
always @(posedge clk)
	begin
	if(reset)
		begin
		cnt3<=0;
		clk192<=0;
		end
	else
		if(cnt1==(DIV1-1))
		begin
		if(cnt3==5)
			begin
			cnt3<=0;
			clk192<=~clk192;
			end
		else
			cnt3<=cnt3+1;
		end
	end

//clk for 9600bps
always @(posedge clk)
	begin
	if(reset)
		begin
		cnt4<=0;
		clk96<=0;
		end
	else
		if(cnt1==(DIV1-1))
		begin
			if(cnt4==11)
			begin
			cnt4<=0;
			clk96<=~clk96;
			end
			else
			cnt4<=cnt4+1;
		end
	end
endmodule


