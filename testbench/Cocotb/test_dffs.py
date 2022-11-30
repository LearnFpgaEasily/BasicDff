import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge, RisingEdge

def random_bit(signal):    
    bit = random.randint(0, 1)
    signal.value = bit 

async def test_simple_dff(dut):
    for i in range(10):
        val = random.randint(0, 1)
        dut.d.value = val 
        await FallingEdge(dut.clock)
        assert dut.q.value == val, "output q was incorrect on the {}th cycle".format(i)

async def reset(dut):
    dut.reset.value = 1
    dut.enable.value = 0
    dut.d.value = 0
    for _ in range(10):
        await FallingEdge(dut.clock)
    dut.reset.value = 0
    await FallingEdge(dut.clock)

async def test_all_sync(dut):
    for i in range(100):
        random_bit(dut.d)
        random_bit(dut.enable)
        random_bit(dut.reset)
        past_q = dut.q.value

        await FallingEdge(dut.clock)

        if dut.reset.value == 1:
            assert dut.q.value == 0, "after reset q should be set at the reset value which is 0"
        else:
            if dut.enable.value == 1:
                assert dut.q.value == dut.d.value, "if enable is asserted, q should have the value of d after the clock tick"
            else:
                assert dut.q.value == past_q, f"if enable is not asserted, q={dut.q.value} should keep its previous value={past_q}"

@cocotb.test()
async def test_dff(dut):
    """ Test that d propagates to q """

    clock = Clock(dut.clock, 10, units="us")  
    cocotb.start_soon(clock.start())
    await reset(dut)

    print(f"TESTING : {dut}")
    if dut.__str__() == "simple_dff":
        await test_simple_dff(dut)
    elif dut.__str__() == "my_dff_all_sync":
        await test_all_sync(dut)
    
    




