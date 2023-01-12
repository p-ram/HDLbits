// Note the Verilog-1995 module declaration syntax here:
`default_nettype none
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    //define state parameters
    //state transitions - always comb 
    //state FF
    //output logic
    
    parameter A=0,B=1;
    reg state,next;//state and next are not parameter but are reg
    
    //state transitions
    always@(*) begin
        case(state)
            A: next=in?A:B;
            B: next=in?B:A;
        endcase
    end
    
    //state FF, sync reset
    always@(posedge clk) begin
        if(reset)
            state<=B;
        else
            state<=next;
    end
    
    //output logic
    always@(*) begin
        out = (state==B); 
    end

endmodule
