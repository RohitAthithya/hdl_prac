
`default_nettype none
module top_module
#(
    parameter BUS_WIDTH = 3
)
(
    //outputs
    output [BUS_WIDTH - 1 : 0] outv, //3bit wide output bus
    output o2,
    output o1,
    output o0,

    //input
    input [BUS_WIDTH - 1 : 0] vec //3 bit wide input bus
);

    assign outv = vec;
    assign {o2, o1, o0} = vec; //CONCATENATION Assignment!

    // Using the concatenation operator, the Bus, is unpacked into the individual wires (fields)
    // OR MORE PRECISELY
    // The wires on the left are packed and assigned to bus: vec

    //IMPORTANT: It is assumed that the bus: vec follows little endianness
    // input [0:2] vec would become big endianness


    //Hard coded solution:
    // assign o0 = vec[0];
    // assign o1 = vec[1];
    // assign o2 = vec[2];

endmodule
