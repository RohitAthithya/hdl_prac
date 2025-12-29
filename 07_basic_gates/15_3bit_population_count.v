/* Problem statement: popcount3 | 3 bit population count
* A "population count" circuit counts the number of '1's in an input vector.
* Build a population count circuit for a 3-bit input vector.
*
*/

module top_module
(
    //output(s)
    output [1:0] out,

    //input(s)
    input [2:0] in
);

    //SOLUTION 4:  truth table basec approach
	// in[2:0] out[1:0]
	// 000      00
	// 001      01
	// 010      01
	// 011      10
	// 100      01
	// 101      10
	// 110      10
	// 111      11
	assign out[0] = (
            (~in[2] & ~in[1] & in[0])
        |   (~in[2] & in[1] & ~in[0])
        |   (in[2] & ~in[1] & ~in[0])
        |   (in[2] & in[1] & in[0])
    );

	assign out[1] = (
            (in[1] & in[0])
        |   (in[2] & in[0])
        |   (in[2] & in[1])
    );

    // SOLUTION 3: using addition operator without for loop
	// assign out = in[0]+in[1]+in[2];

    // SOLUTION 2: Yet another method uses behavioural code inside a procedure
    // // (combinational always block) to directly implement the truth table:
	// always @(*) begin
	// 	case (in)
	// 		3'd0: out = 2'd0;
	// 		3'd1: out = 2'd1;
	// 		3'd2: out = 2'd1;
	// 		3'd3: out = 2'd2;
	// 		3'd4: out = 2'd1;
	// 		3'd5: out = 2'd2;
	// 		3'd6: out = 2'd2;
	// 		3'd7: out = 2'd3;
	// 	endcase
	// end


    //SOLUTION 1: using for loop and addition of the digits
    // integer i;
    // always @(*) begin
    //     out = 0;
    //     for (i = 0; i <=2 ; i++) begin: bit_one_counter
    //         out = out + in[i];
    //     end
    // end

endmodule