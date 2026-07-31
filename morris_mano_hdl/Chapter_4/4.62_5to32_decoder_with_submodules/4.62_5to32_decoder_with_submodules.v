module decoder_2_to_4(
    output [3:0] out,
    input x, y
);
    wire x_, y_;
    not
        (x_, x),
        (y_, y);

    and
        (out[0], x_, y_),
        (out[1], x_, y ),
        (out[2], x , y_),
        (out[3], x , y );

endmodule

module decoder_3_to_8(
    output [7:0] out,
    input x, y, z,
    input enable
);
    wire x_, y_, z_;

    not
        (x_, x),
        (y_, y),
        (z_, z);

    and
        (out[0], enable, x_, y_ , z_),
        (out[1], enable, x_, y_ , z ),
        (out[2], enable, x_, y  , z_),
        (out[3], enable, x_, y  , z ),
        (out[4], enable, x , y_ , z_),
        (out[5], enable, x , y_ , z ),
        (out[6], enable, x , y  , z_),
        (out[7], enable, x , y  , z );
        
endmodule



module decoder_5_to_32(
    output [31:0] out,
    input v, w, x, y, z
);
    wire v_w_, v_w, vw_, vw;
    decoder_2_to_4 dec1(
        .out({vw, vw_, v_w, v_w_}),
        .x(v), .y(w)
    );

    decoder_3_to_8 dec2(
        .out(out[31:24]),
        .x(x), .y(y), .z(z),
        .enable(vw)
    );
    decoder_3_to_8 dec3(
        .out(out[23:16]),
        .x(x), .y(y), .z(z),
        .enable(vw_)
    );
    decoder_3_to_8 dec4(
        .out(out[15:8]),
        .x(x), .y(y), .z(z),
        .enable(v_w)
    );
    decoder_3_to_8 dec5(
        .out(out[7:0]),
        .x(x), .y(y), .z(z),
        .enable(v_w_)
    );

endmodule

