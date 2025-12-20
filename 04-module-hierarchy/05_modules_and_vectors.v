/* Problem statement: module_shift8
* This exercise is an extension of module_shift.
* Instead of module ports being only single pins, we now have modules with vectors as ports,
* to which you will attach wire vectors instead of plain wires.
*
* Like everywhere else in Verilog, the vector length of the port does not have to match the
* wire connecting to it, but this will cause zero-padding or trucation of the vector.
* This exercise does not use connections with mismatched vector lengths.
*
* You are given a module my_dff8 with two inputs and one output
* (that implements a set of 8 D flip-flops).
* Instantiate three of them, then chain them together to make a 8-bit wide shift register of length 3.
* In addition, create a 4-to-1 multiplexer (not provided) that chooses what to output
* depending on sel[1:0]: The value at the input d, after the first, after the second,
* or after the third D flip-flop.
* (Essentially, sel selects how many cycles to delay the input, from zero to three clock cycles.)
*
* The module provided to you is:
* module my_dff8 ( input clk, input [7:0] d, output [7:0] q );
*
* The multiplexer is not provided.
* One possible way to write one is inside an always block with a case statement inside.
* (See also: mux9to1v)
*/

module top_module
(
    //output
    output reg [7:0] q,

    //clk
    input clk,

    //inputs
    input [7:0] d,
    input [1:0] sel
);

    localparam OPTION_3 = 2'b11; //delay q by 3 clks
    localparam OPTION_2 = 2'b10; //delay q by 2 clks
    localparam OPTION_1 = 2'b01; //delay q by 1 clk
    localparam OPTION_0 = 2'b00; //divert d to q

    //intermediary wires betweent he 3 FF's
    wire [7:0] dff8_1_q;
    wire [7:0] dff8_2_q;
    wire [7:0] dff8_3_q;

    //instantiation of 8 bit DFFs
    my_dff8 dff8_1 (
        .q(dff8_1_q),
        .clk(clk),
        .d(d)
    );

    my_dff8 dff8_2 (
        .q(dff8_2_q),
        .clk(clk),
        .d(dff8_1_q)
    );

    my_dff8 dff8_3 (
        .q(dff8_3_q),
        .clk(clk),
        .d(dff8_2_q)
    );

    //solution with case statement
    always @(*) begin
        case (sel)
            OPTION_3: begin
                q = dff8_3_q;
            end
            OPTION_2: begin
                q = dff8_2_q;
            end
            OPTION_1: begin
                q = dff8_1_q;
            end
            OPTION_0: begin
                q = d;
            end
            default: ; //by default do nothing
        endcase
    end

    //another solution with just if statements
    //4:1 mux based on select line: sel[1:0]
    // always @(*) begin
    //     if (sel == 2'b00) begin
    //         q = d;
    //     end
    //     else if (sel == 2'b01) begin
    //         q = dff8_1_q;
    //     end
    //     else if (sel == 2'b10) begin
    //         q = dff8_2_q;
    //     end
    //     else begin
    //         q = dff8_3_q;
    //     end
    // end

endmodule

