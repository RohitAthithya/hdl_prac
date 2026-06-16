module xs3_to_bin_4bit(
    //outputs
    output [3:0] out_digits,

    //inputs
    input [3:0] inp_digits
);
    wire a,b,c,d;
    assign {a, b, c, d} = {inp_digits[3], inp_digits[2], inp_digits[1], inp_digits[0]};
    assign out_digits[3] = a & (b | (c & d));
    assign out_digits[2] = b ~^ (c & d);
    assign out_digits[1] = c ^ d;
    assign out_digits[0] = ~d;

endmodule