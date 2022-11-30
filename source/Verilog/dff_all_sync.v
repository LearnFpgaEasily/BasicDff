module dff_all_sync(
    input clock,
    input d,
    input reset,
    input enable,
    output reg q
);

always @(posedge clock)
begin : dff_with_all_ctr_and_sync_reset
    if(reset)
        q <= 1'b0;
    else
        begin
            if(enable)
                q <= d;
            else
                q <= 1'b0;
        end
end
endmodule
