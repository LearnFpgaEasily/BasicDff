module dff_all_async(
    input clock,
    input d,
    input reset,
    input enable,
    output reg q
);

always @(posedge clock or posedge reset)
begin : dff_with_all_ctr_and_async_reset
    if(reset)
        q <= 1'b0;
    else
        begin  // enable management
            if(enable) 
                q <= d;
            else
                q <= 1'b0;
            
        end
end

endmodule;