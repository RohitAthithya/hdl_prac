module top_module
    #(
        parameter NUM_BITS = 32
    )
    (
        //outputs
        output [NUM_BITS-1:0] out,

        //inputs
        input [NUM_BITS - 1:0] in
    );
    localparam BYTE_SIZE        = 8;

    genvar i;
    generate
        for (i = 0; i < NUM_BITS; i = i + BYTE_SIZE) begin : byte_swap
            assign out[(NUM_BITS - 1 -  i) -: BYTE_SIZE]  = in[(0 + i) 	 +: BYTE_SIZE];
        end
    endgenerate
    // assign out[(NUM_BITS - 1 -  0) -: BYTE_SIZE]  = in[(0) 	 +: BYTE_SIZE];
    // assign out[(NUM_BITS - 1 -  8) -: BYTE_SIZE]  = in[(0 +  BYTE_SIZE) +: BYTE_SIZE];
    // assign out[(NUM_BITS - 1 - 16) -: BYTE_SIZE]  = in[(0 + 16) +: BYTE_SIZE];
    // assign out[(NUM_BITS - 1 - 24) -: BYTE_SIZE]  = in[(0 + 24) +: BYTE_SIZE];

endmodule

/*
Errors & lessons in this code:
    1.  when running on the quartus, the for loop was not able to generate the synthesisable code.
    - so i had to use the generate block for the same
    - also note that the use of the loop variable was done outside using the 'genvar' instead of int or any other type
        -- this was done because of an error
        -- ""Quartus also only supports i = i + const or i = i - const in a generate loop, not +=""
    2. the for block must have a name: IN THE BEGIN STATEMENT!
    3. short hand assignment operators are not allowed in the verilog code - atleast in the quartus!
        -- i think this was not so in the synopsis compiler: Synopsys vcs
*/