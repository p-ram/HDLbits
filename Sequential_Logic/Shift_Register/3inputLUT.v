`default_nettype none
module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
	
    reg [7:0] Q;
    //8bit Shift reg
    always@(posedge clk) begin
        if(~enable)
            Q<=Q;
        else if(enable) begin
            Q<= {Q[6:0],S};
        end
    end
    
    always@(*) begin
        case({A,B,C})
            3'h0: Z=Q[0];
            3'h1: Z=Q[1];
            3'h2: Z=Q[2];
            3'h3: Z=Q[3];
            3'h4: Z=Q[4];
            3'h5: Z=Q[5];
            3'h6: Z=Q[6];
            3'h7: Z=Q[7];
        endcase
    end
endmodule
