`default_nettype none
module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q);
    
    //async reset
    always@(posedge clk or posedge ar) begin
        if(ar)
            q<=0;
        else
            q<=d;
    end

endmodule
