/* Problem statement: Mt2015 a4 | Combine circuits a and b
* Taken from 2015 midterm question 4
*
* See mt2015_q4a and mt2015_q4b for the submodules used here.
* The top-level design consists of two instantiations each of subcircuits A and B,
* as shown in the image.
*/


module top_module
(
    //output(s)
    output z,

    //input(s)
    input x,
    input y
);
    wire ia1_z;
    wire ia2_z;
    wire ib1_z;
    wire ib2_z;

    A IA1 (
        .z(ia1_z),
        .x(x),
        .y(y)
    );

    A IA2 (
        .z(ia2_z),
        .x(x),
        .y(y)
    );

    B IB1 (
        .z(ib1_z),
        .x(x),
        .y(y)
    );

    B IB2 (
        .z(ib2_z),
        .x(x),
        .y(y)
    );


    assign z = (
            (ia1_z | ib1_z)
        ^   (ia2_z & ib2_z)
    );

endmodule


module A(
    //output
    output z,

    //inputs
    input x,
    input y
);

    assign z = (x^y) & x;


endmodule

module B
(
    //output
    output z,

    //inputs
    input x,
    input y
);

    //solution 1 : by deduction and intuition
    assign z = ~(x ^ y);
endmodule
