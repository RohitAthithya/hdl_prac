module four_bit_add_sub ( //unsigned 4 bit adder_subtractor circuit - (no overflow bit)
    output reg [3: 0] sum, 
    output reg C4,
    input [3:0] A, 
    input [3:0] B,
    input mode // mode =0 => adder, mode=1 => subtractor
);
    reg [3:0] b_gated;

    always @(*) begin
        b_gated = (mode == 1'b1) ? ~B: B;
        {C4, sum} = A + b_gated + mode;
    end
endmodule