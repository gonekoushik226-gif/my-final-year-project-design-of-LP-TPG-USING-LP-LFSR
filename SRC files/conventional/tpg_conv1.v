`timescale 1ns / 1ps
// Conventional Test Pattern Generator 1
// Uses standard LFSR only - no gray code, no gating
// Every clock cycle produces a new pattern -> HIGH switching activity
// This is the BASELINE design being compared against LP-TPG
module tpg_conv1(
    input        clk,
    input        rst,
    output [7:0] y
);
    lfsr_conv u1 (.clk(clk), .rst(rst), .f(y));
endmodule
