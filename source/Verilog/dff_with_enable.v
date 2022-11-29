module dff_with_enable(
    input CLK,
    input D,
    input CE,
    output reg Q,
);

always @(posedge CLK)
begin : dff_with_ce
    if(CE)
        Q <= D;
end

endmodule dff_with_enable