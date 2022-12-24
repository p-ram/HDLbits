`default_nettype none
module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);
    //reduction operator for -> and or xor
    assign out_and = &in; 
    assign out_or = |in; 
    assign out_xor = ^in;
    
endmodule
