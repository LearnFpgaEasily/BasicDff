module dff_all_async(
    input CLK,
    input D,
    input RS,
    input CE,
    output reg Q,
);

always @(posedge CLK or posedge RS)
begin : dff_with_all_and_sync
    if(RS)
        Q <= 1'b0;
    else
        begin : enable management
            if (CE)
                Q <= D;
            else
                Q <= 1'b0;
        end
end

endmodule dff_with_synchronous_reset