module gray_9s_complt(
    //outputs
    output reg [3:0] out_digit,

    //inputs
    input [3:0] inp_digit
);
    // always @(*) begin
    //     out_digit[3] = (~inp_digit[2]) & (~inp_digit[1]);
    //     out_digit[2] = (~inp_digit[2]) | inp_digit[1];
    //     out_digit[1] = (~inp_digit[3]) & inp_digit[2];
    //     out_digit[0] = ~inp_digit[0];
    // end

    always @(*) begin
        case (inp_digit)
            4'd0: out_digit = 4'b1101;
            4'd1: out_digit = 4'b1100;
            4'd2: out_digit = 4'b0101;
            4'd3: out_digit = 4'b0100;
            
            4'd4: out_digit = 4'b0011;
            4'd5: out_digit = 4'b0010;
            4'd6: out_digit = 4'b0111;
            4'd7: out_digit = 4'b0110;
            
            4'd12: out_digit = 4'b0001;
            4'd13: out_digit = 4'b0000; 

            default: out_digit = 4'bxxxx;
        endcase
    end
    
endmodule