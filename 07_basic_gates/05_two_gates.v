/* Problem statement: Exams/m2014 q4g
*
* Implement the following circuit
*
*/
module top_module
(
    //output
    output out,

    //input
    input in1,
    input in2,
    input in3
);
    assign out = (~(in1 ^ in2) ^ in3);
endmodule