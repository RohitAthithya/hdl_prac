/* Problem statement: always 01
*
* Build an AND gate using both an assign statement and a combinational always block.
* (Since assign statements and combinational always blocks function identically)
*
*/
module top_module
(
    //outputs
    output wire out_assign,
    output reg out_alwaysblock,

    // output wire out_alwaysblock,
    // note that in quartus: if this was declared 'wire' still, no warnings were seen.
    // that's because quartus does not 'strictly' check for the declaration rather focuses on the
    // synthesized code, since there was no analmaly in the synth. hardware,
    // warning or error were not given!

    //inputs
    input a,
    input b
);

    assign out_assign = a & b;

    always @(*) begin
        out_alwaysblock = a & b;
    end
endmodule

//LEARNINGS:
// Continuous vs procedural assignments (summary)
// Where used
//
// Continuous: Outside always/initial (assign y = a & b;).
//
// Procedural: Inside always/initial (y = a & b; or y <= a & b;).
//
// Target types
//
// Continuous: Drives nets (e.g. wire in Verilog; can also drive logic in SystemVerilog if declared as a net).
//
// Procedural: Drives variables (e.g. reg in Verilog, logic/bit in SystemVerilog).
//
// Update semantics
//
// Continuous: Re-evaluated whenever any RHS signal changes; conceptually “always active”.
//
// Procedural: Updates only when the procedural block triggers (e.g. on @(*) or @(posedge clk)).