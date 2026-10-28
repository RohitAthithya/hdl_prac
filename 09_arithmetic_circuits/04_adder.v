/* Problem statement: adder circuit |
* Implement the given circuit
* the image has this;
* 4 full adders :
* inputs are 4 bit x and y vectors, no cin => cin = 0
* 4 adders generate 4bit sum,
* finals adder's cout is sum[4]
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
    output [4:0] sum,

    //input(s)
    input [3:0] x, y
);

    //SOLUTION 2: Instantiation based implementation
    wire [4:0] temp_cout; // can be reg also
    assign temp_cout[0] = '0; //if not provided, then temp_cout[0] becomes ambiguous,
                              // synthesis tool may or may not assume it to be 0
    assign sum[4] = temp_cout[4];

    fadd fadd_instances [3:0] (
        .sum(sum[3:0]),
        .cout(temp_cout[4:1]),
        .a(x[3:0]),
        .b(y[3:0]),
        .cin(temp_cout[3:0])
    );


    // //SOLUTION 1: For-loop based implementation
    // genvar i;
    // reg [4:0] temp_cout;

    // generate
    //     assign temp_cout[0] = 1'b0;
    //     for (i = 0; i<4; i=i+1) begin: circuitry
    //         fadd fadd_tmp (
    //             .sum(sum[i]),
    //             .cout(temp_cout[i+1]),

    //             .a(x[i]),
    //             .b(y[i]),
    //             .cin(temp_cout[i])
    //         );
    //     end
    //     assign sum[4] = temp_cout[4];
    // endgenerate

endmodule