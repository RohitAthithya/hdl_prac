/*
* Problem statement: implement the circuit described by the kmap
* kmap description:
*       AB 00 01 11 10
*       cd 00 d  0  1  1
*          01 0  0  d  d        
*          11 0  1  1  1
*          10 0  1  1  1
*/
module top_module
(
    //output(s)
    output out,

    //inputs(s)
    input a, b, c, d
);
    assign out = a | (~b & c);
endmodule