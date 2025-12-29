/* Problem statement: 256-to-1 multiplexer | Mux256to1
* Create a 1-bit wide, 256-to-1 multiplexer.
* The 256 inputs are all packed into a single 256-bit input vector.
* sel=0 should select in[0], sel=1 selects bits in[1], sel=2 selects bits in[2], etc.
*/
module top_module
(
    //output(s)
    output out,

    //input(s)
    input [255:0] in,
    input [7:0] sel
);

    assign out = in[sel];

endmodule

/*
* The most weird assign statement i have ever done!
* not straight forward, but it is clear:
* variables can be used as indices,
*
******************
* OFFICIAL HINT:
******************
*   With this many options, a case statement isn't so useful.
*   Vector indices can be variable, as long as the synthesizer can figure out that the
*   width of the bits being selected is constant.
*   In particular, selecting one bit out of a vector using a variable index will work.
*
*
*/