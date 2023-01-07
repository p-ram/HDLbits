`default_nettype none
module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);
  //when load, copy data to counter, when load is 0 decreament counter 
    reg [9:0] counter;
    always@(posedge clk) begin
        if(load ==1)
            counter<=data;
        else begin 
            if (counter ==0)
            	counter <= counter;
        	else
          		counter <=counter -1;
        end
	end
	//when counter is 0, assert tc to 1
    always@(*) begin
        if (counter ==0)
            tc=1;
        else
            tc=0;
    end
        
endmodule
