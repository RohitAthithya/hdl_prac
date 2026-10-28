`timescale 1ps/1ps


module tb_bcd_9scomplt;
    initial begin
        $dumpfile("tb_bcd_9scomplt");
        $dumpvars(0, tb_bcd_9scomplt);
    end

    reg [3:0] bcd;
    wire [3:0] out;

    bcd_9s_complt DUT (
        .out_digit(out),
        .inp_digit(bcd)
    );

    initial begin
        bcd = 4'b0000;
        $monitor("input = %b (%d)  === > output = %b (%d)", bcd, bcd, out, out);
        repeat(15) begin
            #1 bcd = bcd + 1;
        end    
    end

endmodule