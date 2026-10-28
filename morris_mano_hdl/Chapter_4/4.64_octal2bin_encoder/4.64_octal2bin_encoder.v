module oct2bin_prio_encoder(
    //outputs
    output reg [2:0] bin,
    output reg valid,

    //inputs
    input [7:0] oct
);

    always @(*) begin
        valid = 1'b1;
        casez (oct)
            8'b1???_????: bin = 3'b111; 
            8'b01??_????: bin = 3'b110; 
            8'b001?_????: bin = 3'b101; 
            8'b0001_????: bin = 3'b100; 

            8'b0000_1???: bin = 3'b011; 
            8'b0000_01??: bin = 3'b010; 
            8'b0000_001?: bin = 3'b001; 
            8'b0000_0001: bin = 3'b000; 
            default: begin
                valid = 1'b0;
                bin = 3'b000;
            end
        endcase
    end


endmodule