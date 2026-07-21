module comparator_4bit(
    output reg [5:0]Y,          
    input [3:0] input_1,
    input [3:0] input_2

);
    always @(*) begin 
        Y[0] = input_1 <= input_2;
        Y[1] = input_1 >= input_2;
        Y[2] = input_1 < input_2;

        Y[3] = input_1 > input_2;
        Y[4] = input_1 != input_2;
        Y[5] = input_1 == input_2;
    end

endmodule   