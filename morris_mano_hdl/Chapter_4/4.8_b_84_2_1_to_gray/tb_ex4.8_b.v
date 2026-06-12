`timescale 1ps/1ps

module tb_ex4_8_b;
    initial begin

        $dumpfile("tb_ex4_8_b.vcd"); // dumpfile can not be done after dumpvars!
        $dumpvars(0, tb_ex4_8_b);
    end

    reg a, b, c, d;
    wire x, y, z, w;

    code_84_2_1_to_gray DUT (
        .w(w), .x(x), .y(y), .z(z), 
        .a(a), .b(b), .c(c), .d(d)
    );

    reg [3:0] f;
    wire [3:0] out;
    assign {a, b, c, d} = f;
    assign out = {w, x, y, z};

    initial begin
        f = 4'd0;
        $display("            8 4 -2 -1           to       G R A Y");
        $display("time     a   b   c   d           |   w   x   y   z   ");
        $monitor("t=%0t  a=%b b=%b c=%b d=%b (%d)       ==>  w=%b x=%b y=%b z=%b  (%d)", $time, a, b, c, d, f, w, x, y, z, out);
        repeat (15) 
            #2 f = f + 1'd1;
        #2 $finish;
    end
    

endmodule