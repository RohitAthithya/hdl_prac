module FullAdder(
    //outputs
    output wire sum,
    output wire carry_out,

    //inputs
    input wire in_1,
    input wire in_2,
    input wire in_3_fast //can be called carry_in
);

    wire c_;
    wire p0_, g0_;
    wire p0;
    wire p0g0_, g0_c0_;
    wire cin;

    nor 
        g_nor_1 (p0_, in_1, in_2),
        g_nor_2 (carry_out, p0_, g0_c0_) ;
    not 
        g_not_1 (p0, p0_),
        g_not_2 (c_, in_3_fast),
        g_not_3 (cin, c_) ;

    nand
        g_nand_1 (g0_, in_1, in_2);
    
    and
        g_and_1 (p0g0_, p0, g0_),
        g_and_2 (g0_c0_, c_, g0_);

    xor
        g_xor_1 (sum, p0g0_, cin);


endmodule