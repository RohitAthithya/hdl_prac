
module FA_1bit (
    //outputs
    output sum,
    output carry,

    //inputs
    input a,
    input b,
    input carry_in
);
    assign {carry, sum} = a + b + carry_in;

endmodule

module HA_1bit (
    //outputs
    output sum, carry,

    //inputs
    input a, b
);
    assign {carry, sum} = a + b;
endmodule

module decrementer_4bit(
    //outputs
    output wire [3:0] diff,
    output wire borrow,

    //inputs
    input [3:0] a
);

    wire [4:0] interim_borrow;
    assign interim_borrow[0] = 1'b0;
    assign borrow = ~interim_borrow[4]; //see explanation in readme.md file to understand why ~carry is done!
    
    HA_1bit HA0 (
        .sum(diff[0]), .carry(interim_borrow[1]),
        .a(a[0]), .b(1'b1)
    );

    genvar i;
    generate
        for (i = 1; i < 4; i = i+1) begin
            FA_1bit FAx (
                .sum(diff[i]), .carry(interim_borrow[i+1]),
                .a(a[i]), .b(1'b1), .carry_in(interim_borrow[i])
            );
        end
    endgenerate


endmodule