`timescale 1ps/1ps

module tb_ex4_7;
    initial begin

        $dumpfile("tb_ex4_7.vcd"); // dumpfile can not be done after dumpvars!
        $dumpvars(0, tb_ex4_7);
    end

    //THIS TESTBENCH IS OKAY - BUT CORRECT WAY TO IMPLEMENT IT
    // inital
        // $display("            G R A Y                   B I N A R Y");
        // $display("time     G3   g2   g1   g0  |||   B3   B2  B1   B0   ");
        // $monitor("t=%0t  a=%b b=%b c=%b d=%b (%d)       ==>  x=%b y=%b z=%b w=%b (%d)", $time, a, b, c, d, f, x, y, z, w, out);
    // end
    // reg a,b,c,d,x,y,z,w;
    // gray2bin g1 (
    //     .x(x),.y(y),.z(z),.w(w),
    //     .a(a),.b(b),.c(c),.d(d)
    // );

    // reg [3:0] f, out;
    // assign {a, b, c, d} = f;
    // assign out = {x, y, z, w};
    // initial begin
    //     f = 4'd0;
    //     repeat (15)
    //         #2 f = f + 1'd1;
    // end
    

    //THIS IS THE TECHNICALLY CORRECT ONE:

    reg a, b, c, d;
    wire x, y, z, w;

    gray2bin DUT (
        .x(x), .y(y), .z(z), .w(w),
        .a(a), .b(b), .c(c), .d(d)
    );

    reg [3:0] f;
    wire [3:0] out;
    assign {a, b, c, d} = f;
    assign out = {x, y, z, w};

    initial begin
        f = 4'd0;
        $display("            G R A Y                   B I N A R Y");
        $display("time     G3   g2   g1   g0  |||   B3   B2  B1   B0   ");
        $monitor("t=%0t  a=%b b=%b c=%b d=%b (%d)       ==>  x=%b y=%b z=%b w=%b (%d)", $time, a, b, c, d, f, x, y, z, w, out);
        repeat (15) 
            #2 f = f + 1'd1;
        #2 $finish;
    end
    

endmodule