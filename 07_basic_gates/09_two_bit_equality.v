/* Problem statement: Mt2015 eq2 | two bit equality
*
* Create a circuit that has two 2-bit inputs
*   - A[1:0]
*   - B[1:0]
* Produces and output z.
* The value of z should be 1 if A = B otherwise z should be 0
*/
module top_module
(
    //output
    output z,

    //inputs
    input [1:0] A,
    input [1:0] B
);

    assign z = (A == B); //bit by bit comparison is implicity performed and 1 bit output is returned that is ideal!

endmodule