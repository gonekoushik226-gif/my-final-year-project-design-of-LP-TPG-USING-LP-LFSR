`timescale 1ns / 1ps
// Conventional Test Pattern Generator 2
// Uses standard LFSR only - different seed from TPG1
// No gray code, no gating -> HIGH switching activity
module tpg_conv2(
    input        clk,
    input        rst,
    output [7:0] y2
);
    lfsr_conv u1 (.clk(clk), .rst(rst), .f(y2));
endmodule
