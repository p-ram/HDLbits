`default_nettype none
module top_module( 
    input [99:0] in,
    output [99:0] out
);
	//use without for-loop - not sure, below soln using for-loop
    integer i;
    always@(*) begin
        for(i=0;i<100;i=i+1)
            out[99-i]=in[i];
    end
        
endmodule
