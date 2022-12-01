
TOPLEVEL_LANG ?= vhdl
TOPLEVEL ?= dff


ifeq ($(TOPLEVEL_LANG),verilog)
  SIM=icarus 
  VERILOG_SOURCES = $(shell dirname $(shell pwd))/source/Verilog/$(TOPLEVEL).v
else ifeq ($(TOPLEVEL_LANG),vhdl)
  SIM=ghdl
  VHDL_SOURCES = $(shell dirname $(shell pwd))/source/VHDL/$(TOPLEVEL).vhdl
endif

MODULE = test_dffs

include $(shell cocotb-config --makefiles)/Makefile.sim