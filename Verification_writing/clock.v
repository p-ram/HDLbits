`timescale 1ps/1ps
module top_module ( );
	specparam time_period = 10; //parameter time_period=10; can also be used 
    reg clk;
    initial clk =0; 
        
    always begin
        #(time_period/2) clk = ~clk; 
    end
    dut dut_inst(.clk(clk));
endmodule
