module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
	
    wire [3:0] q0,q1,q2,q3;
    
    assign ena={ q2==4'd9 && q1==4'd9 && q0==4'd9 ,  q1==4'd9 && q0==4'd9, q0==4'd9};
    
    decade count0 (clk, reset, 1'b1, q0);
    decade count1 (clk, reset, ena[1], q1);
    decade count2 (clk, reset, ena[2], q2);
    decade count3 (clk, reset, ena[3], q3);
    
    //assign q=q0+q1*4'd10+q2*8'd100+q3*10'd1000; // wrong output -> gives q in hex
    assign q={q3,q2,q1,q0};
endmodule

module decade(input clk, reset,enable,
              output [3:0]q);
    //sync reset to 0, count 0-9
    always@(posedge clk) begin
        if(reset)
            q<=4'd0;
        else if(enable) begin
            if(q==4'd9)
                q<=4'd0;
            else
                q<=q+4'd1;
        end
    end
endmodule
