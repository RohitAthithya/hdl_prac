module xs3_to_bin_4bit(
    //outputs
    output reg [3:0] out_digits,

    //inputs
    input [3:0] inp_digits
);
    always @(*) begin
        out_digits = inp_digits - 4'b0011;
    end
endmodule