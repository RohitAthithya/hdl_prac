/*
* Build a circuit that has two 3-bit inputs that computes the bitwise-OR of the two vectors,
* the logical-OR of the two vectors, and the inverse (NOT) of both vectors.
* Place the inverse of b in the upper half of out_not (i.e., bits [5:3]), and the inverse of a in the lower half.
*/
module top_module
#(
    parameter IN_NUM_BITS = 3,
    parameter OUT_NUM_BITS = 3
)
(
    //outputs
    output [OUT_NUM_BITS + OUT_NUM_BITS - 1 : 0] out_not,
    output [OUT_NUM_BITS - 1 : 0] out_or_bitwise,
    output out_or_logical,

    //inputs
    input [IN_NUM_BITS - 1 : 0] a,
    input [IN_NUM_BITS - 1 : 0] b
);
    //output: not of b and a
    assign out_not = {~(b), ~(a)};

    //output: logical or
    assign out_or_logical = a || b;

    //output: bitwise or
    assign out_or_bitwise = a | b;


endmodule