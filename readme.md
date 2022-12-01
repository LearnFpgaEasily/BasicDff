this repository is a code exemple of article on www.learn-fpga-easily.com

To run the testbench you need cocotb(for both test), icarus-verilog(for verilog test) and ghdl(for vhdl test), and make

for vhdl
```
cd testbench
make TOPLEVEL_LANG=vhdl
```

for verilog
```
cd testbench
make TOPLEVEL_LANG=verilog
```