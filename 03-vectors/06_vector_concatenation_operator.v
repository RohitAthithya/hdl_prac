/* Problem statement: vector3
* Given several input vectors, concatenate them together then split thme up in to several output vectors.
* There are six 5-bit input vectors: a, b, c, d, e, and f, for a total of 30 bits of input. There are four 8-bit ouitput vectors: w, x, y, and z, for 32 bits of output.
* the output should be a concatenation of the input vectors folllowed by two 1 bits.
*/


module top_module
#(
    parameter IN_NUM_BITS = 5,
    parameter OUT_NUM_BITS = 8
)
(
    // We know that all the inputs are IN_NUM_BITS wide, so the declarations are done in single line.
    //ideally, in clean code practices, we mention the signal in sepearate lines. better debug, better readability

    //outputs
    output [OUT_NUM_BITS - 1 : 0]   w,
    output [OUT_NUM_BITS - 1 : 0]   x,
    output [OUT_NUM_BITS - 1 : 0]   y,
    output [OUT_NUM_BITS - 1 : 0]   z,

    //inputs
    input [IN_NUM_BITS - 1 : 0]     a,
    input [IN_NUM_BITS - 1 : 0]     b,
    input [IN_NUM_BITS - 1 : 0]     c,
    input [IN_NUM_BITS - 1 : 0]     d,
    input [IN_NUM_BITS - 1 : 0]     e,
    input [IN_NUM_BITS - 1 : 0]     f

);

    localparam ONES         = 2'b11;

    assign { w, x, y, z}    = { a, b, c, d, e, f, ONES};

endmodule