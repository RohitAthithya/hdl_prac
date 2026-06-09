/*
* Problem statement: A single-output digital system with four inputs (a,b,c,d) 
* generates a logic-1 when 2, 7, or 15 appears on the inputs, 
* and a logic-0 when 0, 1, 4, 5, 6, 9, 10, 13, or 14 appears. 
* The input conditions for the numbers 3, 8, 11, and 12 never occur in this system.
* For example, 7 corresponds to a,b,c,d being set to 0,1,1,1, respectively.

2       => 0010
7       => 0111
15      => 1111


Determine the output out_sop in minimum SOP form, and the output out_pos in minimum POS form.
* 
*/
module top_module (
    output out_sop, out_pos,

    input a, b, c, d
); 
    assign out_sop = a & (b | (~c & ~d));
    assign out_pos = 0;
endmodule