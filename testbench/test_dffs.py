# =====================================
# Author : Theophile Loubiere
# website : www.learn-fpga-easily.com
# ======================================

import random
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge, RisingEdge


# ======================
# Constants Declaration
# ======================
NB_TEST = 100
RESET_VALUE = 0
RESET_NB_CYCLE = 10


def randomize_bit(signal): 
    """
    action: randomize the value of signal. Possible value : 0 or 1 
    """   
    bit = random.randint(0, 1)
    signal.value = bit 

def test_enable(dut, past_q):
    """
    parameters: dut, past_q(the value of dut.q during the previons cycle)
    action : raise exeption if enable behavior is not respected
    """
    if dut.enable.value == 1:
        assert dut.q.value == dut.d.value, "if enable is asserted, q should have the value of d after the clock tick"
    else:
        assert dut.q.value == past_q, f"if enable is not asserted, q={dut.q.value} should keep its previous value={past_q}"

def test_reset(dut, reset_value):
    """
    raise an exeption if the reset behavior is not respected
    """
    assert dut.q.value == reset_value, f"after reset q should be set at the reset value which is {reset_value}"

async def initialize(dut):
    """
    initialize dut input so there is now X or U
    """
    dut.d.value = 0
    if hasattr(dut, "enable"):
        dut.enable.value = 1
    if hasattr(dut, "reset"):
        dut.reset.value = 0
    await FallingEdge(dut.clock)

async def reset(dut):
    """
    reset the dut for 10 cycle

    """
    dut.reset.value = 1
    for _ in range(RESET_NB_CYCLE):
        await FallingEdge(dut.clock)
    dut.reset.value = 0
    await FallingEdge(dut.clock)

async def test(dut):
    """
    test the dut with synchronous reset and enable as control signals
    """
    for i in range(NB_TEST):
        randomize_bit(dut.d)
        randomize_bit(dut.enable)
        randomize_bit(dut.reset)
        past_q = dut.q.value

        await FallingEdge(dut.clock)

        if dut.reset.value == 1:
            test_reset(dut, RESET_VALUE)
        else:
            test_enable(dut, past_q)

@cocotb.test()
async def test_dff(dut):
    """ Test the DFF module"""

    clock = Clock(dut.clock, 10, units="us")  
    cocotb.start_soon(clock.start())

    print(f"TESTING : {dut}")
    await initialize(dut)
    await reset(dut)
    await test(dut)

    
    




