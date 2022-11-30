module dff_with_enable(
    input clock,
    input d,
    input enable,
    output reg q
);

always @(posedge clock)
begin : dff_with_enable
    if(enable)
        q <= d;
end

endmodule