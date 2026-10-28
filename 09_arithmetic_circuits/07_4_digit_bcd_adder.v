/*
* Problem statement: You are provided with a BCD (binary-coded decimal) one-digit adder
* named bcd_fadd that adds two BCD digits and carry-in, 
* and produces a sum and carry-out.
* Instantiate 4 copies of bcd_fadd to create a 4-digit BCD ripple-carry adder. 
* Your adder should add two 4-digit BCD numbers 
* (packed into 16-bit vectors) and a carry-in to produce a 4-digit sum and carry out.
* 
*/

module bcd_fadd
(
    //output(s)
    output reg [3:0] sum,
    output reg cout,

    //inputs(s)
    input [3:0] a, b,
    input cin
);
    reg [4:0] sum5;

    always @(*) begin
        sum5 = a + b + cin;
        if (sum5 > 5'd9) begin
            {cout, sum} = sum5 + 5'd6; // add 6 to produce valid BCD digit
        end
        else begin
            {cout, sum} = sum5;
        end
    end

endmodule

module top_module
#(
    parameter NUM_BITS = 16,
    parameter NUM_DIGITS = NUM_BITS / 4
)
(
    //output(s)
    output cout,
    output [NUM_BITS-1:0] sum,

    //inputs(s)
    input [NUM_BITS-1:0] a, b,
    input cin
);
    reg [NUM_DIGITS:0] interim_carry;

    assign cout = interim_carry[NUM_DIGITS];
    assign interim_carry[0] = cin;

    bcd_fadd bcd_fadd_array [NUM_DIGITS-1:0] (
        .cout(interim_carry[NUM_DIGITS:1]),
        .sum(sum[NUM_BITS-1:0]),

        .a(a[NUM_BITS-1:0]),
        .b(b[NUM_BITS-1:0]),
        .cin(interim_carry[NUM_DIGITS-1:0])
    );

endmodule

