/* Problem statement: bcdadd100 | Generate for-loop: 100 digit bcd adder
*
* THIS IS THE PARAMETERIZED VERSION OF THE SAME MODEL AS """bcdadd100.v""" solution file
*
* You are provided with a BCD one-digit adder named bcd_fadd that
* adds two BCD digits and carry-in, and produces a sum and carry-out.
*
* module bcd_fadd (
*     input [3:0] a,
*     input [3:0] b,
*     input     cin,
*     output   cout,
*     output [3:0] sum );
* Instantiate 100 copies of bcd_fadd to create a 100-digit BCD ripple-carry adder.
* Your adder should add two 100-digit BCD numbers (packed into 400-bit vectors)
* and a carry-in to produce a 100-digit sum and carry out.
*
*/

module top_module
#(
    parameter NUM_DIGITS = 100,
    parameter NUM_BITS_FOR_DIGITS = NUM_DIGITS * 4
)
(
    //output
    output cout,        //1 bit
    output [NUM_BITS_FOR_DIGITS-1:0] sum, //400 bits

    //input
    input [NUM_BITS_FOR_DIGITS-1:0] a, b, //400 bits each
    input cin           //1 1bit
);

    // //SOLUTION 2: using the instance arrays
    // reg [NUM_DIGITS:0] interim_cout; //note we need NUM_DIGITS
    // //amount of temporary registers to store the initial, interim and final carries

    // assign interim_cout[0] = cin;
    // assign cout = interim_cout[NUM_DIGITS];

    // bcd_fadd bcd_fadd_array [NUM_DIGITS-1:0] (
    //     .cout(interim_cout[NUM_DIGITS:1]),
    //     .sum(sum[NUM_BITS_FOR_DIGITS-1:0]),

    //     .a(a[NUM_BITS_FOR_DIGITS-1:0]),
    //     .b(b[NUM_BITS_FOR_DIGITS-1:0]),
    //     .cin(interim_cout[NUM_DIGITS-1:0])
    // );



    // SOLUTION 1: using the generate stt.
    reg [NUM_DIGITS:0] interim_cout; //note we need NUM_DIGITS
    assign interim_cout[0] = cin;
    assign cout = interim_cout[NUM_DIGITS];
    localparam NIBBLE_SIZE = 4;

    genvar i;
    generate
        for (i = 0; i<NUM_DIGITS; i = i+1) begin: bcd_adder_gen //covers NUM_DIGITS-1 digits of the addition
            bcd_fadd bcd_fadd_tmp (
                .sum(sum[(((i+1)*NIBBLE_SIZE)-1) : (i*NIBBLE_SIZE)]),         //4 bit
                .cout(interim_cout[i+1]), //1 bit

                .a(a[(((i+1)*NIBBLE_SIZE)-1) : (i*NIBBLE_SIZE)]),             //4 bit
                .b(b[(((i+1)*NIBBLE_SIZE)-1) : (i*NIBBLE_SIZE)]),             //4 bit
                .cin(interim_cout[i])     //1 bit
            );
        end
    endgenerate

endmodule
