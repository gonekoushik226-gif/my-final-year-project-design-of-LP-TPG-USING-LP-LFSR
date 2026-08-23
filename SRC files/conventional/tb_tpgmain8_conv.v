`timescale 1ns / 1ps
// Testbench for Conventional TPG with 8x8 Braun Array Multiplier
// Mirror of tb_tpgmain8.v for direct comparison
module tb_tpgmain8_conv;

    reg  clk;
    reg  rst;
    wire [15:0] product;

    tpgmain8_conv uut (
        .clk(clk),
        .rst(rst),
        .product(product)
    );

    // 100 MHz clock (same as LP-TPG testbench)
    initial clk = 1'b1;
    always #5 clk = ~clk;

    initial begin
        rst = 1'b1;
        #100;
        rst = 1'b0;
        #2560;
        $display("Simulation complete at time %0t ns", $time);
        $finish;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | product=0x%04X (%0d)",
                  $time, rst, product, product);
    end

endmodule
