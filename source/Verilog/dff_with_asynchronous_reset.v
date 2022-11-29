module dff_with_synchronous_reset(
    input CLK,
    input D,
    input RS,
    output reg Q,
);

always @(posedge CLK or posedge RS)
begin : dff_with_ce_and_sync_rs
    if(RS)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule dff_with_synchronous_reset