/* Problem statement: module_csesub
* In this exercise, you are provided with the same module add16 as the previous exercise,
* which adds two 16-bit numbers with carry-in and produces a carry-out and 16-bit sum.
* You must instantiate three of these to build the carry-select adder,
* using your own 16-bit 2-to-1 multiplexer.
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

    wire [15:0] sum_lower;
    wire [15:0] sum_upper;

    wire [15:0] sum_upper_zero;
    wire [15:0] sum_upper_one;

    wire carry_select;

    //instantiate the adders
    add16 add16_lower (
        .sum(sum_lower),
        .cout(carry_select),

        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0)
    );

    add16 add16_upper_zero (
        .sum(sum_upper_zero),
        .cout(),

        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0)

    );

    add16 add16_upper_one (
        .sum(sum_upper_one),
        .cout(),

        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1)
    );

    always @(*) begin
        case (carry_select)
            1'b0: begin
                sum_upper = sum_upper_zero;
            end
            1'b1: begin
                sum_upper = sum_upper_one;
            end
        endcase

        sum = {sum_upper, sum_lower};
    end


endmodule