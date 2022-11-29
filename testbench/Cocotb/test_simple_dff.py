import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge

@cocotb.test()
async def test_dff_simple(dut):
    """ Test that d propagates to q """

    clock = Clock(dut.clk, 10, units="us")  
    cocotb.start_soon(clock.start())  
    await FallingEdge(dut.clk)

    for i in range(10):
        val = random.randint(0, 1)
        dut.d.value = val 
        await FallingEdge(dut.clk)
        assert dut.q.value == val, "output q was incorrect on the {}th cycle".format(i)