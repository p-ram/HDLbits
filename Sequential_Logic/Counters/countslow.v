`default_nettype none
module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always@(posedge clk) begin
        if(reset)
            q<=0;
        else begin
            //dont forget ~slowena case
            if(~slowena)
                q<=q;
            else begin
                if(q>8)
                    q<=0;
                else
                    q<=q+1;
            end
        end
    end

endmodule
