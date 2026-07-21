
module alu_16bit(
    //outputs
    output reg  [15:0] Y,

    //inputs
    input [2:0] Sel,
    input [15:0] A,
    input [15:0] B
);

    always @(*) begin
        case(Sel) 
            3'b000: Y = 16'b0000_0000_0000_0000;
            3'b001: Y = A & B;  //bitwise AND
            3'b010: Y = A | B;  //bitwise OR

            3'b011: Y = A ^ B;  //bitwise XOR
            3'b100: Y = ~A;     //bitwise complement
            3'b101: Y = A - B;  //subtract

            3'b110: Y = A + B;  //Unsigned Addition
            3'b111: Y = 16'hFFFF;
            default: Y = 16'hFFFF; 
        endcase
    end

endmodule