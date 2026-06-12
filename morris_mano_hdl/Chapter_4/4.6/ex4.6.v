module majority_circuit
(
    //outputs
    output Y,
    //inputs
    input wire a,
    input wire b,
    input wire c
);
    wire y_g11, y_g12, y_g21;
    //level 1
    or 
        g11 (y_g11, b, c);
    and 
        g12 (y_g12, b, c);

    //level 2
    and 
        g21 (y_g21, a, y_g11);

    //level 3
    or 
        g31 (Y, y_g21, y_g12);

endmodule