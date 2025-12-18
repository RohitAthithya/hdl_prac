/* Problem statement: wire4
* Create a module with 3 inputs and 4 outputs that behaves like wires that makes these connections:
*
* a -> w
* b -> x
* b -> y
* c -> z
*
*/

module top_module
(
    //ouitputs
    output w,
    output x,
    output y,
    output z,

    //inputs
    input a,
    input b,
    input c

);

    // my solution
    // assign w = a;
    // assign x = b;
    // assign y = b;
    // assign z = c;

    // another solution:
    // If we're certain about the width of each signal, using
    // the concatenation operator is equivalent and shorter:
    assign { w, x, y, z} = { a, b, b, c};

endmodule

//learnings:
// the order of the assign statements do not matter:
// concatenation operator to pack and unpack signals