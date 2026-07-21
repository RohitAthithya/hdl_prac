`timescale 1ps/1ps

module tb_alu_16bit;

    reg  [2:0]  Sel;
    reg  [15:0] A;
    reg  [15:0] B;
    wire [15:0] y;

    initial begin
        $dumpfile("tb_alu_16bit.vcd");
        $dumpvars(0, tb_alu_16bit);
        $monitor("Sel=%b | A=%h B=%h => y=%h", Sel, A, B, y);
    end

    alu_16bit DUT (
        .Y(y),
        .A(A),
        .B(B),
        .Sel(Sel)
    );

    initial begin
        // Sel = 000: y = 16'h0000
        Sel = 3'b000; A = 16'h0000; B = 16'h0000;
        #1;
        Sel = 3'b000; A = 16'hABCD; B = 16'h1234;
        #1;

        // Sel = 001: y = A & B
        Sel = 3'b001; A = 16'hF0F0; B = 16'h0FF0;
        #1;
        Sel = 3'b001; A = 16'hA5A5; B = 16'h3C3C;
        #1;

        // Sel = 010: y = A | B
        Sel = 3'b010; A = 16'hF000; B = 16'h0F0F;
        #1;
        Sel = 3'b010; A = 16'hA5A5; B = 16'h3C3C;
        #1;

        // Sel = 011: y = A ^ B
        Sel = 3'b011; A = 16'hFFFF; B = 16'h0F0F;
        #1;
        Sel = 3'b011; A = 16'hA5A5; B = 16'h3C3C;
        #1;

        // Sel = 100: y = ~A; B is irrelevant
        Sel = 3'b100; A = 16'h0000; B = 16'h0000;
        #1;
        Sel = 3'b100; A = 16'hA5A5; B = 16'h1234;
        #1;

        // Sel = 101: y = A - B (10 patterns)
        Sel = 3'b101; A = 16'h0000; B = 16'h0000;
        #1;
        Sel = 3'b101; A = 16'h0001; B = 16'h0001;
        #1;
        Sel = 3'b101; A = 16'h0005; B = 16'h0003;
        #1;
        Sel = 3'b101; A = 16'h0003; B = 16'h0005;
        #1;
        Sel = 3'b101; A = 16'h1234; B = 16'h1111;
        #1;
        Sel = 3'b101; A = 16'hABCD; B = 16'h1234;
        #1;
        Sel = 3'b101; A = 16'hFFFF; B = 16'h0001;
        #1;
        Sel = 3'b101; A = 16'h8000; B = 16'h0001;
        #1;
        Sel = 3'b101; A = 16'h0000; B = 16'h0001;
        #1;
        Sel = 3'b101; A = 16'h5555; B = 16'hAAAA;
        #1;

        // Sel = 110: y = A + B (10 patterns)
        Sel = 3'b110; A = 16'h0000; B = 16'h0000;
        #1;
        Sel = 3'b110; A = 16'h0001; B = 16'h0001;
        #1;
        Sel = 3'b110; A = 16'h0005; B = 16'h0003;
        #1;
        Sel = 3'b110; A = 16'h1234; B = 16'h1111;
        #1;
        Sel = 3'b110; A = 16'hABCD; B = 16'h1234;
        #1;
        Sel = 3'b110; A = 16'h7FFF; B = 16'h0001;
        #1;
        Sel = 3'b110; A = 16'h8000; B = 16'h8000;
        #1;
        Sel = 3'b110; A = 16'hFFFF; B = 16'h0001;
        #1;
        Sel = 3'b110; A = 16'hFFFF; B = 16'hFFFF;
        #1;
        Sel = 3'b110; A = 16'h5555; B = 16'hAAAA;
        #1;

        // Sel = 111: y = 16'hFFFF
        Sel = 3'b111; A = 16'h0000; B = 16'h0000;
        #1;
        Sel = 3'b111; A = 16'hABCD; B = 16'h1234;
        #1;

        $finish;
    end

endmodule