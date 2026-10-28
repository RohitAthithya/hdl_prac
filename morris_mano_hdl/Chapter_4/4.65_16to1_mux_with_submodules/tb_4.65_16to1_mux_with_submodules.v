`timescale 1ps/1ps

module tb_16to1_mux;

    reg [15:0] in;
    reg [3:0] sel;
    wire out;

    initial begin
        $dumpfile("tb_16to1_mux.vcd");
        $dumpvars(0, tb_16to1_mux);
        $monitor("in=%8b_%8b |  sel=%4b  => out=%b",
                in[15:8], in[7:0], sel, out);
    end

    mux_16to1 DUT (
        .in(in),
        .S(sel),
        .out(out)
    );

    initial begin
        in = 16'b1010_0101_1010_0101;
        sel = 4'b0000;
        #1;
        repeat (15) begin
            #1 sel = sel + 1;
        end

        #1 $finish;
    end

endmodule