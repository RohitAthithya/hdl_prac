`timescale 1ps/1ps

module tb_2to1_mux_quadruple;

    wire [3:0] out;
    reg [3:0] inp_a;
    reg [3:0] inp_b;
    reg select, enable_;
    
    initial begin
        $dumpfile("tb_2to1_mux_quadruple.vcd");
        $dumpvars(0, tb_2to1_mux_quadruple);
        $monitor ("enable_=%b, select=%b :: inp_a=%4b, inp_b=%4b => output = %4b", enable_, select, inp_a, inp_b, out);
    end
    mux_2to1_quadruple dut (
        .y(out),
        .a(inp_a), .b(inp_b),
        .select(select), .enable_(enable_)
    );

    initial begin
    // Disabled: output must be zzzz, independent of select/data
    enable_ = 1'b1;  select = 1'b0;
    inp_a   = 4'b1101;  inp_b = 4'b1001;
    #2;

    enable_ = 1'b1;  select = 1'b1;
    inp_a   = 4'b0011;  inp_b = 4'b0110;
    #2;

    // Enabled, select = 0: output must equal inp_a
    enable_ = 1'b0;  select = 1'b0;
    inp_a   = 4'b1001;  inp_b = 4'b0001;
    #2;

    // Enabled, select = 1: output must equal inp_b
    enable_ = 1'b0;  select = 1'b1;
    inp_a   = 4'b1111;  inp_b = 4'b0101;
    #2;

    $finish;
end


endmodule