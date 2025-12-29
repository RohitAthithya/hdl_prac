/* Problem statement: 256-to-1 4 bit multiplexer | Mux256to1v
*   Create a 4-bit wide, 256-to-1 multiplexer.
* The 256 4-bit inputs are all packed into a single 1024-bit input vector.
* sel=0 should select bits in[3:0], sel=1 selects bits in[7:4], sel=2 selects bits in[11:8], etc.
*/
module top_module
(
    //output(s)
    output [3:0] out,

    //input(s)
    input [1023:0] in,
    input [7:0] sel
);

    //SOLUTION 3:
    assign out = {
        in[sel*4+3],
        in[sel*4+2],
        in[sel*4+1],
        in[sel*4+0]
    };

    //SOLUTION 2:
    // assign out =in[sel*4 +: 4];


    //SOLUTION 1: using temporary register to store the index
    // reg [10:0] tmp_indx;
    // assign tmp_indx = sel << 2;
    // assign out = in[tmp_indx +: 4];
endmodule

/*
* EXPLANATION OF SOLUTION 1:
* value of "sel" gives the index
* output bus size is 4 bits
* [even from the question's explanation] we know that
* if sel = 0, then out = in[3:0]
* if sel = 1, then out = in[7:4]
* if sel = 2, then out = in[11:8]
*  ...
* then it can be finalized as:
*   out = in[sel*4+3 : sel*4]
*   (or) with advanced syntaxing;
*   out = in[sel*4+3 -: 4]
*   (or)
*   out = in[sel*4 +: 4]
*
* therefore to store the value of the sel*4
* we use the temporary reg tmp_inx to store the value
*
* also note: instead of multiplying an unsigned integer with 4,
* We do a bitwise left shifting by 2 positions
*
*/
