
module code_84_2_1_to_gray (
    //outputs
    output reg w, x, y, z,

    //inputs
    input wire a, b, c, d   
);
    
    always @(a, b, c, d) begin
        case ({a, b, c, d}) 
            4'b0000: {w, x, y, z} = 4'b0000;
            4'b0001: {w, x, y, z} = 4'b0001;
            4'b0010: {w, x, y, z} = 4'b0011;
            4'b0011: {w, x, y, z} = 4'b0010;

            4'b0100: {w, x, y, z} = 4'b0110;
            4'b0101: {w, x, y, z} = 4'b0111;
            4'b0110: {w, x, y, z} = 4'b0101;
            4'b0111: {w, x, y, z} = 4'b0100;

            4'b1000: {w, x, y, z} = 4'b1100;
            4'b1001: {w, x, y, z} = 4'b1101;
            4'b1010: {w, x, y, z} = 4'b1111;
            4'b1011: {w, x, y, z} = 4'b1110;

            4'b1100: {w, x, y, z} = 4'b1010;
            4'b1101: {w, x, y, z} = 4'b1011;
            4'b1110: {w, x, y, z} = 4'b1001;
            4'b1111: {w, x, y, z} = 4'b1000;

            default: {w, x, y, z} = 4'b0000;
        endcase
    end 
endmodule