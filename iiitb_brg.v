// Code your design here
`timescale 100ps / 100ps

module iiitb_brg( clk,reset,sel,clkout);
	 
input clk,reset;
input [1:0]sel;
output reg clkout;

parameter DIV1=34;//fsystem/f1152*2,fsystem=125Mhz

reg[5:0] cnt1=0;
reg[1:0] cnt2=0;
reg[2:0] cnt3=0;
reg[3:0] cnt4=0;
always@(posedge clk)
	case(sel)
		//clk for 115200bps
	2'b00:
		begin
		if(reset)
			begin
			cnt1<=0;
			clkout<=0;
			end
		else
		begin
			if(cnt1==(DIV1-1))
				begin
				cnt1 <= 0;
				clkout<=~clkout;
				end
			else
				cnt1<=cnt1+1;
		end
		end

		//clk for 38400bps
	2'b01:
		begin
		if(reset)
			begin
			cnt2<=0;
			clkout<=0;
			end
		else
			begin
			if(cnt1==(DIV1-1))
				begin
					cnt1<=0;
					if(cnt2==2)
						begin
						cnt2<=0;
						clkout<=~clkout;
						end
					else
						cnt2<=cnt2+1;
				end
			else
				cnt1<=cnt1+1;
		end
		
		end


		//clk for 19200bps
	2'b10:
		begin
		if(reset)
			begin
			cnt3<=0;
			clkout<=0;
			end
		else
		begin
		if(cnt1==(DIV1-1))
			begin
			cnt1<=0;
			
			if(cnt3==5)
				begin
				cnt3<=0;
				clkout<=~clkout;
				end
			else
				cnt3<=cnt3+1;
			end
		else 
			cnt1<=cnt1+1;
		end
		
		end

		//clk for 9600bps
	2'b11:
		begin
		if(reset)
			begin
			cnt4<=0;
			clkout<=0;
			end
		else
			begin
			if(cnt1==(DIV1-1))
				begin
					cnt1<=0;
					if(cnt4==11)
					begin
					cnt4<=0;
					clkout<=~clkout;
					end
					else
					cnt4<=cnt4+1;
				end
			else
				cnt1<=cnt1+1;
			end
		end
	endcase
endmodule

