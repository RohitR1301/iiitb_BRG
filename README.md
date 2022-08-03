# iiitb_brg- Baud Rate Generator
### Introduction
The Baud rate generator is nothing but a frequency divider. It helps two devices in communicating with each other. When data is sent from transmitter to receiver then the data at the receiver side is sampled at a particular baud rate. If there is a high mismatch between the baud rate of transmitter and receiver then the sampling will not happen at the centre of the bit period and there will be an offset. Due to the offset, there will be information that will be missed and communication will not occur efficiently. For example, if transmitter transmit at a particular rate and the receiving device only expects half of that data rate then half of the information will be lost.

<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/182206317-3a1935dd-f6a0-4392-a50a-39bada827bf4.png" width="500"/>
</p>
<p align="center">
  Fig 1. Baud Rate Generator Block Diagram
</p>

### Working 
The block diagram of the baud rate generator is given in the fig 1. The input to the system is Clock, Baud rate select line and reset. The output is the clock with the frequency corresponding to the baud rate. 
The system works on positive edge triggered clock and uses select line to decide the clock frequency for the corresponding selected Baud Rate to be give as output. A counter value is calculated based on the system clock and 115200bps baud rate which is DIV1. For 115200 bps, when the counter reaches DIV1 the clock pulse is negated. For 38400bps, the clock pulse is negated when the counter reaches DIV1 twice. For 19200bps, the clock pusle is negated when the counter reaches DIV1 5 times. For 9600bps, the clock pulse is negated when the counter reaches DIV1 11 times. 
### About Iverilog and GTKWave
**Icarus Verilog** is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format.<br>
**GTKWave** is a VCD waveform viewer based on the GTK library. This viewer support VCD and LXT formats for signal dumps. 

### Author
- Rohit Raj

### Contributor
- Lokesh Maji
- Kunal Ghosh 
- Arsh Kedia
- Siddhant Nayak
### Acknowledgement 
Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.
### Contact Information
- Rohit Raj, M.Tech VLSI, Batch 2022-2024, International Institute Of Information Technology, Bangalore(IIIT B), rohitraj116@gmail.com
- Lokesh Maji, M.Tech VLSI, Batch 2022-2024, International Institute Of Information Technology, Bangalore (IIIT B), Lokesh.Maji@iiitb.ac.in
- Arsh Kedia, M.Tech VLSI, Batch 2022-2024, International Institute Of Information Technology, Bangalore (IIIT B), 
- Siddhant Nayak, M.Tech VLSI, Batch 2022-2024, International Institute Of Information Technology, Bangalore (IIIT B), siddhantn72@iiitb.ac.in
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd., kunalghosh@gmail.com
