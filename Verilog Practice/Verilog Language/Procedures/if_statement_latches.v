/* find bug in the code
// synthesis verilog_input_version verilog_2001
The following code contains incorrect behaviour that creates a latch. Fix the bugs so that you will shut off the computer only if it's really overheated, and stop driving if you've arrived at your destination or you need to refuel.
Always if2.png
always @(*) begin
    if (cpu_overheated)
       shut_off_computer = 1;
end

always @(*) begin
    if (~arrived)
       keep_driving = ~gas_tank_empty;
end
*/
// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated) begin
           shut_off_computer = 1;
    end
        else
            shut_off_computer = 0;
    end

    always @(*) begin
        if (~arrived) begin
           keep_driving = ~gas_tank_empty;
    end
        else
            keep_driving = 0;
    end
endmodule
