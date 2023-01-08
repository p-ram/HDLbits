//DFF with active low sync reset with byte enable to control
`default_nettype none
module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always@(posedge clk) begin
        if(!resetn)
            q<=0;
        else begin
            case(byteena)
                2'b00:  q<=q;
                2'b01: q<={q[15:8],d[7:0]};
                2'b10: q<={d[15:8],q[7:0]};
                2'b11: q<=d;
            endcase
        end
    end

endmodule
