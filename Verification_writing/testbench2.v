`timescale 1ps/1ps
module top_module();
	specparam time_period =10;
    reg inp;
    reg clk;
    reg [2:0] s;
    
  //clk 
    initial clk =0;
    always begin
        #(time_period/2) clk = ~clk;
    end
    
  //seperate initial for generating inp
    initial begin
    	#0 inp=0;
        #20 inp=1;
        #10 inp=0;
        #10 inp=1;
        #30 inp=0;
    end
    
  //seperate initial for generating s
    initial begin
		#0 s=2;
        #10 s=6;
        #10 s=2;
        #10 s=7;
        #10 s=0;
    end
    
  //instantiate module q7
    q7 q7_ins(.clk(clk),.in(inp),.s(s));
    
endmodule
