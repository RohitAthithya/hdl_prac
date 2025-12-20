/* Problem statement: module_shift
* You are given a module my_dff with two inputs and one output
* (that implements a D flip-flop).
*
* Instantiate three of them, then chain them together to make a shift register of length 3.
* The clk port needs to be connected to all instances.
*
* The module provided to you is:
* module my_dff ( input clk, input d, output q );
*
* Note that to make the internal connections,
* you will need to declare some wires.
* Be careful about naming your wires and module instances: the names must be unique.
*/

module top_module
(
    //output
    output q,

    //clk
    input clk,

    //input
    input d

);
    wire dff_1_q; //output of FF 1
    wire dff_2_q; //output of FF 2


    //note that ass design get complicated/increases in quantity,
    // the comments indicating inputs, clk/reset/enable .. and output are dropped.
    // they are implied from the port connections

    //DFF 1: input: d, clk: clk & output: dff_1_q
    my_dff dff_1 (
        .q(dff_1_q),
        .clk(clk),
        .d(d)
    );

    //DFF 2: input: dff_1_q, clk: clk & output: dff_2_q
    my_dff dff_2 (
        .q(dff_2_q),
        .clk(clk),
        .d(dff_1_q)
    );

    //DFF 3: input: dff_2_q, clk: clk & output: q [of the top_module]
    my_dff dff_3 (
        .q(q),
        .clk(clk),
        .d(dff_2_q)
    );


endmodule
