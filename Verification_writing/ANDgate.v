`timescale 1ps/1ps 
module top_module();
	specparam time_period=10; //using specparam instead of parameter due to convention
    reg [1:0] inp; // only need to generate input signal which instantiates AND gate
        
    initial begin
       #0 inp =0;
       #10 inp =1;
       #10 inp =2;
	   #10 inp =3;
    end
    
    andgate andgate_inst (.in(inp)); 
    	
endmodule
