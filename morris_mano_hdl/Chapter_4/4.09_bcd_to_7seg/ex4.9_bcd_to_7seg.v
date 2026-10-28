//NOTE: This design considers digits input bit pattern 10 - 15 as don't cares. - hence the outputs for these input bit patterns are 0.
// i.e. for the illegal inputs, output is 0 - not a paticular error digit on the 7 segment
// some implementations may show d: meaning illegal input was given!

module bcd_to_7seg (
    //outputs
    output reg a, b, c, d, e, f, g,

    //inputs
    input wire w, x, y, z
);

    wire w_, x_, y_, z_;
    assign {w_, x_, y_, z_} = {~w, ~x, ~y, ~z};
    
    always @ (*) begin
        a = w | (x ~^ z) | y;
        b = w | x_ | (y ~^ z);
        c = x | y_ | z;
        d = (x & y_ & z) | (y & z_) | (x_ & y) | w | (x_ &);
        e = (x_|y) & z_;
        f = w | (x & (z_ | y_)) | (y_ & z_) ;
        g = w | (x^y) | (y&z_);
    end

endmodule