This repository is a code example to illustrate article on [LearnFpgaEasily](https://learn-fpga-easily.com)

Articles:

1. [What is a DFF (D-Flip-Flop) ?](https://learn-fpga-easily.com/what-is-a-dff-d-flip-flop/)


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
