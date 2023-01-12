module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

	parameter OFF=0,ON=1;
    reg state,next;
    
    //state transition
    always@(*) begin
        case(state)
            OFF: next=(j==0)?OFF:ON;
            ON: next=(k==0)?ON:OFF;
        endcase
    end
    
    //state FF
    always@(posedge clk) begin
        if(reset)
            state<=OFF;
        else
            state<=next;
    end

    //output
    assign out=(state==ON);
    
endmodule
