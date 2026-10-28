`timescale 1ps/1ps

module tb_four_bit_add_sub;

    initial begin
        $dumpfile("tb_4btiaddsub.vcd");
        $dumpvars(0, tb_four_bit_add_sub);
    end

    reg [3:0] sum_or_diff;
    reg carry_out;
    
    reg [3:0] test_A;
    reg [3:0] test_B;
    reg op_mode;

    four_bit_add_sub DUT(
        .sum(sum_or_diff), .C4(carry_out),
        .A(test_A), .B(test_B), .mode(op_mode)
    );

    initial begin
        $monitor("mode=%b A=%b B=%b | sum/diff=%b C4=%b", op_mode, test_A, test_B, sum_or_diff, carry_out);

        test_A = 4'b0000; test_B = 4'b0000; op_mode = 1'b0; #1;
        test_A = 4'b0001; test_B = 4'b0010; op_mode = 1'b0; #1;
        test_A = 4'b0011; test_B = 4'b0101; op_mode = 1'b0; #1;
        test_A = 4'b0101; test_B = 4'b0011; op_mode = 1'b0; #1;
        test_A = 4'b0110; test_B = 4'b0001; op_mode = 1'b0; #1;
        test_A = 4'b1001; test_B = 4'b0010; op_mode = 1'b0; #1;
        test_A = 4'b1111; test_B = 4'b0001; op_mode = 1'b0; #1;
        test_A = 4'b1111; test_B = 4'b1111; op_mode = 1'b0; #1;
        test_A = 4'b1000; test_B = 4'b1000; op_mode = 1'b0; #1;
        test_A = 4'b0000; test_B = 4'b0000; op_mode = 1'b0; #10; //POPULARLY CALLED NO-OP

        test_A = 4'b0101; test_B = 4'b0011; op_mode = 1'b1; #1;
        test_A = 4'b0111; test_B = 4'b0001; op_mode = 1'b1; #1;
        test_A = 4'b1001; test_B = 4'b0010; op_mode = 1'b1; #1;
        test_A = 4'b1100; test_B = 4'b0101; op_mode = 1'b1; #1;
        test_A = 4'b1010; test_B = 4'b0011; op_mode = 1'b1; #1;
        test_A = 4'b0000; test_B = 4'b0001; op_mode = 1'b1; #1;
        test_A = 4'b0000; test_B = 4'b0000; op_mode = 1'b1; #1;
        test_A = 4'b0010; test_B = 4'b0010; op_mode = 1'b1; #1;
        test_A = 4'b1000; test_B = 4'b1001; op_mode = 1'b1; #1;
        test_A = 4'b1111; test_B = 4'b1111; op_mode = 1'b1; #1;

        $finish;
    end
endmodule