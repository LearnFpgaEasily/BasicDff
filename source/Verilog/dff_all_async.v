module dff_all_async(
    input CLK,
    input D,
    input SR,
    input CE,
    output reg Q
);

always @(posedge CLK or posedge SR)
begin : dff_with_all_ctr_and_async_reset
    if(SR)
        Q <= 1'b0;
    else
        begin  // enable management
            if(CE) 
                Q <= D;
            else
                Q <= 1'b0;
            
        end
end

endmodule;