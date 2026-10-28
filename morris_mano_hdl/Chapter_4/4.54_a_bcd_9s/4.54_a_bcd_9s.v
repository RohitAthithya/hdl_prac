module bcd_9s_complt (
    //outputs
    output reg [3:0] out_digit,
    //inputs    
    input [3:0] inp_digit
);
    //behavioral model
    // assign out_digit = (inp_digit < 4'b1010) ?  (4'b1001 - inp_digit) : 4'bxxxx;
    always @(*) begin
        out_digit = (inp_digit < 4'b1010) ?  (4'b1001 - inp_digit) : 4'bxxxx;
    end
endmodule