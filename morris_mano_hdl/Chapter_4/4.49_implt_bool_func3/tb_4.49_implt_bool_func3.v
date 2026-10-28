`timescale 1ps/1ps

module tb_bool_expr_4_49;

    reg [3:0] combined;
    wire F1;
    wire F2;

    initial begin
        $dumpfile("tb_bool_expr_4_49.vcd");
        $dumpvars(0, tb_bool_expr_4_49);
        $monitor("ABCD=%4b(%d) | F1=%b F2=%b", combined,combined, F1, F2);
    end

    bool_expr_4_49 DUT2 (
        .F2(F2),
        .F1(F1),
        .A(combined[3]),
        .B(combined[2]),
        .C(combined[1]),
        .D(combined[0])
    );

    initial begin
        combined = 4'b0000;
        #1;
        repeat (15) begin
            #1 combined = combined + 1'b1;
        end
        #1;


        #1 $finish;
    end

endmodule