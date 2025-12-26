/* Problem statement: always if2
* The following code contains incorrect behaviour that creates a latch.
*
* Fix the bugs so that you will shut off the computer only if it's really overheated,
* and stop driving if you've arrived at your destination or you need to refuel.
*
*
* always @(*) begin
*     if (cpu_overheated)
*        shut_off_computer = 1;
* end
*
* always @(*) begin
*     if (~arrived)
*        keep_driving = ~gas_tank_empty;
* end
*/
module top_module
(
    //outputs
    output reg shut_off_computer,
    output reg keep_driving,


    //inputs
    input cpu_overheated,
    input arrived,
    input gas_tank_empty
);

    //SOLUTION 4 - all the combinational logic goes in one procedural block
    always @(*) begin
        //defaults
        shut_off_computer = 1'b0;
        keep_driving = 1'b1;

        //logic
        if (cpu_overheated) begin
            shut_off_computer = 1'b1;
        end
        if (arrived || gas_tank_empty) begin
            keep_driving = 1'b0;
        end
    end
    // This is often preferred when many conditions affect the same outputs
    // because it minimizes repeated else blocks and keeps latch‑avoidance explici



    //SOLUTION 3 - keeping related signals together is key
    // always @(*) begin
    //     shut_off_computer = cpu_overheated;
    // end

    // always @(*) begin
    //     keep_driving = ~(arrived || gas_tank_empty);
    // end

    //SOLUTION 2
    // assign shut_off_computer = cpu_overheated;
    // assign keep_driving = ~(arrived || gas_tank_empty);


    //SOLUTION 1
    //shutdown computer only if cpu is really overheated, otherwise keep it on
    // always @(*) begin
    //     if (cpu_overheated) begin
    //         shut_off_computer = 1'b1;
    //     end
    //     else begin
    //         shut_off_computer = 1'b0;
    //     end
    // end


    // // stop vehicle if arrived or if you need refuel
    // always @(*) begin
    //     if (arrived || gas_tank_empty) begin
    //         keep_driving = 1'b0;
    //     end
    //     else begin
    //         keep_driving = 1'b1;
    //     end

    // end


endmodule






/*
*
* rules of 'DESIGN THINKING'
* When designing circuits, you must think first in terms of circuits:
*
*     - I want this logic gate
*     - I want a combinational blob of logic that has these inputs and produces these outputs
*     - I want a combinational blob of logic followed by a set of flip-flops
*
*
* The usual reason is: "What happens in the cases other than those you specified?".
* Verilog's answer is: Keep the outputs unchanged.
*
*
*
*
*/