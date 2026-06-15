`timescale 1ps/1ps

module tb_gray_9s_complt;

    reg  [3:0] inp_digit;
    wire [3:0] out_digit;

    gray_9s_complt DUT (
        .out_digit(out_digit),
        .inp_digit(inp_digit)
    );

    initial begin
        $dumpfile("tb_gray_9s_complt.vcd");
        $dumpvars(0, tb_gray_9s_complt);
    end

    initial begin
        $monitor("input = %b (%2d) ===> output = %b (%2d)", inp_digit, inp_digit, out_digit, out_digit);

        // --- valid gray code inputs (decimal 0 to 9) ---
        inp_digit = 4'b0000; #1; // Gray(0)  => expect Gray(9) = 1101
        inp_digit = 4'b0001; #1; // Gray(1)  => expect Gray(8) = 1100
        inp_digit = 4'b0011; #1; // Gray(2)  => expect Gray(7) = 0100
        inp_digit = 4'b0010; #1; // Gray(3)  => expect Gray(6) = 0101
        inp_digit = 4'b0110; #1; // Gray(4)  => expect Gray(5) = 0111
        inp_digit = 4'b0111; #1; // Gray(5)  => expect Gray(4) = 0110
        inp_digit = 4'b0101; #1; // Gray(6)  => expect Gray(3) = 0010
        inp_digit = 4'b0100; #1; // Gray(7)  => expect Gray(2) = 0011
        inp_digit = 4'b1100; #1; // Gray(8)  => expect Gray(1) = 0001
        inp_digit = 4'b1101; #1; // Gray(9)  => expect Gray(0) = 0000

        // --- invalid gray code inputs (don't cares) ---
        inp_digit = 4'b1111; #1; // Gray(10) => expect xxxx
        inp_digit = 4'b1110; #1; // Gray(11) => expect xxxx
        inp_digit = 4'b1010; #1; // Gray(12) => expect xxxx
        inp_digit = 4'b1011; #1; // Gray(13) => expect xxxx
        inp_digit = 4'b1001; #1; // Gray(14) => expect xxxx
        inp_digit = 4'b1000; #1; // Gray(15) => expect xxxx

        $finish;
    end

endmodule