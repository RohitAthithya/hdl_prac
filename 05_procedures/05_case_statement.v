/* Problem statement: always case
* Case statements are more convenient than if statements if there are a large number
* of cases. So, in this exercise, create a 6-to-1 multiplexer.
* When sel is between 0 and 5, choose the corresponding data input.
* Otherwise, output 0. The data inputs and outputs are all 4 bits wide.
*
* Be careful of inferring latches
*
*/

// synthesis verilog_input_version verilog_2001
module top_module
(
    //output
    output reg [3:0] out,

    //inputs
    input [2:0] sel,
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5

);

    //SOLUTION 2
    always @(*) begin
        //default out the output here
        out = 4'b0000;
        case (sel)
            3'd0: out = data0;
            3'd1: out = data1;
            3'd2: out = data2;
            3'd3: out = data3;
            3'd4: out = data4;
            3'd5: out = data5;
            //default: begin //but on bigger designs omitting default is not good!
            //  out = 4'b0000;
            //end
        endcase
    end

    //notice: the statements are single lined, hence begin...end statements were ignored


    //SOLUTION 1
    // always@(*) begin
    //     case(sel)
    //         3'b000:begin
    //             out = data0;
    //         end
    //         3'b001:begin
    //             out = data1;
    //         end
    //         3'b010:begin
    //             out = data2;
    //         end
    //         3'b011:begin
    //             out = data3;
    //         end
    //         3'b100:begin
    //             out = data4;
    //         end
    //         3'b101:begin
    //             out = data5;
    //         end
    //         default: begin
    //             out = 4'b0000;
    //             // note: other cases are not mentioned, rather covered up by the
    //             // default case.
    //             // notice that the 0s are 4 bit wide and are explicitly mentioned here.
    //         end
    //     endcase
    // end

endmodule






/* important notes on the:
Each case item can execute exactly one statement. This makes the "break" used in C unnecessary. But this means that if you need more than one statement, you must use begin ... end.
Duplicate (and partially overlapping) case items are permitted. The first one that matches is used. C does not allow duplicate case items.

*/