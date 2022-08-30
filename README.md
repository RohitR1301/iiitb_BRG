# iiitb_brg- Baud Rate Generator
### 1) Introduction
The Baud rate generator is nothing but a frequency divider. It helps two devices in communicating with each other. When data is sent from transmitter to receiver then the data at the receiver side is sampled at a particular baud rate. If there is a high mismatch between the baud rate of transmitter and receiver then the sampling will not happen at the centre of the bit period and there will be an offset. Due to the offset, there will be information that will be missed and communication will not occur efficiently. For example, if transmitter transmit at a particular rate and the receiving device only expects half of that data rate then half of the information will be lost.

<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/182206317-3a1935dd-f6a0-4392-a50a-39bada827bf4.png" width="500"/>
</p>
<p align="center">
  Fig 1. Baud Rate Generator Block Diagram
</p>

### Working 
The block diagram of the baud rate generator is given in the fig 1. The input to the system is Clock, Baud rate select line and reset. The output is the clock with the frequency corresponding to the baud rate. 
The system works on positive edge triggered clock and uses select line to decide the clock frequency for the corresponding selected Baud Rate to be give as output. A counter value is calculated based on the system clock and 115200bps baud rate which is DIV1. For 115200 bps, when the counter reaches DIV1 the clock pulse is negated. For 38400bps, the clock pulse is negated when the counter reaches DIV1 twice. For 19200bps, the clock pusle is negated when the counter reaches DIV1 5 times. For 9600bps, the clock pulse is negated when the counter reaches DIV1 11 times.<br>
The clock output is set to 0 when the reset is set to high.
### 2) Functional Simulation 
### About Iverilog and GTKWave
**Icarus Verilog** is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format.<br>
**GTKWave** is a VCD waveform viewer based on the GTK library. This viewer support VCD and LXT formats for signal dumps. 
### Installing Software 
```
sudo apt-get install git 
sudo apt-get install iverilog 
sudo apt-get install gtkwave 
```
### Executing the project
```
git clone https://github.com/RohitR1301/iiitb_BRG
cd iiitb_brg
iverilog iiitb_brg.v iiitb_brg_tb.v 
gtkwave iiitb_brg_out.vcd
```
When the project is run, we get the following output which is shown with the help of GTKwave.  
<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/182586115-bab95563-73cf-4203-94e1-53e1104832bc.jpeg" width="1000"/><br>
  Fig 2. Simulation result for different Baud Rate
</p>
<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/182586640-c925798d-e41b-4271-b4c9-bf2551328e04.jpeg" width="1000"/><br>
  Fig 3. Simulation result when reset becomes 1
</p>

### 3) Synthesis 
The software used to run gate level simulation is yosys.
### Yosys
**Yosys** is a framework for RTL synthesis tools. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains.
Yosys can be adapted to perform any synthesis job by combining the existing passes (algorithms) using synthesis scripts and adding additional passes as needed by extending the yosys C++ code base.
<br> <br><b>Installing Yosys</b>
```
git clone https://github.com/YosysHQ/yosys.git
make
sudo make install make test
```
Make a file named ```yosys_run.sh``` and copy the below commands to run synthesis is yosys.
```
read_verilog iiitb_brg.v
synth -top iiitb_brg
dfflibmap -liberty /home/rohitr/iverilog/BaudRateGen.v/iiitb_brg/Lib/sky130_fd_sc_hd__tt_025C_1v80.lib
abc -liberty /home/rohitr/iverilog/BaudRateGen.v/iiitb_brg/Lib/sky130_fd_sc_hd__tt_025C_1v80.lib -script +strash;scorr;ifraig;retime,{D};strash;dch,-f;map,-M,1,{D}
clean
flatten
write_verilog -noattr iiitb_brg_synth.v
stat
show
```
Then open the terminal in iiitb_brg and run the following command
```
yosys -s yosys_run.sh
```
On running the above command we get the netlist and the also the statistics about number of gates that are used.
<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/185080537-819af9d7-f095-4f2a-a873-ffe07e1e2e7c.png" width="300"/><br>
  Fig 4. Statistics 
</p>

### 4) Gate Level Simulation (GLS)
GLS stands for Gate level Simulation. when we make an RTL design we test it with the help of test bench, which applies some stimulus. The output of that stimulus is checked for the desired functionality. After synthesis we need to again check if the functionality is maintained, for that we perform the GLS. We put the netlist under test and use the same test bench that we did for RTL design to check the functionality. GLS also ensures the timing of the design. 
<br>We run the below command for GLS
```
iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 ../iiitb_brg/Verilog_Model/primitives.v ../iiitb_brg/Verilog_Model/sky130_fd_sc_hd.v ../iiitb_brg/iiitb_brg_net.v ../iiitb_brg/iiitb_brg_tb.v
./a.out
gtkwave iiitb_brg_out.vcd
```
After running the above command we get the following output
<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/185083660-f6e7b8b8-947c-4edc-b061-a2a7db144081.png" width="1000"/><br>
  Fig 5. GLS Waveform
</p>

### 5) Physical Design
### -About OpenLane
OpenLANE is an opensource tool or flow used for opensource tape-outs. The OpenLANE flow comprises a variety of tools such as Yosys, ABC, OpenSTA, Fault, OpenROAD app, Netgen and Magic which are used to harden chips and macros, i.e. generate final GDSII from the design RTL. The primary goal of OpenLANE is to produce clean GDSII with no human intervention. OpenLANE has been tuned to function for the Google-Skywater130 Opensource Process Design Kit.
### -About Magic
Magic is a venerable VLSI layout tool, written in the 1980's at Berkeley by John Ousterhout, now famous primarily for writing the scripting interpreter language Tcl. Due largely in part to its liberal Berkeley open-source license, magic has remained popular with universities and small companies. The open-source license has allowed VLSI engineers with a bent toward programming to implement clever ideas and help magic stay abreast of fabrication technology. However, it is the well thought-out core algorithms which lend to magic the greatest part of its popularity. Magic is widely cited as being the easiest tool to use for circuit layout, even for people who ultimately rely on commercial tools for their product design flow. 
### -Software setup (OpenLane)
## On Ubuntu
`apt install -y build-essential python3 python3-venv python3-pip`
# Setting Up OpenLane
You can set up the Sky130 PDK and OpenLane by running:

```
    git clone https://github.com/The-OpenROAD-Project/OpenLane.git
    cd OpenLane/
    sudo make
    sudo make test # This a ~5 minute test that verifies that the flow and the pdk were properly installed
```
# Running OpenLane
You need to start the Docker container with proper paths mounted. There are two ways to do this.

The easiest way to mount the proper directories into the docker container would be to rely on the Makefile:

```
    sudo make mount
```
### -Software setup (Magic)
# system requirements
Run the below commands to check the system requirements
```
sudo apt-get install m4
sudo apt-get install tcsh
sudo apt-get install csh
sudo apt-get install libx11-dev
sudo apt-get install tcl-dev tk-dev
sudo apt-get install libcairo2-dev
sudo apt-get install mesa-common-dev libglu1-mesa-dev
sudo apt-get install libncurses-dev
```
Now, We can use the following command to download magic
```
git clone https://github.com/RTimothyEdwards/magic
```
The we use the below commands to install magic
```
cd magic/
./configure
sudo make
sudo make install
```
### -About Physical Design
 Physical design means --->> netlist (.v ) converted into GDSII form(layout form)
logical connectivity of cells converted into physical connectivity.
During physical design, all design components are instantiated with their geometric representations. In other words, all macros, cells, gates, transistors, etc., with fixed shapes and sizes per fabrication layer, are assigned spatial locations (placement) and have appropriate routing connections (routing) completed in metal layers.
### -Making Config file for running OpenLane
We make a file named as config.jason, which is used to configure OpenLane for our project
```
{
    "DESIGN_NAME": "iiitb_brg",
    "VERILOG_FILES": "dir::src/iiitb_brg.v",
    "CLOCK_PORT": "clkin",
    "CLOCK_NET": "clkin",
    "GLB_RESIZER_TIMING_OPTIMIZATIONS": true,
    "CLOCK_PERIOD": 65,
    "PL_TARGET_DENSITY": 0.7,
    "FP_SIZING" : "relative",
    "pdk::sky130*": {
        "FP_CORE_UTIL": 55,
        "scl::sky130_fd_sc_hd": {
            "FP_CORE_UTIL": 55
        }
    },
    
    "LIB_SYNTH": "dir::src/sky130_fd_sc_hd__typical.lib",
    "LIB_FASTEST": "dir::src/sky130_fd_sc_hd__fast.lib",
    "LIB_SLOWEST": "dir::src/sky130_fd_sc_hd__slow.lib",
    "LIB_TYPICAL": "dir::src/sky130_fd_sc_hd__typical.lib",  
    "TEST_EXTERNAL_GLOB": "dir::/src/*"

}
```
We make a folder inside openlane->design with the name iiitb_brg. Inside this folder we put the above config.jason file and also make one more folder names as SRC which contains the source file. We paste the iiitb_brg.v file in the source file.
Now we go into the OpenLane folder and run the following command to automate the whole ASIC flow.
```
sudo make mount
./flow.tcl -design iiitb_brg
```

To view the final layout we use magic and run the following command after opening terminal in openlane->design->iiitb_brg->runs->RUN_2022.08.30_09.58.31->results

```
magic -T /home/rohitr/rohit/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../../tmp/merged.nom.lef def read iiitb_brg.def
```
We get the following layout as shown below
<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/187413490-05ae8b94-ad97-4898-81a1-901231036450.png"width="1000"/><br>
  Fig 6. Layout
</p>
### -Placing VSD inverter (sky130_vsdinv) in the layout
First we need to invoke the vsd standard cell we do this by the following command

```
git clone https://github.com/nickson-jose/vsdstdcelldesign
```
To invoke magic to view the sky130_inv.mag file, the sky130A.tech file must be included in the command along with its path. To ease up the complexity of this command, the tech file can be copied from the magic folder to the vsdstdcelldesign folder.
```
magic -T sky130A.tech sky130_inv.mag &
```
We can now see the standard cell inverter layout
<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/187507051-8bb352ea-81e1-48bc-babc-316abfc42b29.png"width="1000"/><br>
  Fig 8. Inverter layout
</p>
Now we need to define the ports in the inverter. 
We select the port A, Y, VPWR and VGND one by one and then go to edit->text and then edit according to below
<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/187509639-7c313821-9bad-42c6-b311-8a6cd8166b7f.png"width="1000"/><br>
  Fig 9. Setting port A
</p>
Now go to Tkcon.tcl window and type following command with A port selected.

```
port class input
port use signal
```
<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/187509669-fd4413d6-c9c8-4ac6-82df-fec70045434a.png"width="1000"/><br>
  Fig 10. Setting Port Y
</p>
Now go to Tkcon.tcl window and type following command with Y port selected.

```
port class output
port use signal
```
<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/187509684-4c7c2d53-e791-42b0-a06f-25117bc3ec17.png"width="1000"/><br>
  Fig 11. Setting port VPWR
</p>

Now go to Tkcon.tcl window and type following command with VPWR port selected.
```
port class inout
port use power
```
<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/187509695-9c3f5bac-e0b5-4559-87ce-5b08156ef661.png"width="1000"/><br>
  Fig 12. setting port VGND
</p>
Now go to Tkcon.tcl window and type following command with VGND port selected.
```
port class inout
port use ground
```
Now type the following command to generate the lef file

```
lef write
```
To place the inverter in the project. We use the generated lef file. We copy the sky130_vsdinv.lef file to the src of our project. 
Now we need to edit the cofig.jason file as below

```
{
    "DESIGN_NAME": "iiitb_brg",
    "VERILOG_FILES": "dir::src/iiitb_brg.v",
    "CLOCK_PORT": "clk",
    "CLOCK_NET": "clk",
    "GLB_RESIZER_TIMING_OPTIMIZATIONS": true,
    "CLOCK_PERIOD": 65,
    "PL_RANDOM_GLB_PLACEMENT": 1,
    "PL_TARGET_DENSITY": 0.5,
    "FP_SIZING" : "relative",

"LIB_SYNTH": "dir::src/sky130_fd_sc_hd__typical.lib",
"LIB_FASTEST": "dir::src/sky130_fd_sc_hd__fast.lib",
"LIB_SLOWEST": "dir::src/sky130_fd_sc_hd__slow.lib",
"LIB_TYPICAL": "dir::src/sky130_fd_sc_hd__typical.lib",
"TEST_EXTERNAL_GLOB": "dir::../iiitb_brg/src/*",
"SYNTH_DRIVING_CELL":"sky130_vsdinv",

    "pdk::sky130*": {
        "FP_CORE_UTIL": 55,
        "scl::sky130_fd_sc_hd": {
            "FP_CORE_UTIL": 55
        }
    }
}
```

Now we run the OpenLane flow command after invoking openlane. Go to OpenLane folder and run the following command


```
sudo make mount
package require openlane 0.9
prep -design iiitb_brg
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs
run_synthesis
run_floorplan
run_placement
```

In order to see the layout we now use magic by going into OpenLane->designs->iiitb_brg->runs->results->placements directory and then running the following command

```
magic -T /home/rohitr/rohit/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def read iiitb_brg.def &
```

We get the sky130_vsdinv included

<p align="center">
  <img src="https://user-images.githubusercontent.com/110080106/187512687-a2cdd6cc-49a9-4c00-b4de-7093b4be03dd.png"width="1000"/><br>
  Fig 13. Inverter in the project
</p>


### Author
- Rohit Raj
### Acknowledgement 
Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.
### Contact Information
- Rohit Raj, M.Tech VLSI, Batch 2022-2024, International Institute Of Information Technology, Bangalore(IIIT B), rohitraj116@gmail.com
