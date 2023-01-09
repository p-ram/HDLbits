`default_nettype none
module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 

    always@(posedge clk) begin
        if(load)
            q<=data;
        else begin
            if(~ena)
                q<=q;
            else begin
                case(amount)
                    2'b00: q<=q<<<1;
                    2'b01: q<=q<<<8;
                    //q >>> 1 and q >>> 8 did not work, not sure why ?
                   //syntax for replication  { {2{1}}, 0,0} -> 1100
                    2'b10: q<={q[63],q[63:1]};
                    2'b11: q<={ {8{q[63]}},q[63:8] };
                endcase
            end
        end
    end
endmodule
