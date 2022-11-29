module dff_with_synchronous_reset(
    input CLK,
    input D,
    input RS,
    output reg Q
);

always @(posedge CLK)
begin : dff_with_sync_reset
    if(RS)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule