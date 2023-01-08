`default_nettype none
module top_module (
    input clk,
    input reset,
    output [3:0] q);

    always@(posedge clk) begin
        if(reset)
            q<=1;
        else begin
            //q>10 means we are counting from 1 to 11 due to delay in sync block
            if(q>9)
                q<=1;
            else
                q<=q+1;
        end
    end

endmodule
