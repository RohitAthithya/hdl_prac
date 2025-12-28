/* Problem statement: popcount255 | combinational for-loop: 255-bit population count
*
* A "Population count" circuit counts the number of 1s in an input bector.
* Build a population count circuit for a 255-bit input vector
*
* Note: Population count is also known as Hamming weight
*/
module top_module
#(
    parameter NUM_BITS = 255,
    parameter OUT_NUM_BITS = $clog2(NUM_BITS)
)
(
    //output
    output reg [OUT_NUM_BITS-1 : 0 ] out,

    //input
    input wire [NUM_BITS-1 : 0] in
);

    //official solution:
    integer i;

    always @ (*) begin
        out = 0;
        for (i = 0; i < NUM_BITS; i++) begin: bit_one_counter
            out += in[i]; // if in[i] == 0 then we add nothing to out.
        end
    end

    //SOLUTION 1: //NOT RECOMMENDED TO USE ADDITONAL INTEGER, as it is not synthesisable!
    // integer i, count ;

    // always @ (*) begin
    //     for (i = 0, count = 0; i < NUM_BITS; i++) begin: counter
    //         if (in[i] == 1'b1) begin
    //             count += 1;
    //         end
    //     end
    //     out = count[OUT_NUM_BITS-1:0];
    // end

endmodule