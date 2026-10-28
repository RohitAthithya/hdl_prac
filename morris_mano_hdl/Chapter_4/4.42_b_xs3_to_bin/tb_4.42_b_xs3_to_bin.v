`timescale 1ps/1ps


module tb_xs3_to_bin;

    reg [3:0] inp;
    wire [3:0] out;

    xs3_to_bin_4bit DUT (
        .out_digits(out), 
        .inp_digits(inp)
    ); 

    initial begin
        $dumpfile("tb_xs3_to_bin.vcd");
        $dumpvars(0, tb_xs3_to_bin);
        $monitor(" input = %4b(%2d) => output = %4b(%2d)", inp, inp, out, out);
    end

    initial begin
        inp = 4'b0000;
        repeat (16) begin
            #1 inp = inp + 1;
        end
    end

endmodule