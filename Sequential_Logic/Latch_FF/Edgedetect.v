`default_nettype none
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    integer i;
    reg [7:0] in_p;
    //delay input by a clock and then check if input =1 and delayed_input =0 then we can confirm there is a posedge
    always@(posedge clk) begin
        in_p <= in;  
        //iterate for all bits 
        for (i=0;i<8;i=i+1) begin
            if(in_p[i] == 0 && in[i] == 1)
                pedge[i] =1;
        	else
                pedge[i] = 0;
    	end
    end

endmodule
