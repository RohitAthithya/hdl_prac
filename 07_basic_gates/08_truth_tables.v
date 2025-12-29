/* Problem statement: truth table 1
* Create a combinational circuit that implements the following truth table:
*
* Truth table:
| ------------- | -- | -- | --- | --------- |
|               |    inputs     |           |
|  Row number   | -- | -- | --- |  outputs  |
|               | x3 | x2 | x1  |   (f)     |
| ------------- | -- | -- | --- | --------- |
|      0        | 0  | 0  |  0  |    0      |
|      1        | 0  | 0  |  1  |    0      |
|      2        | 0  | 1  |  0  |    1      |
|      3        | 0  | 1  |  1  |    1      |
|      4        | 1  | 0  |  0  |    0      |
|      5        | 1  | 0  |  1  |    1      |
|      6        | 1  | 1  |  0  |    0      |
|      7        | 1  | 1  |  1  |    1      |
| ------------- | -- | -- | --- | --------- |



*
* way suggested int he description is:
* use of canonical forms to represent the terms that output 1.
* thus in a SOP canonical form, we AND all the inputs that outputs a 1
* and then OR all of them.
*/


/*
Note that the min terms that can be formed based on the truth table are:
say x1 = c
    x2 = b
    x3 = a
then the min terms are:
a' b  c'
a' b  c
a  b' c
a  b  c

so all these terms are Product terms, we need to sum them without reducing
them to standard forms
*/

module top_module
(
    //output
    output f,   // one output

    //inputs
    input x1,
    input x2,
    input x3  // three inputs
);
    always @(*) begin
        f = (
                ((~x3)   & x2     & (~x1)  )   // x3' x2  x1'
            |   ((~x3)   & x2     & x1     )   // x3' x2  x1
            |   (x3      & (~x2)  & x1     )   // x3  x2' x1
            |   (x3      & x2     & x1     )   // x3  x2  x1
        );
    end

endmodule
