/* Problem statement: reduction
*
* Parity chekcing is often used as a simple method of detecting errors when transmitting data
* through an imperfect channel. Create a circuit that will compute a parity bit for a 8-bit
* byte (which will add a 9th bit to the byte). We will use "even" parity,
* where the parity bit is just the XOR of all 8 data bits.
*/



module top_module
(
    //output
    output parity,

    //input
    input [7:0] in

);
    //SOLUTION 1:
    // Even parity bit: XOR of all 8 bits
    assign parity = ^ in[7:0];

endmodule
