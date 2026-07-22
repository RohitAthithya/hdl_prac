module bool_expr_4_49(
    output F1,
    output F2,

    input A, 
    input B, 
    input C, 
    input D
);
    wire T1, T2, T3, T4, A_, B_, D_;
    not
        (A_, A),
        (B_, B),
        (D_, D);

    and
        (T1, B_, C),
        (T2, A_, B);

    or
        (F2, T2, D_),
        (T3, T1, A),
        (F1, T3, T4);

    xor
        (T4, T2, D);
    

endmodule