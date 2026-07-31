`timescale 1ps/1ps

module tb_parity_checker_even_4bit;

    reg [2:0] inp;
    reg parity;
    wire check;

    initial begin
        $dumpfile("tb_parity_checker_even_4bit.vcd");
        $dumpvars(0, tb_parity_checker_even_4bit);
        $monitor(" inp,parity = %3b-%b => check = %b" , inp, parity, check);
    end

    parity_checker_even_4bit DUT (
        .C(check),
        .x(inp[0]), .y(inp[1]), .z(inp[2]), .P(parity)
    );

    initial begin
        inp = 3'b000;
        parity = 1'b0;
        repeat (7) begin
            #1 inp = inp + 1;
        end
        #1;
        #1 inp = 3'b000;
        #1 parity = 1'b1;
        repeat (7) begin
            #1 inp = inp + 1;
        end
        #1 $finish;
    end

endmodule