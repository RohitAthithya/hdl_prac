module decoder_2_to_4(
    output [3:0] out,   //4 outputs

    input [1:0] in,     //2 inputs
    input enable_       //active low enable
);
    wire [3:0] out_;    //inverted outputs
    wire [1:0] in_;     //inverted inputs
    wire en_;           // enable'
    nand
        (en_, enable_, enable_),
        (in_[1], in[1], in[1]),
        (in_[0], in[0], in[0]),
        (out[3], out_[3], out_[3]),
        (out[2], out_[2], out_[2]),
        (out[1], out_[1], out_[1]),
        (out[0], out_[0], out_[0]),

        (out_[0], en_, in_[1], in_[0]),
        (out_[1], en_, in_[1], in[0]),
        (out_[2], en_, in[1], in_[0]),
        (out_[3], en_, in[1], in[0]);
    

endmodule