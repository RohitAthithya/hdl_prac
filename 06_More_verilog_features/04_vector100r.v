/* Problem statement: vector100r | combination for-loop vector reversal
*
* Given a 100-bit input vector [99:0], revers its bit ordering
*
*/

module top_module
#(
    parameter NUM_BITS = 100
)
(
    //output
    output wire [NUM_BITS - 1 : 0] out, //used in case of continuous assignment solution
    // output reg [NUM_BITS - 1 : 0] out, // used in case of procedural block solution

    //input
    input [NUM_BITS - 1 : 0] in

);
    //SOLUTION 2:
    //using generate blocks and continuous assignments
    genvar i;
    generate
        for (i = 0; i < NUM_BITS; i++) begin: bit_reverser
            assign out[i] = in[NUM_BITS - 1 - i];
        end
    endgenerate

    //SOLUTION 1:
    // integer i;
    // always @ (*) begin
    //     for (i = 0; i < NUM_BITS; i++) begin: bit_reversal
    //         out[NUM_BITS - 1 - i ] = in[i];
    //     end
    // end
endmodule