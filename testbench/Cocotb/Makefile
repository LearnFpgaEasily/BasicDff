
TOPLEVEL_LANG ?= vhdl

ifeq ($(TOPLEVEL_LANG),verilog)
  VERILOG_SOURCES = $(shell dirname $(shell dirname $(shell pwd)))/source/Verilog/dff_all_sync.v
else ifeq ($(TOPLEVEL_LANG),vhdl)
  VHDL_SOURCES = $(shell dirname $(shell dirname $(shell pwd)))/source/VHDL/dff_all_sync.vhdl
endif

TOPLEVEL = my_dff_all_sync
MODULE = test_dffs

include $(shell cocotb-config --makefiles)/Makefile.sim