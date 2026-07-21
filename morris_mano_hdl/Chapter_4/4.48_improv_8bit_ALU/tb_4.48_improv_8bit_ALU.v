`timescale 1ps/1ps

module tb_alu_16bit_3state;

    reg  [2:0]  Sel;
    reg  [15:0] A;
    reg  [15:0] B;
    reg         En;
    wire [15:0] y;

    initial begin
        $dumpfile("tb_alu_16bit_3state.vcd");
        $dumpvars(0, tb_alu_16bit_3state);
        $monitor("En=%b Sel=%b | A=%h B=%h => y=%h",
                 En, Sel, A, B, y);
    end

    alu_16bit_3state DUT (
        .Y(y),
        .A(A),
        .B(B),
        .Sel(Sel),
        .En(En)
    );

    initial begin
        // En = 0: three-state output, independent of operation and inputs
        En = 1'b0; Sel = 3'b000; A = 16'h0000; B = 16'h0000;
        #1;
        En = 1'b0; Sel = 3'b110; A = 16'hABCD; B = 16'h1234;
        #1;

        // En = 1: ALU enabled

        // Sel = 000: y = 16'h0000
        En = 1'b1; Sel = 3'b000; A = 16'h0000; B = 16'h0000;
        #1;
        En = 1'b1; Sel = 3'b000; A = 16'hABCD; B = 16'h1234;
        #1;

        // Sel = 001: y = A & B
        En = 1'b1; Sel = 3'b001; A = 16'hF0F0; B = 16'h0FF0;
        #1;
        En = 1'b1; Sel = 3'b001; A = 16'hA5A5; B = 16'h3C3C;
        #1;

        // Sel = 010: y = A | B
        En = 1'b1; Sel = 3'b010; A = 16'hF000; B = 16'h0F0F;
        #1;
        En = 1'b1; Sel = 3'b010; A = 16'hA5A5; B = 16'h3C3C;
        #1;

        // Sel = 011: y = A ^ B
        En = 1'b1; Sel = 3'b011; A = 16'hFFFF; B = 16'h0F0F;
        #1;
        En = 1'b1; Sel = 3'b011; A = 16'hA5A5; B = 16'h3C3C;
        #1;

        // Sel = 100: y = ~A
        En = 1'b1; Sel = 3'b100; A = 16'h0000; B = 16'h0000;
        #1;
        En = 1'b1; Sel = 3'b100; A = 16'hA5A5; B = 16'h1234;
        #1;

        // Sel = 101: y = A - B
        En = 1'b1; Sel = 3'b101; A = 16'h0000; B = 16'h0000;
        #1;
        En = 1'b1; Sel = 3'b101; A = 16'h0001; B = 16'h0001;
        #1;
        En = 1'b1; Sel = 3'b101; A = 16'h0005; B = 16'h0003;
        #1;
        En = 1'b1; Sel = 3'b101; A = 16'h0003; B = 16'h0005;
        #1;
        En = 1'b1; Sel = 3'b101; A = 16'h1234; B = 16'h1111;
        #1;
        En = 1'b1; Sel = 3'b101; A = 16'hABCD; B = 16'h1234;
        #1;
        En = 1'b1; Sel = 3'b101; A = 16'hFFFF; B = 16'h0001;
        #1;
        En = 1'b1; Sel = 3'b101; A = 16'h8000; B = 16'h0001;
        #1;
        En = 1'b1; Sel = 3'b101; A = 16'h0000; B = 16'h0001;
        #1;
        En = 1'b1; Sel = 3'b101; A = 16'h5555; B = 16'hAAAA;
        #1;

        // Sel = 110: y = A + B
        En = 1'b1; Sel = 3'b110; A = 16'h0000; B = 16'h0000;
        #1;
        En = 1'b1; Sel = 3'b110; A = 16'h0001; B = 16'h0001;
        #1;
        En = 1'b1; Sel = 3'b110; A = 16'h0005; B = 16'h0003;
        #1;
        En = 1'b1; Sel = 3'b110; A = 16'h1234; B = 16'h1111;
        #1;
        En = 1'b1; Sel = 3'b110; A = 16'hABCD; B = 16'h1234;
        #1;
        En = 1'b1; Sel = 3'b110; A = 16'h7FFF; B = 16'h0001;
        #1;
        En = 1'b1; Sel = 3'b110; A = 16'h8000; B = 16'h8000;
        #1;
        En = 1'b1; Sel = 3'b110; A = 16'hFFFF; B = 16'h0001;
        #1;
        En = 1'b1; Sel = 3'b110; A = 16'hFFFF; B = 16'hFFFF;
        #1;
        En = 1'b1; Sel = 3'b110; A = 16'h5555; B = 16'hAAAA;
        #1;

        // Sel = 111: y = 16'hFFFF
        En = 1'b1; Sel = 3'b111; A = 16'h0000; B = 16'h0000;
        #1;
        En = 1'b1; Sel = 3'b111; A = 16'hABCD; B = 16'h1234;
        #1;

        // Disable again: must return to zzzz
        En = 1'b0; Sel = 3'b011; A = 16'hAAAA; B = 16'h5555;
        #1;

        $finish;
    end

endmodule