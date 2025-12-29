/* Problem statement: 9-to-1 multiplexer | Mux9to1v
*   Create a 16-bit wide, 9-to-1 multiplexer. sel=0 chooses a, sel=1 chooses b, etc.,.
* For the unused cases (sel= 9 to 15), set all output bits to '1'
*
*/

module top_module
(
    //output(s)
    output [15:0] out,

    //input(s)
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel
);
    always @(*) begin
        out = {16{1'b1}};
        // out = '1 // set all bits too 1 - special syntax
        case (sel)
            4'h0: out = a;
            4'h1: out = b;
            4'h2: out = c;
            4'h3: out = d;
            4'h4: out = e;
            4'h5: out = f;
            4'h6: out = g;
            4'h7: out = h;
            4'h8: out = i;
            //default: out = {16{1'b1}};
        endcase
    end

endmodule