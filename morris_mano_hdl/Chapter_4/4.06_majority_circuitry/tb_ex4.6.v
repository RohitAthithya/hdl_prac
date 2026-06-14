`timescale 1ns/100ps

module tb_majority_circuit;

    reg y, a, b, c;
    reg [2:0] d;
    majority_circuit m1 (.Y(y), .a(a), .b(b), .c(c));

    initial begin
        $dumpfile("tb_majority_circuit.vcd");
        $dumpvars(0, tb_majority_circuit);
    end

    initial #40 $finish;
    
    initial begin
        $display("Testing majority circuit");
        d = 3'b000;
        $display("Starting value of \t a  b  c  -  y");
        repeat(7)
            #3  d = d + 3'b001;
        $display("                  \t %d  %d  %d  -  %d", a, b, c, y);
    end
    assign {a, b, c} = d;

endmodule