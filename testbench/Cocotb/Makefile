
TOPLEVEL_LANG ?= vhdl

ifeq ($(TOPLEVEL_LANG),verilog)
  VERILOG_SOURCES = $(shell dirname $(shell dirname $(shell pwd)))/source/Verilog/simple_dff.v
else ifeq ($(TOPLEVEL_LANG),vhdl)
  VHDL_SOURCES = $(shell dirname $(shell dirname $(shell pwd)))/source/VHDL/simple_dff.vhdl
endif

TOPLEVEL = simple_dff
MODULE = test_simple_dff

include $(shell cocotb-config --makefiles)/Makefile.sim