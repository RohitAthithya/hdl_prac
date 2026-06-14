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
    input wire [3:0] a
);

    wire [4:0] interim_borrow;
    assign interim_borrow[0] = 1'b1;
    assign borrow = interim_borrow[4];

    genvar i;
    generate
        for (i = 0; i<4; i = i + 1) begin
            HA_1bit hx (
                .sum(diff[i]), .carry(),
                .a(a[i]), .b(interim_borrow[i])
            );
            assign interim_borrow[i+1] = interim_borrow[i] & (~(a[i]));
        end
    endgenerate

endmodule
