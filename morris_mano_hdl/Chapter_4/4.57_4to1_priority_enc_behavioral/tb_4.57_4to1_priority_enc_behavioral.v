`timescale 1ps/1ps

module tb_priority_enc_4to2;

    reg  [3:0] D;
    wire       x;
    wire       y;
    wire       V;

    initial begin
        $dumpfile("tb_priority_enc_4to2.vcd");
        $dumpvars(0, tb_priority_enc_4to2);
        $monitor("D=%4b => x=%b y=%b V=%b", D, x, y, V);
    end

    priority_enc_4to2 DUT (
        .x(x),
        .y(y),
        .V(V),
        .D(D)
    );

    initial begin
        // D = 0000 through 1111
        D = 4'b0000;
        repeat (15)  begin
            #1 D = D+1;
        end
        #1;

        $finish;
    end

endmodule