/* Problem statement: andgate
* Create a module that implements an AND gate.
*/

module top_module
(
    //outputs
    output out,

    //inputs
    input a,
    input b

);

    assign out = (a & b); //better use round brackets, as a standard practice

endmodule
