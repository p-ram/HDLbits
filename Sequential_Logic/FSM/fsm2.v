module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

 	parameter OFF=0,ON=1;
    reg state,next;
    
    //state transition
    always@(*) begin
        case(state)
            OFF: next=(j==0)?OFF:ON;
            ON:  next=(k==0)?ON:OFF;
        endcase
    end
    
    //state FF, areset to OFF
    always@(posedge clk or posedge areset) begin
        if( areset)
            state<=OFF;
        else
            state<=next;
    end
    
    //output logic
    always@(*) begin
        if(state==OFF)
            out=0;
        else
            out=1;
    end    

endmodule
