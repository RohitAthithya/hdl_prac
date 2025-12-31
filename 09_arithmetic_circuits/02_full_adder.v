/* Problem statement: Fadd | Full adder
* Create a full adder.
* A full adder add thee bits (including carry-in) and produces a sum and carry-out
*/
module top_module
(
    //output(s)
    output cout, sum,

    //input(s)
    input a, b, cin
);

    assign sum = a ^ b^ cin;
    assign cout = a&b | b&cin | a&cin;

endmodule