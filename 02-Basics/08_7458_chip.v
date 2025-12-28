/* Problem statement: 7458 chip
* Create a module with the same functionality as the 7458 chip. It has 10 inputs and 2 outputs.
* You may choose to use an assign statement to drive each of the output wires, or you may choose to declare (four) wires for use as intermediate signals,
* where each internal wire is driven by the output of one of the AND gates.
* For extra practice, try it both ways.
*
*/

module top_module
(
    //output
    output p1y,
    output p2y,

    //inputs
    input p1a, p1b, p1c, p1d, p1e, p1f,
    input p2a, p2b, p2c, p2d
);

    assign p1y = ( p1a & p1c & p1b) | ( p1f & p1e & p1d);
    assign p2y = ( p2a & p2b) | ( p2c & p2d);

endmodule
