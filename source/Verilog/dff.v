module dff(
    input clock,
    input d,
    input reset,
    input enable,
    output reg q
);

always @(posedge clock)
begin
    if(reset)
        q <= 1'b0;
    else
        if(enable)
            q <= d;
end
endmodule
