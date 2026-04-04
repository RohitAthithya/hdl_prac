/*
* Problem statement: Create a 100-bit binary adder.
* The adder adds two 100-bit numbers and a carry-in to produce a 100-bit sum and carry out.
* 
*/
// the problem setter expects a single line solution.
// other approaches are ignored because they have already been discussed with lesser number of bits,
// here the simplest/expected solution has been provided.

module top_module
#(
    parameter NUM_BITS = 100
)
(
    //output(s)
    output cout,
    output [NUM_BITS-1:0] sum,

    //inputs(s)
    input [NUM_BITS-1:0] a, b,
    input cin
);
    assign {cout, sum} = a + b + cin;
endmodule