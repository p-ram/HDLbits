`timescale 1ps/1ps
module top_module ( output reg A, output reg B );//
	specparam time_period = 10;
    // generate input patterns here
    initial begin
	  #0 A=0;
    #10 A=1; //#10 doesnt mean at 10ps, it means after 10ps
    #10 A=0;
    end
    
    //we can have any number of initial and I have seperated intial block for A and B since it runs simultaneosly 
    initial begin
    #(time_period *0) B=0;
    #(time_period*1.5) B=1;
    #(time_period*2.5) B=0;    
    end
    
endmodule
