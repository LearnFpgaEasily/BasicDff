module simple_dff(
    input clock,
    input d,
    output reg q
);

always @(posedge clock)
begin : dff_without_control_signal_nor_reset
    q<= d;
end

endmodule