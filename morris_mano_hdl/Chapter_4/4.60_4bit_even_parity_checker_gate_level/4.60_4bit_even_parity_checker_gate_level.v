module parity_checker_even_4bit(
    output C,    // parity check pass => C = 0 else 1

    input x,    //input bit 0 
    input y,    //input bit 1  
    input z,    //input bit 2 
    input P     //parity bit
);
    wire x_xor_y, z_xor_P;
    xor 
        (x_xor_y, x, y),
        (z_xor_P, z, P),
        (C, x_xor_y, z_xor_P);
    
    // assign C = x ^ y ^ z  ^ P;

    //absurd to write  a behavioral model for this by counting the 1s
    // direct logic is XORing the inputs with parity!

endmodule