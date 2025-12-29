/* Problem statement: gatesv | gates and vectors
*
*  You are given a four-bit input vector in[3:0]. We want to know some
* relationships between each bit and its neighbour:
*
* out_both: Each bit of this output vector should indicate whether both
* the corresponding input bit and its neighbour to the left (higher index)
* are '1'. For example, out_both[2] should indicate if in[2] and in[3]
* are both 1. Since in[3] has no neighbour to the left, the answer is
* obvious so we don't need to know out_both[3].
*       => thus size of out_both is 3 bits from 2 to 0
*
* out_any: Each bit of this output vector should indicate whether any of
* the corresponding input bit and its neighbour to the right are '1'. For
* example, out_any[2] should indicate if either in[2] or in[1] are 1.
* Since in[0] has no neighbour to the right, the answer is obvious so we
* don't need to know out_any[0].
*       => thus the size of out_any is 3 bits from 3 to 1
*
* out_different: Each bit of this output vector should indicate whether
* the corresponding input bit is different from its neighbour to the left.
* For example, out_different[2] should indicate if in[2] is different
* from in[3]. For this part, treat the vector as wrapping around, so
* in[3]'s neighbour to the left is in[0].
*
*/
module top_module
(
    //output(s)
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different,

    //input(s)
    input [3:0] in
);

    //SOLUTION 2: simple and elegant
    assign out_both[2:0] = in[3:1] & in[2:0];
    assign out_any[3:1]  = in[3:1] | in[2:0] ;
    assign out_different[3:0] = in ^ {in[0], in[3:1]}; //the circular next element!

    //SOLUTION 1: BRUTE FORCE!
    // integer i;
    // always @(*) begin
    //     for (i  = 0; i<3; i++) begin
    //         out_both[i] = in[i] & in[i+1];
    //     end

    //     for (i = 3; i>0; i--) begin
    //         out_any[i] = in[i] | in[i-1];
    //     end

    //     for (i = 0; i<=3; i++) begin
    //         if(i == 3) begin
    //             out_different[i] = in[0] ^ in[i];
    //         end
    //         else begin
    //             out_different[i] = in[i] ^ in[i+1];
    //         end
    //     end
    // end


endmodule