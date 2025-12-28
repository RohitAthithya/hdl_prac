/* Problem statement:
* Build a circuit that sign-extends an 8-bit number to 32 bits.
* This requires a concatenation of 24 copies of the sign bit
* (i.e., replicate bit[7] 24 times) followed by the 8-bit number itself.
*/

module top_module
#(
    parameter IN_SIZE = 8,
    parameter OUT_SIZE = 32
)
(
    //output
    output [OUT_SIZE - 1 : 0] out,

    //input
    input [IN_SIZE - 1 : 0] in
);

    localparam NUM_EXTEND_BITS = OUT_SIZE - IN_SIZE;

    assign out = {
            {NUM_EXTEND_BITS{in[IN_SIZE - 1]}},
            {in[IN_SIZE - 1 : 0]}
        };

endmodule


//Note that, when storing the 'in' in a localparam, received an error saying that
// it is not a constant.
//therefore if we had to store the intermediary value [binary ones] then
// we have to use reg, not wire.