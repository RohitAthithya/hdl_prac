/* Problem statement: Mt2015 q4a |  simple circuit a
* Module A is supppoosed to implement the function
* z = (x^y) & x
* Implement this module
*/

module top_module(
    //output
    output z,

    //inputs
    input x,
    input y
);

    assign z = (x^y) & x;


endmodule
