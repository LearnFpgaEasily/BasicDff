module dff_with_synchronous_reset(
    input clock,
    input d,
    input RS,
    output reg q
);

always @(posedge clock)
begin : dff_with_sync_reset
    if(RS)
        q <= 1'b0;
    else
        q <= d;
end

endmodule