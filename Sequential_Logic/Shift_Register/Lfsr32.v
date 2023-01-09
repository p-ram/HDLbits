`default_nettype none
module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    integer i;
    always@(posedge clk) begin
        if(reset)
            q<=32'h1;
        else begin
            /*for(i=31;i>-1;i=i-1) begin
                if(i==31)
                    q[i]<= 1'b0 ^ q[0];
                else if(i==21 | i==1)
                    q[i]<= q[i] ^ q[0];
                else if(i==0)
                    q[0]<=q[1]^q[0];    
                else //Error here, output pins stuck at zero 
                    q[i]<=q[i];
            end*/
            
            q<={1'b0 ^q[0],q[31:23],q[22]^q[0],q[21:3],q[2]^q[0],q[1]^q[0]};
        end
    end

endmodule
