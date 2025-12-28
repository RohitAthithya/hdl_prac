/* Problem statement: module_add
*
* You are given a module add16 that performs a 16-bit addition.
* Instantiate two of them to create a 32-bit adder.
*
* One add16 module computes the lower 16 bits of the addition result,
* while the second add16 module computes the upper 16 bits of the result,
* after receiving the carry-out from the first adder.
*
* Your 32-bit adder does not need to handle carry-in (assume 0) or carry-out (ignored),
* but the internal modules need to in order to function correctly.
*(In other words, the add16 module performs 16-bit a + b + cin,
* while your module performs 32-bit a + b).
*
* Connect the modules together as shown in the diagram below.
* The provided module add16 has the following declaration:
*
* module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
*/

module top_module
(
    //output
    output [31:0] sum,

    //inputs
    input [31:0] a,
    input [31:0] b

);

    wire carry_lo; //carry of lower half word addition is used in addition of upper half word
    wire [15:0] sum_low;
    wire [15:0] sum_hi

    //Sum lower half word [16 bits]; cin = 0
    add16 add16_lo (
        .sum(sum_loww),
        .cout(carry_lo),

        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0) //constantly 0
    );

    //sum upper half word [16 bits]; cout ignored
    add16 add16_hi (
        .sum(sum_hi),
        .cout(), // keep the cout empty=> IGNORED as per design

        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry_lo)
    );

    assign sum = {sum_hi, sum_low};

endmodule

// in clean code: all warnings are considered errors,
// thus the cout terminal is not left floating,
//  rather mentioned but not connected to any signal - this is legal