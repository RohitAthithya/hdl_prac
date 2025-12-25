/* Problem statement:always if
*   Build a 2-to-1 mux that chooses between a and b.
*   Choose b if both sel_b1 and sel_b2 are true.
*   Otherwise, choose a.
*
*   Do the same twice, once using assign statements and once using a procedural
*   if statement.
*
*   sel_b1	sel_b2	out_assign
*   out_always
*   0	0	a
*   0	1	a
*   1	0	a
*   1	1	b
*/


module top_module
(
    //output
    output out_assign,
    output out_always,

    //input
    input sel_b1,
    input sel_b2,
    input a,
    input b
);

    assign out_assign = (sel_b1 & sel_b2) ? b : a; //note that the truth table maps to a and gate

    always @(*) begin
        if (sel_b1 & sel_b2) begin
            out_always = b;
        end
        //try commenting out the else block and the running the simulation against your test code,
        // you will find that the output latches
        else begin
            out_always = a;
        end
    end

endmodule


/*
These are the warnings and the errors message we get for not implementing the else block in the procedural statement

Info (10041): Inferred latch for "out_always" at top_module.v(34)
 File: /home/h/work/hdlbits.8567627/top_module.v Line: 34
Unless you intentionally wanted to create a latch, this warning usually
indicates a bug in a combinational always block.
Make sure every variable is assigned a value in all cases so the previous value
does not need to be remembered. Possible ways to achieve this include assigning
a default value to variables at the top of the always block, using a
default case, or having an else clause.


Warning (10240): Verilog HDL Always Construct warning at top_module.v(34):
inferring latch(es) for variable "out_always", which holds its previous value
in one or more paths through the always construct
File: /home/h/work/hdlbits.8567627/top_module.v Line: 34
Unless you intentionally wanted to create a latch, this warning usually
indicates a bug in a combinational always block.
Make sure every variable is assigned a value in all cases so the previous value
does not need to be remembered.
Possible ways to achieve this include assigning a default value to variables
at the top of the always block, using a default case, or having an else clause.


*/