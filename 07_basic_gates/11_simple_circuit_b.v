/* Problem statement: Mt2015 q4b | simple circuit b
* Circuit B can be described by the following simulation waveform
* output is z
*/

/*
From the waveform we can deduce the following truth table

| ------------- | -- | --- | --------- |
|               |  inputs  |           |
|  Row number   | -- | --- |  outputs  |
|               |  x |  y  |   (z)     |
| ------------- | -- | --- | --------- |
|      0        | 0  |  0  |    1      |
|      1        | 0  |  1  |    0      |
|      2        | 1  |  0  |    0      |
|      3        | 1  |  1  |    1      |
| ------------- | -- | --- | --------- |

* Notice that this looks like the equality operation
* so an xnor gate can be used
*       (or)
* we could just use the minterm expression that we can derive from the
* truth table

*/


module top_module
(
    //output
    output z,

    //inputs
    input x,
    input y
);

    //solution 1 : by deduction and intuition
    assign z = ~(x ^ y);

    // solution 2: canonical expression approach
    // assign z = (
    //         ((~x) & (~y))
    //     |   (  x  &   y )
    // );




endmodule