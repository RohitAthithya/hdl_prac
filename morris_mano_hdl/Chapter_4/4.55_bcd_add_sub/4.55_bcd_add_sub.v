//use bcd_9s_complt from ../4.54_a_bcd_9s/4.54_a_bcd_9s.v

module bcd_fadd_4bit
(
    //output(s)
    output reg [3:0] sum,
    output reg cout,

    //inputs(s)
    input [3:0] a, 
    input [3:0] b,
    input cin
);
    reg [4:0] sum5;

    always @(*) begin
        sum5 = a + b + cin;
        if (sum5 > 5'd9) begin
            {cout, sum} = sum5 + 5'd6; // add 6 to produce valid BCD digit
        end
        else begin
            {cout, sum} = sum5;
        end
    end

endmodule

module bcd_add_sub_4bit(
    //outputs
    output [3:0] out,
    output cout,
    //inputs
    input [3:0] inp_1,
    input [3:0] inp_2,
    input mode //mode=0 => adder, mode=1 => subtractor
);  
    wire [3:0] b_gated; 
    wire [3:0] b_9s_complt;

    assign b_gated = (mode == 1'b0) ? inp_2 : b_9s_complt;
    
    bcd_9s_complt bcd_9s(
        .out_digit(b_9s_complt), 
        .inp_digit(inp_2) 
    );

    bcd_fadd_4bit bcd_fadd (
        .sum(out), .cout(cout),
        .a(inp_1), .b(b_gated), .cin(mode)
    );



endmodule