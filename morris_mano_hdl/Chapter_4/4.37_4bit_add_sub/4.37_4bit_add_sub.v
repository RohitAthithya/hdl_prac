module half_adder( 
    output sum, carry_out, 
    input inp_1, inp_2
); 
    xor (sum, inp_1, inp_2);
    and (carry_out, inp_1, inp_2);
endmodule

module full_adder ( 
    output sum, carry_out, 
    input inp_1, inp_2, inp_3
); 

    wire S1, C1, C2;
    
    half_adder HA1 (S1, C1, inp_1, inp_2);
    half_adder HA2 (sum, C2, S1, inp_3);
    or G1 (carry_out, C2, C1);

endmodule


module adder_4bit ( 
    output [3: 0] sum, 
    output C4,

    input [3: 0] A, 
    input [3:0] B, 
    input C0
);

    wire C1, C2, C3; 

    full_adder 
        FA0 (sum[0], C1, A[0], B[0], C0),
        FA1 (sum[1], C2, A[1], B[1], C1),
        FA2 (sum[2], C3, A[2], B[2], C2),
        FA3 (sum[3], C4, A[3], B[3], C3);
    

endmodule


// THIS IMPLEMENTATION IS USING THE GATE-Hierarchical flow
// module four_bit_add_sub ( //unsigned 4 bit adder_subtractor circuit - (no overflow bit)
//     output [3: 0] sum, 
//     output C4,

//     input [3:0] A, 
//     input [3:0] B,
//     input mode // mode =0 => adder, mode=1 => subtractor
// );

//     wire [3:0] b_gated;
//     xor
//         g_xor_3 (b_gated[3], B[3], mode), //mode=0 => pass, mode=1 => toggle
//         g_xor_2 (b_gated[2], B[2], mode), 
//         g_xor_1 (b_gated[1], B[1], mode), 
//         g_xor_0 (b_gated[0], B[0], mode); 

//     adder_4bit 
//         F4addsub (
//             .sum(sum), .C4(C4),
//             .A(A), .B(b_gated), .C0(mode)
//         );



// endmodule


module four_bit_add_sub ( //unsigned 4 bit adder_subtractor circuit - (no overflow bit)
    output [3: 0] sum, 
    output C4,

    input [3:0] A, 
    input [3:0] B,
    input mode // mode =0 => adder, mode=1 => subtractor
);

    wire [3:0] b_gated;
    // xor
        // g_xor_3 (b_gated[3], B[3], mode), //mode=0 => pass, mode=1 => toggle
        // g_xor_2 (b_gated[2], B[2], mode), 
        // g_xor_1 (b_gated[1], B[1], mode), 
        // g_xor_0 (b_gated[0], B[0], mode); 
        
    // assign b_gated[3] = (mode == 1'b1) ? ~(B[3]): B[3]; 
    // assign b_gated[2] = (mode == 1'b1) ? ~(B[2]): B[2]; 
    // assign b_gated[1] = (mode == 1'b1) ? ~(B[1]): B[1]; 
    // assign b_gated[0] = (mode == 1'b1) ? ~(B[0]): B[0]; 
        
        //in oneline
    assign b_gated = (mode == 1'b1) ? ~B: B;

    adder_4bit 
        F4addsub (
            .sum(sum), .C4(C4),
            .A(A), .B(b_gated), .C0(mode)
        );

endmodule

