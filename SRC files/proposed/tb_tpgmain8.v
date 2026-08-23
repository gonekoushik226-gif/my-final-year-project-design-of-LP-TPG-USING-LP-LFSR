`timescale 1ns / 1ps
// Testbench for LP-TPG with 8x8 Braun Array Multiplier
// Verified for Vivado 2025.1 Simulation
module tb_tpgmain8;

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [15:0] product;

    // Instantiate the Unit Under Test (UUT)
    tpgmain8 uut (
        .clk(clk),
        .rst(rst),
        .product(product)
    );

    // Clock generation: 10ns period = 100 MHz
    initial clk = 1'b1;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        // Apply reset
        rst = 1'b1;
        #100;

        // Release reset - TPG starts generating patterns
        rst = 1'b0;

        // Run for 2560ns to observe 256 patterns
        #2560;

        $display("Simulation complete at time %0t ns", $time);
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | rst=%b | product=0x%04X (%0d)",
                  $time, rst, product, product);
    end

endmodule
