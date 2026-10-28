/* Problem statement: 2-to-1 multiplexer | Mux2to1
* Create a one-bit wide, 2-to-1 multiplexer. when sel;=0. When sel=0, choose a. When sel=1, choose b
*/
module top_module
(
    //output(s)
    output out,

    //input(s)
    input a, b, sel
);

    assign out = sel ? b : a;

endmodule