`timescale 1ps/1ps

module tb_decoder_4to16;

    reg  [3:0]  A;
    wire [15:0] D;

    initial begin
        $dumpfile("tb_decoder_4to16.vcd");
        $dumpvars(0, tb_decoder_4to16);
        $monitor("A=%4b => D=%8b_%8b",
                A, D[15:8], D[7:0]);
    end

    decoder_4_to_16 DUT (
        .out(D),
        .w(A[3]), .x(A[2]), .y(A[1]), .z(A[0])
    );

    initial begin
        A = 4'b0000;

        repeat (15) begin
            #1 A = A + 1;
        end

        #1 $finish;
    end

endmodule