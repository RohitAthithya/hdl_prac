/* Problem statement: bcdadd100 | Generate for-loop: 100 digit bcd adder
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
(
    //output
    output cout,        //1 bit
    output [399:0] sum, //400 bits

    //input
    input [399:0] a, b, //400 bits each
    input cin           //1 1bit
);

    //SOLUTION 2: using the instance arrays
    reg [99+1:0] interim_cout;
    assign interim_cout[0] = cin;
    assign cout = interim_cout[99+1];

    bcd_fadd bcd_fadd_array [99:0] (
        .cout(interim_cout[99+1:1]),
        .sum(sum[399:0]),

        .a(a[399:0]),
        .b(b[399:0]),
        .cin(interim_cout[99:0])
    );



    //SOLUTION 1: using the generate stt.
    // reg [99+1:0] interim_cout;
    // assign interim_cout[0] = cin;
    // assign cout = interim_cout[99+1];

    // genvar i;
    // generate
    //     for (i = 0; i<100; i = i+1) begin: BCD_ADDR_DIG_0_98 //covers 99 digits of the addition
    //         bcd_fadd bcd_fadd_tmp (
    //             .sum(sum[(((i+1)*4)-1) : (i*4)]),         //4 bit
    //             .cout(interim_cout[i+1]), //1 bit

    //             .a(a[(((i+1)*4)-1) : (i*4)]),             //4 bit
    //             .b(b[(((i+1)*4)-1) : (i*4)]),             //4 bit
    //             .cin(interim_cout[i])     //1 bit
    //         );
    //     end
    // endgenerate

endmodule
