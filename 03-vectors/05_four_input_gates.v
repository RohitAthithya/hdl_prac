/* Problem statement: Gates4
* Build a combination circuit with four inputs, in[3:0]
* there are 3 outputs:
*   - out_and   : output of a 4-input AND gate.
*   - out_or    : output of a 4-input OR gate.
*   - out_xor   : output of a 4-input XOR gate.
*
*/

`default_nettype none

module top_module
#(
    parameter IN_NUM_BITS = 4
)
(
    //outputs
    output out_and,
    output out_or,
    output out_xor,

    //input
    input [IN_NUM_BITS - 1: 0] in //input is a 4 bit wide bus - NOTE: following: little endianness

);

    assign out_and  = (in[3] & in[2] & in[1] & in[0]);
    assign out_or   = (in[3] | in[2] | in[1] | in[0]);
    assign out_xor  = (in[3] ^ in[2] ^ in[1] ^ in[0]);

endmodule
