# iiitb_brg- Baud Rate Generator
### Introduction
The Baud rate generator is nothing but a frequency divider. It helps two devices in communicating with each other. When data is sent from transmitter to receiver then the data at the receiver side is sampled at a particular baud rate. If there is a high mismatch between the baud rate of transmitter and receiver then the sampling will not happen at the centre of the bit period and there will be an offset. Due to the offset, there will be information that will be missed and communication will not occur efficiently. For example, if transmitter transmit at a particular rate and the receiving device only expects half of that data rate then half of the information will be lost.

<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/182206317-3a1935dd-f6a0-4392-a50a-39bada827bf4.png" width="500"/>
</p>
<p align="center">
  Fig. Baud Rate Generator Block Diagram
</p>
### Working 
The block diagram of the baud rate generator is given in the fig 1. The input to the system is Clock, Baud rate select, reset. The output is the clock with the frequency corresponding to the baud rate. The Verilog code for this system works is based on the following logic. The system works on positive edge triggered clock and has a divisor parameter. The select line is used to decide which baud rate to be selected. There is counter variable which count to a certain calculated value depending on the selected Baud rate. The clock goes from high to low or low to high each time the counter reaches the calculated value thus leading to different frequency of clock. The output clock is set to system clock, in case the reset button is pressed.
### About Iverilog and GTKWave


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
