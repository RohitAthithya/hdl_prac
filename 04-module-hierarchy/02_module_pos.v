/* Problem statement: module_pos
* This problem is similar to the previous one (module).
* You are given a module named mod_a that has 2 outputs and 4 inputs, in that order.
* You must connect the 6 ports by position to your top-level module's ports
* out1, out2, a, b, c, and d, in that order.
*
* You are given the following module:
* module mod_a ( output, output, input, input, input, input );
*/
module top_module
(
    //outputs
    output out1,
    output out2,

    //inputs
    input a,
    input b,
    input c,
    input d
);

    //must instantiate module: mod_a by position
    mod_a inst1 (
        out1,
        out2,
        a,
        b,
        c,
        d
    );


endmodule