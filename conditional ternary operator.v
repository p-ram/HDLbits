`default_nettype none
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
  
  //method 1 - create intermediate wire
  /*wire [7:0] min_ab,min_cd;
    assign min_ab = a<b ? a : b;
    assign min_cd = c<d ? c : d;
    assign min = min_ab < min_cd ? min_ab : min_cd;
    */
    
  //method 2- direct without intermediate wires
  assign min = (a < b ? a : b ) < ( c < d ? c : d) ? (a < b ? a : b ) : ( c < d ? c : d);
    
endmodule
