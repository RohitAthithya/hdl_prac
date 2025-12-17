/* Problem statement: vector1
* Build a combinational circuit that splits an input half-word (16 bits, [15:0] ) into lower [7:0] and upper [15:8] bytes.
*/
module top_module
#(
    parameter   IN_NUMB_BITS = 16,
    parameter   OUT_NUM_BITS = 8
)
(
    //outputs
	output [OUT_NUM_BITS - 1 : 0]   out_hi,
	output [OUT_NUM_BITS - 1 : 0]   out_lo,

    //input
	input [IN_NUMB_BITS - 1 : 0]    in
);

    assign {out_hi, out_lo}         = in;

    //harcoded solution
    // assign out_hi = in[15:8];
    // assign out_lo = in[7:0];

endmodule