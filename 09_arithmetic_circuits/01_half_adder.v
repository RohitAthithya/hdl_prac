/* Problem statement: Hadd | Half adder
* Create a half adder.
* A half adder adds two bits (with no carry-in) and produces a sum and carry-out.
*/
module top_module
(
    //output(s)
    output cout, sum,

    //input(s)
    input a, b
);

    assign sum = a ^ b;
    assign cout = a & b;

endmodule