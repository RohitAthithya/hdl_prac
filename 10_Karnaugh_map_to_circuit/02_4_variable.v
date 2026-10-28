/*
* Problem statement: Implement the circuit described by the Karnaugh map below.
* k map description:
*      AB\CD 00 01 11 10
*      00    1   1  0  1
*      01    1   0  0  1
*      11    0   1  1  1
*      10    1   1  0  0
* 
*/
module top_module
(
    //output(s)
    output out,

    //inputs(s)
    input a, b, c, d
);

    assign out = (~a & ((b & c) | ~d)) | (~b & ~c) | (a & c & d);

endmodule