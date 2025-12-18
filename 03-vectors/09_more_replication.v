/* Problem statement: vector5
* Given five 1-bit signals (a, b, c, d, and e), compute all 25 pairwise one-bit comparisons in the 25-bit output vector.
* The output should be 1 if the two bits being compared are equal.
*
* out[24] = ~a ^ a;   // a == a, so out[24] is always 1.
* out[23] = ~a ^ b;
* out[22] = ~a ^ c;
* ...
* out[ 1] = ~e ^ d;
* out[ 0] = ~e ^ e;
*
*
* As the diagram shows, this can be done more easily using the replication and concatenation operators.
*
* The top vector is a concatenation of 5 repeats of each input
* The bottom vector is 5 repeats of a concatenation of the 5 inputs
*/

//NOTE: This problem set has a defined set of instructions, thus parameterization is not done for the top_module!
module top_module
(
    //outputs
    output [25 - 1 :0] out,

    //inputs
    input a, b, c, d, e
);

    reg [24:0] clone_input_signals;
    reg [24:0] rearragned_input_for_opn;

    assign clone_input_signals          = {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}}; //each input is replicated 5 times, then concatenated => 25 bit value
    assign rearragned_input_for_opn     = {5{{a,b,c,d,e}}}; //concatenate 5 inputs, then form one 5 bit value, then replicate it 5 times => 25 bit value

    assign out                          = ~ (clone_input_signals ^ rearragned_input_for_opn);
    //i.e. the equality operation can be done with not of xor operation: a == b => ~(a ^ b);

    //another solution:
    //without intermediary registers/logic cells to store values.
    // The output is XNOR of two vectors created by
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
    // assign out = ~{{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}} ^ {5{{a,b,c,d,e}}};

endmodule
