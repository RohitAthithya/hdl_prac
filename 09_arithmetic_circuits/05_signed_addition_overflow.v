/* Problem statement: signed addition overflow | Exams/ece241 2014 q1c
* Assume that you have two 8-bits 2's complement numbers, a[7:0] and b[7:0].
* These numbers are added to produce s[7:0].
* Also compute whether a (signed) overflow has occured.
*
*/
// notice that there are two approaches in solving this problem of signed addition with overflow detection
module top_module
#(
    parameter NUM_BITS = 8
)
(
    //output(s)
    output [NUM_BITS-1:0]s,
    output overflow,

    //input(s)
    input [NUM_BITS-1:0] a,
    input [NUM_BITS-1:0] b

);

    //SOLUTION 2: Compare Carry-in and Carry-out of sign bit
    wire carry_into_msb, carry_outof_msb;
    assign {carry_into_msb, s[NUM_BITS-2:0]} = a[NUM_BITS-2:0] + b[NUM_BITS-2:0];
    assign {carry_outof_msb, s[NUM_BITS-1]} = a[NUM_BITS-1] + b[NUM_BITS-1] + carry_into_msb;
    assign overflow = carry_into_msb ^ carry_outof_msb; //overflow is present if carryin and carryout of msb is different

    //SOLUTION 1.2: same concept as solution 1 but one liner
    // assign s = a + b;
    // assign overflow = ~(a[NUM_BITS-1] ^ b[NUM_BITS-1]) & (a[NUM_BITS-1] ^ s[NUM_BITS-1]);

    //SOLUTION 1: detect overflow by comparing input and the output sign bits
    // wire carry;
    // always @(*) begin
    //     s = a + b; //ignore carry
    //     //if signed bits are same and equal to 0 && sum sign bit = 1 => overflow occured
    //     if ((a[7] == 0 & b[7] == 0) && (s[7] == 1)) begin
    //         overflow = 1'b1;
    //     end
    //     else if ((a[7] == 1 & b[7] == 1) && (s[7] == 0)) begin
    //     //if signed bits are same and equal to 1
    //         overflow = 1'b1;
    //     end
    //     else 
    //         overflow = 1'b0;

    // end

endmodule