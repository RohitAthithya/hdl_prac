module shift_right_arithmetic(
    output [31:0] out,  // arith.right shifted value of input
    input [31:0] in     // input wire
    // input [4:0] sh_amt  //shift amount (max 32)
);
    assign out = (in >>  3) | ({31{in[31]}} << (31-3)); 
    // assign = (in >>  sh_amt) | (31{in[31]} << (31-sh_amt)); 
    //idea: Look at 16 bits 
    //input => 1111_1010_1111_1010
    //      :: 0001_1111_0101_1111 (shift right logical by 3)
    //      :: 1110_0000_0000_0000 ( which 1111_1111_1111_1111 << 16-3) (all 1s came from replicating the MSB by 16 times i.e. 31{in[31]})
    //output=> 1111_1111_0101_1111
endmodule

module shift_left_logic(
    output [31:0] out,
    input [31:0] in
);
    assign out = in << 3;

endmodule

