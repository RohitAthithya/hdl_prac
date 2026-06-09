/*
* Problem statement: Implement the circuit described by the Karnaugh map below.
* image description: 3 variable k map, with 0 at a'b'c' and all other 1s
* 
*/
module top_module
(
    //output(s)
    output out,

    //inputs(s)
    input a, b, c
);
    assign out = (a | b | c);
endmodule