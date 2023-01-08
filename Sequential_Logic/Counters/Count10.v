`default_nettype none
module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    always@(posedge clk) begin
        if(reset)
            q<=0;
        else begin
            //be carefully regarding q>8 or q>9 as this is sync block, we will have one clock delay
            //thus q>9 means we would have included 0 to 10 instead of 0 to 9
            if(q>8)
                q<=0;
            else
                q<=q+1;
        end
    end
endmodule
