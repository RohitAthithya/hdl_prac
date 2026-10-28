`timescale 1ns/1ps
`default_nettype none

module top_module ();

    reg [3:0] a, b;
    reg cin;
    
    wire [3:0] sum;
    wire cout;

    integer i, j;
    
    assign cin = 0; // initialize carry-in to 0

    //instantiate the dut
    bcd_fadd bcd0 (
        .sum(sum[3:0]),
        .cout(cout),
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin)
    );
    
    initial begin
        $monitor("monitoring stt.: time = %0t, a = %b, b = %b, cin = %b, sum = %b, cout = %b", $time, a, b, cin, sum, cout);
        $dumpfile("09_arithmetic_circuits/simulation/tb_bcd_fadd.vcd");
        $dumpvars(0, top_module);
    end

    initial begin
        // test without carry-in
        // cin = 0;
        $display("cin = %d", cin);
        for (i = 0; i < 10; i = i + 1) begin
            #1 a = i;
            for (j = 0; j < 3; j = j + 1) begin
                #1 b = j;
                $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
            end
        end
        // test with carry-in
        // #1 cin = 1;
        // for (i = 0; i < 10; i = i + 1) begin
        //     #1 a = i;
        //     for (j = 0; j < 10; j = j + 1) begin
        //         #1 b = j;
        //         $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
        //     end
        // end
        #10 $finish;
    end
endmodule