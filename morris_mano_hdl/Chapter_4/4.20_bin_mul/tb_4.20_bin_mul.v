`timescale 1ps/1ps


module tb_bin_mul;

    reg [3:0] inp_1, inp_2;
    wire [7:0] product;

    bin_mul_4x4bits DUT (
        .product(product),
        .a(inp_1), .b(inp_2)
    );


    initial begin
        $dumpfile("tb_bin_mul.vcd");
        $dumpvars(0, tb_bin_mul);
    end


    initial begin
        $monitor("input 1 = %4b(%2d) | input 2 = %4b(%2d) => product=%8b(%3d)", inp_1, inp_1, inp_2, inp_2, product, product );
        inp_1 = 4'b0000;
        inp_2 = 4'b0000;
        repeat (16) begin
            #1 inp_1 = inp_1 + 1;
            repeat (16) begin
                #1 inp_2 = inp_2 + 1;
            end
        end
        
    end

endmodule