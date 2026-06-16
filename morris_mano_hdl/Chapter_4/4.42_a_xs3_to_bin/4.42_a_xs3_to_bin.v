module xs3_to_bin_4bit(
    //outputs
    output [3:0] out_digits,

    //inputs
    input [3:0] inp_digits
);
    
    wire cd;
    wire b_or_cd;

    and 
        g_and_1 (cd, inp_digits[1], inp_digits[0]),
        g_and_2 (out_digits[3], inp_digits[3], b_or_cd);

    xnor 
        g_xnor_1(out_digits[2], inp_digits[2], cd);

    xor 
        g_xor_1(out_digits[1], inp_digits[1], inp_digits[0]);

    not 
        g_not_1(out_digits[0], inp_digits[0]);
        
    or 
        g_or_1 (b_or_cd, inp_digits[2], cd);



endmodule