/* Problem statement: notgate
* Create a module that implements a NOT gate.
*/

module top_module(

    //output
	output out,

    //input
	input in
);

	assign out = ~in;

endmodule
