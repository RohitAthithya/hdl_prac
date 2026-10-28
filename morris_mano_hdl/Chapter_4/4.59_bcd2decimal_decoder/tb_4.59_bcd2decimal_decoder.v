`timescale 1ps/1ps

module tb_decoder_bcd_to_decimal;

    reg [3:0] inp;
    wire [9:0] out;

    initial begin
        $dumpfile("tb_decoder_bcd_to_decimal.vcd");
        $dumpvars(0, tb_decoder_bcd_to_decimal);
        $monitor("inp = %d  ==> out = %2b_%4b_%4b", inp, out[9:8], out[7:4], out[3:0]);
    end

    decoder_bcd_to_decimal DUT (
        .D(out),

        .w(inp[3]), 
        .x(inp[2]), 
        .y(inp[1]), 
        .z(inp[0])
    );

    initial begin
        inp = 10'd0;
        repeat (9) begin
            #1 inp = inp + 1;
        end


        #1 $finish;
    end

endmodule