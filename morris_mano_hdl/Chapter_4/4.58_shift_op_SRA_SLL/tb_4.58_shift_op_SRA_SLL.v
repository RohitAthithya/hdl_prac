`timescale 1ps/1ps

module tb_shift_op;

    reg [31:0] inp;
    wire [31:0] out1, out2;

    initial begin
        $dumpfile("tb_shift_op.vcd");
        $dumpvars(0, tb_shift_op);
        $monitor("inp=%X => SRA-out=%X | SLL-out=%X",inp, out1, out2);
    end

    shift_right_arithmetic DUT1 (
        .out(out1),
        .in(inp)
    );
    shift_left_logic DUT2 (
        .out(out2),
        .in(inp)
    );

    initial begin
        // D = 0000 through 1111
        inp = 32'hFAED_DEAF; // EXPECTED out1 = FF5D_BBD5, out2 = D76E_F578
        #2 inp = 32'h7FFF_DEA8; // expected out1 = 0FFF_FBD5, out2 = FFFE_F540

        $finish;
    end

endmodule