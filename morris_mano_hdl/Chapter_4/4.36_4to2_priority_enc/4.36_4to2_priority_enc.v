module priority_encoder_4to2(
    output x, y, V,

    input d0, d1, d2, d3
);

    wire d2_, d1d2_;
    or 
        (y, d3, d1d2_),
        (x, d2, d3),
        (V, d0, d1, x);
    and 
        (d1d2_, d2_, d1);
    not 
        (d2_, d2);

endmodule