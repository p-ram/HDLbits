`default_nettype none
module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    //creating posedge DFF
    wire d0;
    always@(posedge clk) begin
        Q<=d0; 
    end
    
    //combinational always block for 2 muxes
    always@(*) begin
        if(L) 
            d0=R;
        else begin
            if(E)
                d0=w;
            else
                d0=Q;
        end
    end

endmodule
