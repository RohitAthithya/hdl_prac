/* Problem statement: adder100i | Generate for-loop
*
* Create a 100-bit binary ripple-carry adder by instantiating 100 full adders.
* The adder adds two 100-bit numbers and a carry-in to produce a 100-bit
* sum and carry out. To encourage you to actually instantiate full adders,
* also output the carry-out from each full adder in the ripple-carry adder.
* cout[NUM_BITS - 1] is the final carry-out from the last full adder,
* and is the carry-out you usually see.
*
*/
module fadd
(
    output fadd_sum, fadd_cout,

    input a, b, cin
);

    assign fadd_sum = a ^ b ^ cin;
    assign fadd_cout = (a&b)|(a&cin)|(b&cin);

endmodule


module top_module
#(
    parameter NUM_BITS = 100
)
(
    //output
    output [NUM_BITS - 1:0] cout,
    output [NUM_BITS - 1:0] sum,

    //input
    input [NUM_BITS - 1:0] a, b,
    input cin
);

    //SOLUTION 2: using instance array
    fadd fadd_0 (                                   //BIT 0
        .fadd_cout(cout[0]),
        .fadd_sum(sum[0]),
        .a(a[0]),
        .b(b[0]),
        .cin(cin)
    );

    fadd fadd_instances [NUM_BITS - 1 : 1] (       //BIT 1 TO NUM_BITS - 1
        .fadd_cout(cout[NUM_BITS - 1 : 1]),
        .fadd_sum(sum[NUM_BITS - 1 : 1]),

        .a(a[NUM_BITS - 1 : 1]),
        .b(b[NUM_BITS - 1 : 1]),
        .cin(cout[NUM_BITS - 2 : 0])
    );


    //SOLUTION 1:
    // fadd fadd_0(
    //     .fadd_sum(sum[0]),
    //     .fadd_cout(cout[0]),
    //     .a(a[0]),
    //     .b(b[0]),
    //     .cin(cin)
    // );

    // genvar i;
    // generate
    //     for (i = 1; i <= NUM_BITS - 1; i=i+1) begin : RCA_100bit

    //         fadd fadd_inner (               //using instance name: fadd_[i] failed miserably
    //             .fadd_sum(sum[i]),
    //             .fadd_cout(cout[i]),
    //             .a(a[i]),
    //             .b(b[i]),
    //             .cin(cout[i-1])
    //         );
    //     end
    // endgenerate

endmodule