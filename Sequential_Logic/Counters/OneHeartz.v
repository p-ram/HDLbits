module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0]q0,q1,q2;
    /*
    counter 0 enable is always on
    counter 1 enable is on when q0=9
    counter 2 enable is on when q0=9 and q1=9, when we only consider q1=9 then we start 100th count after 90 and not after 99
    */
    assign c_enable={q1==4'd9 && q0==4'd9,q0==4'd9,1'b1};
    
    bcdcount counter0 (clk, reset, 1'b1,q0);
    bcdcount counter1 (clk, reset, c_enable[1],q1);
    bcdcount counter2 (clk, reset, c_enable[2],q2);
   	//when we have q=999 then high for a cycle 
    assign OneHertz= {q1==4'd9 && q0==4'd9 && q2==4'd9};

endmodule
