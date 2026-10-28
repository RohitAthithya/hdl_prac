`timescale 1ps/1ps

module tb_decoder_5_to_32;

    reg  [4:0]  A;
    wire [31:0] D;

    initial begin
        $dumpfile("tb_decoder_5_to_32.vcd");
        $dumpvars(0, tb_decoder_5_to_32);
        $monitor("A=%5b => D=%8b_%8b_%8b_%8b",
                A, D[31:24], D[23:16], D[15:8], D[7:0]);
    end

    decoder_5_to_32 DUT (
        .out(D),
        .v(A[4]), .w(A[3]), .x(A[2]), .y(A[1]), .z(A[0])
    );

    initial begin
        A = 5'b00000;

        repeat (31) begin
            #1 A = A + 1;
        end

        #1 $finish;
    end

endmodule