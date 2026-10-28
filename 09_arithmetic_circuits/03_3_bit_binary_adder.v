/* Problem statement: Adder3 | 3 bit binary adder
* Now that you know how to build a full adder, make 3 instances of it
* to create a 3-bit binary ripple-carry adder.
* The adder adds two 3-bit numbers and a carry-in to produce a 3-bit sum and carry out.
* To encourage you to actually instantiate full adders,
* also output the carry-out from each full adder in the ripple-carry adder. cout[2] is the final carry-out from the last full adder, and is the carry-out you usually see.
*/

module fadd
(
    //output(s)
    output sum, cout,

    //input(s)
    input a, b, cin
);

    assign sum = a ^ b ^ cin;
    assign cout = a&b | b&cin | a&cin;

endmodule

module top_module
(
    //output(s)
    output [2:0] cout,
    output [2:0] sum,

    //input(s)
    input [2:0] a, b,
    input cin
);
    fadd fadd_bit0 (
        .sum(sum[0]),
        .cout(cout[0]),

        .a(a[0]),
        .b(b[0]),
        .cin(cin)
    );
    fadd fadd_bit1 (
        .sum(sum[1]),
        .cout(cout[1]),

        .a(a[1]),
        .b(b[1]),
        .cin(cout[0])
    );
    fadd fadd_bit2 (
        .sum(sum[2]),
        .cout(cout[2]),

        .a(a[2]),
        .b(b[2]),
        .cin(cout[1])
    );

endmodule