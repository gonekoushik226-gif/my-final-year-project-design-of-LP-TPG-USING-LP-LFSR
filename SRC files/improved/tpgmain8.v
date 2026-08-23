`timescale 1ns / 1ps
// Top-Level: LP-TPG with 8x8 Braun Array Multiplier (CUT)
// Verified for Vivado 2025.1
// Target: Basys3 (xc7a35tcpg236-1) - Free / widely available
module tpgmain8(
    input         clk,
    input         rst,
    output [15:0] product
);
    wire [7:0]  n1, n2;
    wire [15:0] n3;

    tpg01           m1 (.clk(clk), .rst(rst), .y(n1));
    tpg02           m2 (.clk(clk), .rst(rst), .y2(n2));
    arraymultiplier01 m3 (.a(n1),  .b(n2),    .p(n3));

    assign product = n3;
endmodule
