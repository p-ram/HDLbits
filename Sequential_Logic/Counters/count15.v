`default_nettype none
module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);

    always@(posedge clk) begin
        if(reset)
            q<=4'h0;
        else
            q<=q+4'h1;
    end
endmodule
