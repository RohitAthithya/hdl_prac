module mux_16to1(
    output out,

    input [16-1:0] in,
    input [$clog2(16)-1:0] sel
);
    assign out = in[sel];

endmodule

module bool_expr_4_46_b(
    output F,
    input A, 
    input B, 
    input C, 
    input D
);
    mux_16to1 mux1 (
        .out(F),
        .in({16'b1111_0111_1011_1011}),
        .sel({A,B,C,D})
    );
endmodule



module bool_expr_4_46_a(
    output F,
    input A, 
    input B, 
    input C, 
    input D
);
    mux_16to1 mux1 (
        .out(F),
        .in({16'b0100_0101_0010_0101}),
        .sel({A,B,C,D})
    );

endmodule
