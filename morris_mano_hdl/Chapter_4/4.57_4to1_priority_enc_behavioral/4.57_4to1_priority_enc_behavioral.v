module priority_enc_4to2(
    output reg x, y, V,

    input [3:0] D
);

    always @(*) begin
        V = 1'b1;
        casez (D)
            4'b???1: {x,y} = 2'b00;
            4'b??10: {x,y} = 2'b01;
            4'b?100: {x,y} = 2'b10;
            4'b1000: {x,y} = 2'b11;
            default: begin
                {x,y} = 2'b00;
                V = 1'b0;
            end
        endcase
    end

endmodule