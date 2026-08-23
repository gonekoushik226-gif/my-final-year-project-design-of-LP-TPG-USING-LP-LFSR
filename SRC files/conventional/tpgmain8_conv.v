`timescale 1ns / 1ps
// Top-Level: Conventional TPG with 8x8 Braun Array Multiplier (CUT)
// This is the BASELINE design for power comparison with LP-TPG
// Uses standard LFSR (no gray code, no gating) -> high switching activity
module tpgmain8_conv(
    input         clk,
    input         rst,
    output [15:0] product
);
    wire [7:0]  n1, n2;

    tpg_conv1         m1 (.clk(clk), .rst(rst), .y(n1));
    tpg_conv2         m2 (.clk(clk), .rst(rst), .y2(n2));
    arraymultiplier01 m3 (.a(n1),    .b(n2),    .p(product));

endmodule
