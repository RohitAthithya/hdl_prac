/* Problem statement: signed addition overflow | Exams/ece241 2014 q1c
* Assume that you have two 8-bits 2's complement numbers, a[7:0] and b[7:0].
* These numbers are added to produce s[7:0].
* Also compute whether a (signed) overflow has occured.
*
*/
module top_module
(
    //output(s)
    output [7:0]s,
    output overflow,

    //input(s)
    input [7:0] a,
    input [7:0] b

);

    //SOLUTION 2: detect overflow by


    //SOLUTION 1: detect overflow by comparing input and the output sign bits
    always @(*) begin
        if ((a[7] == b[7]) && (s[7] != a[7])) begin
            overflow = 1'b1;
        end
        else if () begin
            
        end
    end

endmodule