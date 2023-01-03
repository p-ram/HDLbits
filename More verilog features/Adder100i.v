`default_nettype none
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    integer i;
    always@(a or b or cin) begin
        for(i=0;i<100;i=i+1) begin
            if(i==0) begin
            	sum[i] = a[i] ^ b[i] ^ cin;
            	cout[i] = (a[i] & b[i]) | (cin & (a[i] ^ b[i])); 
            end
            else begin
                sum[i] = a[i] ^ b[i] ^ cout[i-1];
                cout[i] = (a[i] & b[i]) | (cout[i-1] & (a[i] ^ b[i]));                
            end
        end
    end
endmodule
