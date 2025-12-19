/* Problem statement:  module
* In this exercise, create one instance of module mod_a, then connect the module's three pins (in1, in2, and out)
* to your top-level module's three ports (wires a, b, and out). The module mod_a is provided for you — you must instantiate it.
* When connecting modules, only the ports on the module are important.
* You do not need to know the code inside the module.
*
*
* as in:
* module mod_a ( input in1, input in2, output out );
*     // Module body
* endmodule
*
*
*/


module top_module
(
    //output
    output out,

    //inputs
    input a,
    input b
);

    ///instantiation by name
    mod_a inst_mod_a_1 (
        .out(out),  // Port "out" connects to wire "out"
                    // (Note: mod_a's port "out" is not related to top_module's wire "out".
                    // It is simply coincidence that they have the same name)
        .in1(a),    // Port"in1"connects to wire "a"
		.in2(b)     // Port "in2" connects to wire "b"
    );

    //instantiation by index/position
    // mod_a inst_mod_a (a, b, out); // The three wires are connected to ports in1, in2, and out, respectively.


endmodule
