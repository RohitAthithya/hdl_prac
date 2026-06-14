

module HA_1bit (
    //outputs
    output sum, carry,

    //inputs
    input a, b
);
    assign {carry, sum} = a + b;
endmodule

module incrementer_4bit (
    //outputs
    output wire [3:0] sum,
    output wire cout,

    //inputs
    input wire [3:0] a
);
    wire [4:0] interim_carry;
    assign cout = interim_carry[4]; //last one
    assign interim_carry[0] = 1'b1;

    genvar i;
    generate
        for (i  = 0; i < 4; i = i+1) begin
            HA_1bit hx (
                .sum(sum[i]), .carry(interim_carry[i+1]),
                .a(a[i]), .b(interim_carry[i])
            ); 
        end
    endgenerate
endmodule