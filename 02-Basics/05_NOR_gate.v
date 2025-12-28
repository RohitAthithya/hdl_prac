/* Problem statement: Norgate
* Create a module that implementes a NOR gate . A NOR gate is an OR gate with  its output inverter. A NOR function needs two operators when written in veriog
*/

module top_module
(
    //output
    output out,

    //inputs
    input a,
    input b
);

    assign out = ~(a|b); //Using bitwise OR operation. If the signals are just 1 bit wide, logical or operator could be used.

endmodule
