module dff_all_sync(
    input CLK,
    input D,
    input SR,
    input CE,
    output reg Q
);

always @(posedge CLK)
begin : dff_with_all_ctr_and_sync_reset
    if(SR)
        Q <= 1'b0;
    else
        begin
            if(CE)
                Q <= D;
            else
                Q <= 1'b0;
        end
end

endmodule