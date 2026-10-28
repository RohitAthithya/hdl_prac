`timescale 1ps/1ps

module tb_bcd_add_sub;
    initial begin
        $dumpfile("tb_bcd_add_sub.vcd");
        $dumpvars(0, tb_bcd_add_sub);
    end

    reg [3:0] test_A;
    reg [3:0] test_B;   
    wire [3:0] sum_or_diff;
    wire carry_out;
    reg op_mode;

    bcd_add_sub_4bit DUT (
        .out(sum_or_diff), .cout(carry_out), 
        .inp_1(test_A), .inp_2(test_B), .mode(op_mode)
    );

    initial begin
        $monitor("mode=%b A=%b(%2d) B=%b(%2d) | sum/diff=%b(%d) C4=%b", op_mode, test_A, test_A, test_B, test_B, sum_or_diff, sum_or_diff, carry_out);
        // --- addition mode ---
        op_mode=1'b0; test_A=4'd1; test_B=4'd2; #1;
        op_mode=1'b0; test_A=4'd3; test_B=4'd4; #1;
        op_mode=1'b0; test_A=4'd5; test_B=4'd3; #1;
        op_mode=1'b0; test_A=4'd4; test_B=4'd5; #1;
        op_mode=1'b0; test_A=4'd6; test_B=4'd3; #1;
        op_mode=1'b0; test_A=4'd9; test_B=4'd1; #1;
        op_mode=1'b0; test_A=4'd5; test_B=4'd5; #1;
        op_mode=1'b0; test_A=4'd9; test_B=4'd9; #1;
        op_mode=1'b0; test_A=4'd0; test_B=4'd0; #1;

        $display("----------------------------------------------");
        // --- subtraction mode ---
        op_mode=1'b1; test_A=4'd5; test_B=4'd3; #1;
        op_mode=1'b1; test_A=4'd9; test_B=4'd4; #1;
        op_mode=1'b1; test_A=4'd7; test_B=4'd2; #1;
        op_mode=1'b1; test_A=4'd8; test_B=4'd1; #1;
        op_mode=1'b1; test_A=4'd6; test_B=4'd6; #1;
        op_mode=1'b1; test_A=4'd0; test_B=4'd1; #1;
        op_mode=1'b1; test_A=4'd3; test_B=4'd7; #1;
        op_mode=1'b1; test_A=4'd9; test_B=4'd9; #1;
        op_mode=1'b1; test_A=4'd1; test_B=4'd0; #1;
        $finish;
    end


endmodule