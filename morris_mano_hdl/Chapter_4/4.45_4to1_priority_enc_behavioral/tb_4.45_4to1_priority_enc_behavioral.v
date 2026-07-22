`timescale 1ps/1ps

module tb_priority_encoder_4to2;
    wire x, y, V;
    reg [3:0] combined;

    initial begin
        $monitor(" inp=%4b | x=%b, y=%b, V=%b", combined, x, y, V);
    end

    initial begin
        $dumpfile("prio_enc_4to2.vcd");
        $dumpvars(0, tb_priority_encoder_4to2);
    end

    priority_encoder_4to2 DUT (
        .x(x), .y(y), .V(V),
        .D(combined)
    );

    initial begin
        combined = 4'b0000;
        repeat (15) begin
            #1 combined = combined + 1;
        end
    end
endmodule