module mux_2to1 (
    //output
    output out,

    //inputs
    input [1:0] in,
    input  S
);
    assign out = in[S];
endmodule



module mux_8to1 (
    //output
    output out,

    //inputs
    input [7:0] in,
    input [2:0] S
);
    assign out = in[S];
endmodule




module mux_16to1 (
    //output
    output out,

    //inputs
    input [15:0] in,
    input [3:0] S
);

    wire mux_out_1, mux_out_2;

    mux_8to1 
        mux2 (
            .out(mux_out_2),
            .in(in[15:8]),
            .S(S[2:0])
        ),
        mux1 (
            .out(mux_out_1),
            .in(in[7:0]),
            .S(S[2:0])
        );

    mux_2to1 mux3 (
        .out(out),
        .in({mux_out_2, mux_out_1}),
        .S(S[3])
    );

endmodule