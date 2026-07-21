`timescale 1ps/1ps


module tb_2to4_decoder;

    reg [1:0] inp;
    reg en;
    wire [3:0] out;

    initial begin
        $dumpfile("2to4_decoder.vcd");
        $dumpvars(0, tb_2to4_decoder);
    end

    decoder_2_to_4 DUT (
        .out(out),
        .in(inp),
        .enable_(en)
    );

    initial begin
        $monitor("enable=%b : input=%2b => output=%4b",en, inp, out );
        en = 1; //circuit doesn't output anything
        inp = 2'b00;
        repeat (3) begin
            #1  inp = inp + 1;
        end

        #1 en = 0;  //circuit becomes active - throws the decoder outptus
        inp = 2'b00;
        repeat (3) begin
            #1  inp = inp + 1;
        end

    end


endmodule