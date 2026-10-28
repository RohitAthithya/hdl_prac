module mux_4to1(
    output out,

    input [1:0] sel,
    input [3:0] in
);
    assign out = in[sel];
endmodule



module bool_expr_4_47_a(
    output F,
    input A, 
    input B, 
    input C, 
    input D
);
    wire cd, c_d_;

    assign cd = C & D;
    assign c_d_ = ~C & ~D;

    mux_4to1 mux1(
        .out(F),

        .sel({A,B}),
        .in({1'b1, cd, c_d_, D})
    );
endmodule


module bool_expr_4_47_b(
    output F,
    input A, 
    input B, 
    input C, 
    input D
);
    wire cd2, cd0;

    assign cd2 = C | ~D;
    assign cd0 = C ^ D;

    mux_4to1 mux1(
        .out(F),

        .sel({A,B}),
        .in({D, cd2, D, cd0})
    );

endmodule