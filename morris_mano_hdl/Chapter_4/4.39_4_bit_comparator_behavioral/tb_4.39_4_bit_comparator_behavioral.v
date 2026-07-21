`timescale  1ps/1ps

module tb_comparator_4bit;
    
    reg [3:0] inp_1, inp_2;
    reg [5:0] out;

    initial begin
        $dumpfile("tb_comparator_4bit.vcd");
        $dumpvars(0, tb_comparator_4bit);
        $monitor(" \n\nFor inp_1=%4b(%d), inp_2=%4b(%d):  inp_1 \n\tinp_1 <= inp_2 :: %b\n\tinp_1 >= inp_2 :: %b\n\tinp_1 < inp_2 :: %b\n\tinp_1 > inp_2 :: %b\n\tinp_1 != inp_2 :: %b\n\tinp_1 == inp_2 :: %b", inp_1, inp_1, inp_2, inp_2, out[0], out[1], out[2], out[3], out[4], out[5]);
    end


    comparator_4bit DUT (
        .Y(out),
        .input_1(inp_1),
        .input_2(inp_2)
    );

    initial begin
        inp_1 = 4'b1100;
        inp_2 = 4'b1010;
        #2;

        inp_1 = 4'b1000;
        inp_2 = 4'b1110;
        #2;
        
        inp_1 = 4'b1111;
        inp_2 = 4'b0000;
        #2;
        
        inp_1 = 4'b0101;
        inp_2 = 4'b0101;


    end




endmodule