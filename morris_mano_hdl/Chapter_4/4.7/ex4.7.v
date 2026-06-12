module gray2bin (
    //outputs
    output reg x, y, z, w,
    //inputs
    input wire a, b, c, d
);
    //simple implementation
    // assign {x, y, z, w} = {a, (x ^ b), (y ^ c), (z ^ d)} ;

    //or in multiple lines:
    // assign x = a;
    // assign y = x ^ b;
    // assign z = y ^ c;
    // assign w = z ^ d;

    //using case statement as per question
    always @ (a,b,c,d) begin
        case ({a,b,c,d})
            4'b0000: {x, y, z, w} = 4'b0000;
            4'b0001: {x, y, z, w} = 4'b0001;
            4'b0010: {x, y, z, w} = 4'b0011;
            4'b0011: {x, y, z, w} = 4'b0010;

            4'b0100: {x, y, z, w} = 4'b0111;
            4'b0101: {x, y, z, w} = 4'b0110;
            4'b0110: {x, y, z, w} = 4'b0100;
            4'b0111: {x, y, z, w} = 4'b0101;

            4'b1000: {x, y, z, w} = 4'b1111;
            4'b1001: {x, y, z, w} = 4'b1110;
            4'b1010: {x, y, z, w} = 4'b1100;
            4'b1011: {x, y, z, w} = 4'b1101;

            4'b1100: {x, y, z, w} = 4'b1000;
            4'b1101: {x, y, z, w} = 4'b1001;
            4'b1110: {x, y, z, w} = 4'b1011;
            4'b1111: {x, y, z, w} = 4'b1010;

            default: {x, y, z, w} = 4'b0000;
        endcase
    end
endmodule