/* Problem statement: alwaysblock2
*
* Build an XOR gate three ways, using an assign statement, a combinational always block,
* and a clocked always block.
* Note that the clocked always block produces a different circuit from
* the other two: There is a flip-flop so the output is delayed.
*
*/
module top_module
(
    //output
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff,

    //clk
    input clk,

    //inputs
    input a,
    input b

);

    //continuous assignment
    assign out_assign = a ^ b;

    //procedural - combinational
    always @(*) begin
        out_always_comb = a ^ b;
    end

    //procedural - sequential
    always @(posedge clk)begin
        out_always_ff <= (a ^ b);
    end

endmodule