module priority_encoder_4to2(
    output reg x, y, V,

    input [3:0] D
);

    always @(*) begin
        V = 1'b1;
        if (D[3] == 1) begin
            {x, y} = 2'b11;
        end
        else if (D[3] == 0 & D[2] == 1) begin
            {x, y} = 2'b10;
        end
        else if (D[3] == 0 & D[2] ==0 & D[1] == 1) begin
            {x, y} = 2'b01;
        end
        else if (D == 4'b0001) begin
            {x, y} = 2'b00;
        end
        else begin
            {x, y} = 2'b00;
            V = 1'b0;
        end
    end

endmodule