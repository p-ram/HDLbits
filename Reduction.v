`default_nettype none
module top_module (
    input [7:0] in,
    output parity); 

    //parity check- reduction operators
    assign parity = ^in; 
        
endmodule
