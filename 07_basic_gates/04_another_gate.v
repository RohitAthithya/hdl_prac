/* Problem statement: Exams/m2014 q4f
* Implement the following circuit
*/
module top_module
(
    //output
    output out,

    //input
    input in1,
    input in2
);
    assign out = (in1 & (~in2));
endmodule