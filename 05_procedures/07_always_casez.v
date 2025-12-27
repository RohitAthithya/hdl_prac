/* Problem statement: always_casez
*
* Build a priority encoder for 8-bit inputs. Given an 8-bit vector,
* the output should report the first (least significant) bit in the vector that is 1.
* Report zero if the input vector has no bits that are high.
* For example, the input 8'b10010000 should output 3'd4,
* because bit[4] is first bit that is high.
*
*/

// synthesis verilog_input_version verilog_2001
module top_module
(
    //output
    output reg [2:0] pos,

    //input
    input [7:0] in
);


    integer i;
    generate
        always @ (*) begin
            pos = 3'b000;
            for (i = 7; i >= 0; i=i-1) begin: bit_matcher //unsure why i-- would not work
                if (in[i] == 1'b1) begin
                    pos = i[2:0];
                end
            end
        end
    endgenerate


    // //SOLUTION 1: with casez statement
    // always @(*) begin
    //     casez (in)
    //         8'bzzzz_zzz1: pos = 0; //LSB is top priority
    //         8'bzzzz_zz1z: pos = 1;
    //         8'bzzzz_z1zz: pos = 2;
    //         8'bzzzz_1zzz: pos = 3;

    //         8'bzzz1_????: pos = 4;
    //         8'bzz1?_????: pos = 5;
    //         8'bz1??_????: pos = 6;
    //         8'b1???_????: pos = 7; //MSB has least priority
    //         default     : pos = 0;
    //     endcase
    // end




endmodule
