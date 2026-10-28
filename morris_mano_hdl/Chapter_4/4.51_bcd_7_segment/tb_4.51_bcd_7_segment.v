`timescale 1ns/1ps

module tb_bcd_to_7seg;
    reg  [3:0] bcd;
    wire [6:0] val;
    bcd_7seg dut (
        .a(val[6]), .b(val[5]), .c(val[4]), .d(val[3]), .e(val[2]), .f(val[1]), .g(val[0]),
        .inp_bcd(bcd)
    );

    initial begin
        $dumpfile("bcd_to_7seg.vcd");
        $dumpvars(0, tb_bcd_to_7seg);
    end

    
    task show_seg;
        input [6:0] val;
        input [3:0] bcd;
        // Declare segment registers (a=top, b=top-right, c=bottom-right, d=bottom, 
        // e=bottom-left, f=top-left, g=middle)
        reg a, b, c, d, e, f, g;
        begin
        
        // Assign val bits to segments
        {a, b, c, d, e, f, g} = val;
        
        // Display input value
        $display("\nthe given input bcd = %0d", bcd);
        $display("       7 seg display:  ");
        //  ______
        // |      |
        // |      |
        // |      |
        //  ------
        // |      |
        // |      |
        // |      |
        //  ~~~~~~
        
        // Top segment (a)
        if (a == 1'b1) 
            $display(" ______"); 
        else 
            $display("       ");
        
        // Top-left and top-right vertical segments (f and b)
        if (b == 1'b1 && f == 1'b1) 
            $display("|      |\n|      |\n|      |"); 
        else if (b == 1'b1 && f == 1'b0) 
            $display("       |\n       |\n       |"); 
        else if (b == 1'b0 && f == 1'b1) 
            $display("|       \n|       \n|       "); 
        else 
            $display("      \n      \n      ");
        
        // Middle segment (g)
        if (g == 1'b1) 
            $display("------"); 
        else 
            $display("       ");
        
        // Bottom-left and bottom-right vertical segments (e and c)
        if (c == 1'b1 && e == 1'b1) 
            $display("|      |\n|      |\n|      |"); 
        else if (c == 1'b1 && e == 1'b0) 
            $display("       |\n       |\n       |"); 
        else if (c == 1'b0 && e == 1'b1) 
            $display("|       \n|       \n|       "); 
        else 
            $display("      \n      \n      ");
        
        // Bottom segment (d)
        if (d == 1'b1) 
            $display(" ~~~~~~ "); 
        else 
            $display("       ");
        end
    endtask


    initial begin
        $monitor("the given input bcd = %0d  |  7 seg display: a=%b b=%b c=%b d=%b e=%b f=%b g=%b", bcd, val[6], val[5], val[4], val[3], val[2], val[1], val[0]);
        bcd = 4'b0000;
        repeat(16) begin
            #1;
            show_seg(val, bcd);
            // if (bcd < 4'd9)
            #1 bcd = bcd + 1;
        end

        $finish;
    end
endmodule


