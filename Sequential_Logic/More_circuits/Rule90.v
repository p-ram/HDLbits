`default_nettype none
module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
	
    integer i;
    always@(posedge clk) begin
        if(load)
            q<=data;
        else begin
            for(i=0;i<512;i=i+1) begin
                if(i==0) begin
                    q[i]<=1'b0 ^ q[i+1];
                end
                else if(i==511) begin
                    q[i]<= 1'b0 ^ q[i-1];
                end
                else begin
                    q[i]<= q[i-1] ^ q[i+1];
                end 
            end
        end
    end
endmodule
