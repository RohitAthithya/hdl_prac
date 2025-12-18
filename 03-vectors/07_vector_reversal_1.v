/* Problem statement: vectorr
* Given an 8-bit input vector [7:0], reverse its bit ordering.
*/

module top_module
#(
    parameter IN_NUM_BITS = 8
)
(
    //output
    output [IN_NUM_BITS - 1 : 0] out,

    //input
    input [IN_NUM_BITS - 1 : 0] in
);

    genvar i;
    generate
        for (i = 0; i < IN_NUM_BITS; i++) begin : reverse_bit_order
            assign out[i] = in[IN_NUM_BITS - 1 - i];
        end
    endgenerate
endmodule
