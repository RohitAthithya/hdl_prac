`timescale 1ps/1ps

module tb_full_adder;

    wire sum, cout;
    reg [2:0] test;

    FullAdder f0 (
        .sum(sum), .carry_out(cout),
        .in_1(test[2]), .in_2(test[1]), .in_3_fast(test[0])
    );

    initial begin
        $dumpfile("tb_full_adder.vcd");
        $dumpvars(0, tb_full_adder);
        $monitor(" inp=1'b%b(%d) => sum=%b(%d) | cout=%b(%d)", test, test, sum, sum, cout, cout );
    end

    initial begin
        test = 3'b000;
        #0;
        repeat (7) begin
            #1 test = test + 1;
        end
        #1 $finish;
    end
endmodule