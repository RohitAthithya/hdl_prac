module priority_encoder_4to2(
    output reg x, y, V,

    input [3:0] D
);

    // always @(*) begin
    //     V = ~(D == 4'b0000);

    //     if (D[3]) begin
    //         {x, y} = 2'b11;
    //     end
    //     else if (D[2]) begin
    //         {x, y} = 2'b10;
    //     end
    //     else if (D[1]) begin
    //         {x, y} = 2'b01;
    //     end
    //     else begin
    //         {x, y} = 'b00;
    //     end
    // end

    
    always @(*) begin
        V = 1'b1;
        casez (D)
            4'b1???: {x,y} = 2'b11; 
            4'b01??: {x,y} = 2'b10; 
            4'b001?: {x,y} = 2'b01; 
            4'b0001: {x,y} = 2'b00; 
            default: begin
                {x,y} = 2'b00;
                V = 1'b0; 
            end
        endcase
    end

    //non synthesizeable code - as we are using casex - use casez instead
    // always @(*) begin
    //     V = 1'b1;
    //     casex (D)
    //         4'b1xxx: {x,y} = 2'b11; 
    //         4'b01xx: {x,y} = 2'b10; 
    //         4'b001x: {x,y} = 2'b01; 
    //         4'b0001: {x,y} = 2'b00; 
    //         default: begin
    //             {x,y} = 2'b00;
    //             V = 1'b0; 
    //         end
    //     endcase
    // end

    //type 1
    // always @(*) begin
    //     V = 1'b1;
    //     if (D == 4'b0000)
    //         V = 1'b0;

    //     if (D[3] == 1) begin
    //         {x, y} = 2'b11;
    //     end
    //     else if (D[2] == 1) begin
    //         {x, y} = 2'b10;
    //     end
    //     else if (D[1] == 1) begin
    //         {x, y} = 2'b01;
    //     end
    //     else begin
    //         {x, y} = 2'b00;
    //     end
    // end

    //type 2
    // always @(*) begin
    //     V = 1'b1;
    //     if (D[3] == 1) begin
    //         {x, y} = 2'b11;
    //     end
    //     else if (D[3] == 0 & D[2] == 1) begin
    //         {x, y} = 2'b10;
    //     end
    //     else if (D[3] == 0 & D[2] ==0 & D[1] == 1) begin
    //         {x, y} = 2'b01;
    //     end
    //     else if (D == 4'b0001) begin
    //         {x, y} = 2'b00;
    //     end
    //     else begin
    //         {x, y} = 2'b00;
    //         V = 1'b0;
    //     end
    // end

endmodule