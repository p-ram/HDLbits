`timescale 1ps/1ps
module top_module ();
	specparam time_period =10;
    reg clk;
    reg rst;
    reg t;
    
    initial clk =0;
    always begin
        #(time_period/2) clk = ~clk;
    end
    
    //generate rst
    initial begin
    	  #0 rst=0;
        #20 rst =1;
        #10 rst =0;
    end
    
    //generate t
    initial begin
        #0 t=0;
        #30 t=1; 
    end
    
    tff tff_inst (.clk(clk),.reset(rst),.t(t));
    
endmodule
