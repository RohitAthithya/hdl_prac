/* Problem statement: wire
* Create a module with one input and one output that behaves like a wire.
*/
module top_module
(
    //output
    output out,

    //input
    input in
);

    assign out = in;

endmodule

// learnings:
// continuous assignment: since the assignment continues all the time even if the right side's value changes; so it's not a one time event
// the wires in HDL are directional: flow from source :  right to sink : left