module simple_dff(
    input clk,
    input d,
    output reg q
);

always @(posedge clk)
begin : dff_without_control_signal_nor_reset
    q<= d;
end

endmodule