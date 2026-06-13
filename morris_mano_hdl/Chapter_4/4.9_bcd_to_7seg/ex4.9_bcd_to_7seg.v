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
        d = (x & y_ & z) | (y & z_) | (x_ & y) | w | (x_ & z_);
        e = (x_|y) & z_;
        f = w | (x & (z_ | y_)) | (y_ & z_) ;
        g = w | (x^y) | (y&z_);
    end

endmodule