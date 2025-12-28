/* Problem statement: xnorgate
* Create a module that implements an XNOR gate.
*/

module top_module
(
    //output
    output out,

    //inputs
    input a,
    input b
);

    assign out = ~(a^b);

endmodule