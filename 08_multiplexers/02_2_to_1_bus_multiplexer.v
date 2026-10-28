/* Problem statement: 2-to-1 bus multiplexer | mux2to1v
* Create a 100-bit wise,2-to-1 multiplexer. When sel=0, choose a. When sel=1, choose b.
*/
module top_module
(
    //output(s)
    output [99:0] out,

    //input(s)
    input [99:0] a, b,
    input sel
);

    assign out = sel ? b : a;

endmodule