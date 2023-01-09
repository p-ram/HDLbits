module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg q0,q1,q2=0;
    always@(posedge clk) begin
      if(~resetn) begin //active low reset
            out<=1'b0;
            //wrong output if not reset to 0
        	//q0,q1,q2=0; //wrong syntax
            q0<=1'b0;q1<=1'b0;q2<=1'b0;
        end
        else begin
            q0<=in;
            q1<=q0;
            q2<=q1;
            out<=q2;
        end 
    end

endmodule
