`timescale 1ps/1ps


module tb_decrementer;

    reg [3:0] inp;
    wire [3:0] diff;
    wire borrow;
    
    decrementer_4bit DUT (
        .diff(diff), .borrow(borrow),
        .a(inp)
    );

    initial begin
        $dumpfile("tb_decrementer_view.vcd");
        $dumpvars(0, tb_decrementer);
    end

    initial begin
        $monitor(" inp=(%d) => o/p: diff=(%b) ;; borrow=(%b)", inp, diff, borrow );
        #0;
        inp = 4'b0000;
        repeat(16) begin
            #1 inp = inp + 1;
        end
    end


endmodule