module half_adder( 
    output sum, carry_out, 
    input inp_1, inp_2
); 
    xor (sum, inp_1, inp_2);
    and (carry_out, inp_1, inp_2);
endmodule

module full_adder ( 
    output sum, carry_out, 
    input inp_1, inp_2, inp_3
); 

    wire S1, C1, C2;
    
    half_adder HA1 (S1, C1, inp_1, inp_2);
    half_adder HA2 (sum, C2, S1, inp_3);
    or G1 (carry_out, C2, C1);

endmodule

module adder_4bit ( 
    output [3: 0] sum, 
    output carry_out,

    input [3: 0] a, 
    input [3:0] b, 
    input carry_in
);

    wire C1, C2, C3; 

    full_adder 
        FA0 (sum[0], C1, a[0], b[0], carry_in),
        FA1 (sum[1], C2, a[1], b[1], C1),
        FA2 (sum[2], C3, a[2], b[2], C2),
        FA3 (sum[3], carry_out, a[3], b[3], C3);
    

endmodule

module bin_mul_4x4bits (
    //output
    output [7:0] product,

    //inputs
    input [3:0] a,
    input [3:0] b
);
    //dataflow model
    wire [3:0] partial_products_lvl0;
    wire [3:0] partial_products_lvl1;
    wire [3:0] partial_products_lvl2;
    wire [3:0] partial_products_lvl3;
    wire [3:0] partial_products_lvl4;
    wire [3:0] partial_products_lvl5;
    wire [3:0] partial_products_lvl6;
    
    wire mode;
    assign mode = 1'b0; //addition only
    
    assign partial_products_lvl0 = {a[0]&b[3], a[0]&b[2], a[0]&b[1], a[0]&b[0]};
    assign partial_products_lvl1 = {a[1]&b[3], a[1]&b[2], a[1]&b[1], a[1]&b[0]};
    assign product[0] = partial_products_lvl0[0];

    adder_4bit fa_lvl1 (
        .sum({partial_products_lvl2[2:0], product[1]}), .carry_out(partial_products_lvl2[3]),
        .a({1'b0, partial_products_lvl0[3:1]}), .b(partial_products_lvl1), .carry_in(mode)
    );

    assign partial_products_lvl3 = {a[2]&b[3], a[2]&b[2], a[2]&b[1], a[2]&b[0]};
    adder_4bit fa_lvl2(
        .sum({partial_products_lvl4[2:0], product[2]}), .carry_out(partial_products_lvl4[3]),
        .a(partial_products_lvl2), .b(partial_products_lvl3), .carry_in(mode)
    );

    assign partial_products_lvl5 = {a[3]&b[3], a[3]&b[2], a[3]&b[1], a[3]&b[0]};
    adder_4bit fa_lvl3(
        .sum(product[6:3]), .carry_out(product[7]),
        .a(partial_products_lvl4), .b(partial_products_lvl5), .carry_in(mode)
    );


endmodule