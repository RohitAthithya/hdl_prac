/* Problem statement: Even more gates | gatesv100
* See also the shorter version: Gates and vectors.

You are given a 100-bit input vector in[99:0]. We want to know some relationships between each bit and its neighbour:

out_both: Each bit of this output vector should indicate whether both the corresponding input bit and its neighbour to the left are '1'. For example, out_both[98] should indicate if in[98] and in[99] are both 1. Since in[99] has no neighbour to the left, the answer is obvious so we don't need to know out_both[99].
out_any: Each bit of this output vector should indicate whether any of the corresponding input bit and its neighbour to the right are '1'. For example, out_any[2] should indicate if either in[2] or in[1] are 1. Since in[0] has no neighbour to the right, the answer is obvious so we don't need to know out_any[0].
out_different: Each bit of this output vector should indicate whether the corresponding input bit is different from its neighbour to the left. For example, out_different[98] should indicate if in[98] is different from in[99]. For this part, treat the vector as wrapping around, so in[99]'s neighbour to the left is in[0].
*/

module top_module
(
    //outputs
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different,

    //input(s)
    input [99:0] in
);

    //proceeding with only the smaller solution
    assign out_both[98:0] = in[99:1] & in[98:0];
    assign out_any[99:1]  = in[99:1] | in[98:0] ;
    assign out_different[99:0] = in ^ {in[0], in[99:1]};

endmodule
