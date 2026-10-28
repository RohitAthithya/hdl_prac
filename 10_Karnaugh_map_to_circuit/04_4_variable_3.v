/*
* Problem statement: implement the circuit described by the kmap
* kmap description:
*          ab 00 01 11 10
*       cd 00  0  1  0  1
*          01  1  0  1  0        
*          11  0  1  0  1
*          10  1  0  1  0
*/

module top_module
(
    //output(s)
    output out,

    //inputs(s)
    input a,b,c, d
);
    assign out = a ^ b ^ c ^ d;
endmodule