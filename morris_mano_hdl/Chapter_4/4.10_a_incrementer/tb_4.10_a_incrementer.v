`timescale 1ps/1ps


module tb_incrementer;

    reg [3:0] inp;
    wire [3:0] sum;
    wire cout;
    
    incrementer_4bit DUT (
        .sum(sum), .cout(cout),
        .a(inp)
    );

    initial begin
        $dumpfile("tb_incrementer_view.vcd");
        $dumpvars(0, tb_incrementer);
    end

    initial begin
        $monitor(" inp=(%d) => o/p: sum=(%b) ;; cout=(%b)", inp, sum, cout );
        #0;
        inp = 4'b0000;
        repeat(16) begin
            #1 inp = inp + 1;
        end
    end


endmodule