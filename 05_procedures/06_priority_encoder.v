/* Problem statement: always case2
*
* NOTE: HDLBits implement a LSB-Priority encoder - not the usual!
*
*
* A priority encoder is a combinational circuit that, when given an input bit vector,
* outputs the position of the first 1 bit in the vector.
* For example, a 8-bit priority encoder given the input 8'b10010000 would output 3'd4,
* because bit[4] is first bit that is high.
*
* Build a 4-bit priority encoder.
* For this problem, if none of the input bits are high (i.e., input is zero),
* output zero. Note that a 4-bit number has 16 possible combinations.
*
*/

module top_module
(
    //output
    output reg [1:0] pos,

    //input
    input [3:0] in

);

    //SOLUTION 3:
    //using a for loop
    integer i;
    generate
        always @ (*) begin
            pos = 2'b00;
            for (i = 3; i >= 0; i--) begin: bit_matcher
                if(in[i] == 1'b1) begin
                    pos = i[1:0];
                end
            end
        end
    endgenerate


    // //SOLUTION 2:
    // always @ (*) begin

    //     case(1'b1)
    //         in[0]   : pos = 2'd0;
    //         in[1]   : pos = 2'd1;
    //         in[2]   : pos = 2'd2;
    //         in[3]   : pos = 2'd3;
    //         default : pos = 2'd0;
    //     endcase

    // end


    //SOLUTION 1: hardcoded values: note that these outputs idicate
    // always @(*) begin
    //     case (in)
    //         4'h0: pos = 2'd0;
    //         4'h1: pos = 2'd0;
    //         4'h2: pos = 2'd1;
    //         4'h3: pos = 2'd0;
    //         4'h4: pos = 2'd2;
    //         4'h5: pos = 2'd0;
    //         4'h6: pos = 2'd1;
    //         4'h7: pos = 2'd0;
    //         4'h8: pos = 2'd3;
    //         4'h9: pos = 2'd0;
    //         4'hA: pos = 2'd1;
    //         4'hB: pos = 2'd0;
    //         4'hC: pos = 2'd2;
    //         4'hD: pos = 2'd0;
    //         4'hE: pos = 2'd1;
    //         4'hF: pos = 2'd0;
    //     endcase

    // end

endmodule
