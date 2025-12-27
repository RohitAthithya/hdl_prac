/* Problem statement: always_nolatches
* Suppose you're building a circuit to process scancodes from a PS/2 keyboard for a game.
*
* Given the last two bytes of scancodes received, you need to indicate
* whether one of the arrow keys on the keyboard have been pressed.
* This involves a fairly simple mapping, which can be implemented as a
* case statement (or if-elseif) with four cases.
*
* Scancode [15:0]	Arrow key
*   - 16'he06b	left arrow
*   - 16'he072	down arrow
*   - 16'he074	right arrow
*   - 16'he075	up arrow
* Anything else	none
* Your circuit has one 16-bit input, and four outputs.
* Build this circuit that recognizes these four scancodes and asserts the correct output.
*/

// synthesis verilog_input_version verilog_2001
module top_module
(
    //outputs
    output reg left,
    output reg down,
    output reg right,
    output reg up,


    //inputs
    input [15:0] scancode
);
    localparam SCANCODE_LEFT_ARROW          = 16'he06b;
    localparam SCANCODE_DOWN_ARROW          = 16'he072;
    localparam SCANCODE_RIGHT_ARROW         = 16'he074;
    localparam SCANCODE_UP_ARROW            = 16'he075;

    always @(*) begin
        left    = 1'b0;
        down    = 1'b0;
        right   = 1'b0;
        up      = 1'b0;
        case (scancode)
            SCANCODE_LEFT_ARROW             : left  = 1'b1;
            SCANCODE_DOWN_ARROW             : down  = 1'b1;
            SCANCODE_RIGHT_ARROW            : right = 1'b1;
            SCANCODE_UP_ARROW               : up    = 1'b1;
            default                         : ; // do nothing
        endcase
    end


endmodule