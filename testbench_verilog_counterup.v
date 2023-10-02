
/*
Name: Shadeeb Hossain
ID: sh7492
This is a test bench for a Counter Up Verilog File
*/


module tb_up_counter;

    // Define the inputs and outputs of the counter module
    reg clk;
    reg rst;
    reg [1:0] cnt_ent;
    wire [5:0] cnt;

    // Instantiate the counter module
    up_counter uut (
        .clk(clk),
        .rst(rst),
        .cnt_ent(cnt_ent),
        .cnt(cnt)
    );

    // Clock generation
    always begin
        clk = 0;
        #5; // 5 time units delay
        clk = 1;
        #5; // 5 time units delay
    end


    // Test stimulus
    initial begin
        // Initialize inputs
        rst = 0;
        cnt_ent = 0;
        
        // Wait for a few clock cycles
        #10;

        // Reset the counter and enable counting up
        rst = 1;
        cnt_ent = 2'b10;
        #10;

        // Enable counting down
        cnt_ent = 2'b01;
        #10;

        // Stop the counter
        cnt_ent = 2'b00;
        #10;

        // Enable counting up again
        cnt_ent = 2'b10;
        #10;

        // Stop the counter
        cnt_ent = 2'b00;
        #10;

        // Enable counting down
        cnt_ent = 2'b01;
        #10;

        // Wait for some time
        #50;

        // Finish simulation
        $finish;
    end

    // Display the counter output
    always @(posedge clk) begin
        $display("Counter Value: %d", cnt);
    end

endmodule
/*
In this testbench:

The up_counter module is instantiated with appropriate connections to the testbench signals.
A clock signal (clk) is generated in the testbench with a period of 10 time units (5 time units high, 5 time units low).
The test stimulus section initializes the inputs (rst and cnt_ent), performs various actions (resetting, counting up/down, and stopping), and then waits for some time before finishing the simulation.
The always block displays the counter value (cnt) whenever the clock signal (clk) transitions to a rising edge.
*/