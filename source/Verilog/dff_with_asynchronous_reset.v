module dff_with_asynchronous_reset(
    input CLK,
    input D,
    input SR,
    output reg Q
);

always @(posedge CLK or posedge SR)
begin : dff_async_reset
    if(SR)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule