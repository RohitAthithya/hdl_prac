module mux_2to1_quadruple(
    output [3:0] y,

    input [3:0] a,      // quadruple input a
    input [3:0] b,      // quadruple input b
    input select,       // single select line
    input enable_       //active low enable
);
    //dataflow model
    assign y = enable_? 4'bzzzz  : (select ? b : a);

endmodule