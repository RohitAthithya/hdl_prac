`timescale 1ps/1ps

module tb_oct2bin_prio_encoder;

    reg  [7:0]  in;
    wire [2:0] out;
    wire valid;

    initial begin
        $dumpfile("tb_oct2bin_prio_encoder.vcd");
        $dumpvars(0, tb_oct2bin_prio_encoder);
        $monitor("out=%4b_%4b  || in=%3b(%d) => valid=%b",
                in[7:4], in[3:0], out, out, valid);
    end

    oct2bin_prio_encoder DUT (
        .bin(out),
        .oct(in),
        .valid(valid)
    );

    initial begin
        in = 8'b0000_0000;

        repeat (2**8) begin
            #1 in = in  + 1;
        end

        #1 $finish;
    end

endmodule