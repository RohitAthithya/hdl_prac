// bcd to decimal decoder

module decoder_bcd_to_decimal(
    output reg [9:0] D,

    input w, x, y, z
);
    always @(*) begin
        D = 10'b00_0000_0000;
        if ({w,x,y,z} <= 9)
            D = 10'b00_0000_0001 << {w,x,y,z};
    end

    // always @(*) begin
    //     D = 10'b00_0000_0000;
    //     case ({w,x,y,z})
    //         4'd0: D[0] = 1'b1;
    //         4'd1: D[1] = 1'b1;
    //         4'd2: D[2] = 1'b1;

    //         4'd3: D[3] = 1'b1;
    //         4'd4: D[4] = 1'b1;
    //         4'd5: D[5] = 1'b1;

    //         4'd6: D[6] = 1'b1;
    //         4'd7: D[7] = 1'b1;
    //         4'd8: D[8] = 1'b1;

    //         4'd9: D[9] = 1'b1;

    //         default: D = 4'b00_0000_0000;
    //     endcase
    // end

    // always @(*) begin
    //     casez ({w,x,y,z})
    //         4'd0: D = 4'b00_0000_0001;
    //         4'd1: D = 4'b00_0000_0010;
    //         4'd2: D = 4'b00_0000_0100;

    //         4'd3: D = 4'b00_0000_1000;
    //         4'd4: D = 4'b00_0001_0000;
    //         4'd5: D = 4'b00_0010_0000;

    //         4'd6: D = 4'b00_0100_0000;
    //         4'd7: D = 4'b00_1000_0000;
    //         4'd8: D = 4'b01_0000_0000;

    //         4'd9: D = 4'b10_0000_0000;

    //         default: D = 4'b00_0000_0000;
    //     endcase
    // end


endmodule