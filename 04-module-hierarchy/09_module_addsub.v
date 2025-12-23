/* Problem statement: module_addsub
* An adder-subtractor can be built from an adder by optionally negating one of the inputs,
* which is equivalent to inverting the input then adding 1.
* The net result is a circuit that can do two operations: (a + b + 0) and (a + ~b + 1).
* See Wikipedia if you want a more detailed explanation of how this circuit works.
*
* Build the adder-subtractor below.
*
* You are provided with a 16-bit adder module, which you need to instantiate twice:
*
* module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
*
* Use a 32-bit wide XOR gate to invert the b input whenever sub is 1.
* (This can also be viewed as b[31:0] XORed with sub replicated 32 times.
* See replication operator.). Also connect the sub input to the carry-in of the adder.
*/


module top_module
(
    //output
    output [31:0] sum,

    //input
    input [31:0] a,
    input [31:0] b,
    input sub

);

    wire [15:0] sum_lower;
    wire [31:0] mod_b;
    wire [15:0] sum_upper;
    wire carry_lower;

    always @(*) begin
        //suggested solution in the question

        //mod_b = b ^ {32{sub}};

        //another elegant approach to implement XOR gate is to use the  NOT+MUX
        //this approach reduces the step: replication of the sub signal
        //using case statement
        case (sub)
            1'b0: begin
                mod_b = b;
            end
            1'b1:begin
                mod_b = ~b;
            end
        endcase

        sum = {sum_upper, sum_lower};
    end

    //instantiate the adders
    add16 add16_lower (
        .sum(sum_lower),
        .cout(carry_lower),

        .a(a[15:0]),
        .b(mod_b[15:0]),
        .cin(sub) //sub here, because, if adder, our original condition was to ignore carry in for lower adder

    );

    add16 add16_upper (
        .sum(sum_upper),
        .cout(),

        .a(a[31:16]),
        .b(mod_b[31:16]),
        .cin(carry_lower)
    );

endmodule