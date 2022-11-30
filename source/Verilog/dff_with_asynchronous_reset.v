module dff_with_asynchronous_reset(
    input clock,
    input d,
    input reset,
    output reg q
);

always @(posedge clock or posedge reset)
begin : dff_async_reset
    if(reset)
        q <= 1'b0;
    else
        q <= d;
end

endmodule