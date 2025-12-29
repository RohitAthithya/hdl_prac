/* Problem statement: Ring or vibrate | ringer
* Suppose you are designing a circuit to control a cellphone's ringer and vibration motor.
* Whenever the phone needs to ring from an incoming call (input ring),
* your circuit must either turn on the ringer (output ringer = 1)
* or the motor (output motor = 1), but not both.
* If the phone is in vibrate mode (input vibrate_mode = 1), turn on the motor.
* Otherwise, turn on the ringer.
*/

module top_module
(
    //output(s)
    output ringer,
    output motor,

    //input(s)
    input ring,
    input vibrate_mode
);

    //SOLUTION 2:
    assign motor = vibrate_mode & ring;
    assign ringer = (~vibrate_mode) & ring;

    //SOLUTION 1:
    // always @(*) begin

    //     motor = vibrate_mode & ring;
    //     ringer = (~vibrate_mode) & ring;
    // end

endmodule