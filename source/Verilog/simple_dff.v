module simple_dff(
    input CLK,
    input D,
    output reg Q
);

always @(posedge CLK)
begin : dff_without_control_signal_nor_reset
    Q <= D;
end

endmodule