module decoder_2_to_4(
    output [3:0] out,
    input x, y,
    input enable
);
    wire x_, y_;
    not
        (x_, x),
        (y_, y);

    and
        (out[0], enable, x_, y_),
        (out[1], enable, x_, y ),
        (out[2], enable, x , y_),
        (out[3], enable, x , y );

endmodule



module decoder_4_to_16 (
    output [15:0] out,
    input w, x, y, z,
    input enable
);
    wire w_, x_;
    wire wx, wx_, w_x, w_x_;

    decoder_2_to_4 dec1 (
        .out({wx, wx_, w_x, w_x_}),
        .x(w), .y(x),
        .enable()
    ); 
    
    decoder_2_to_4 dec2 (
        .out(out[15:12]),
        .x(y), .y(z),
        .enable(wx)
    ); 
    decoder_2_to_4 dec3 (
        .out(out[11:8]),
        .x(y), .y(z),
        .enable(wx_)
    ); 
    decoder_2_to_4 dec4 (
        .out(out[7:4]),
        .x(y), .y(z),
        .enable(w_x)
    ); 
    decoder_2_to_4 dec2 (
        .out(out[3:0]),
        .x(y), .y(z),
        .enable(w_x_)
    ); 


endmodule