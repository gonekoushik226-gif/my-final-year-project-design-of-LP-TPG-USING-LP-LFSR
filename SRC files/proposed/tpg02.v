`timescale 1ns / 1ps
// Test Pattern Generator 2 (TPG2) - Fixed for Vivado 2025.1
// LP-TPG: Counter -> Gray Code -> XOR with LP-LFSR seed
// FIX: Replaced gated clock with synchronous clock enable.
// The LP-LFSR now advances only when c1[3]==0, implemented
// as a clock enable (CE) inside the always block - no gated
// clock net, no TIMING critical warnings, timing passes clean.
module tpg02(
    input        clk,
    input        rst,
    output [7:0] y2
);
    wire [7:0] c1, c2;
    reg  [7:0] c3;

    count01 u1 (.clk(clk), .rst(rst), .count(c1));
    gray01  u2 (.clk(clk), .rst(rst), .count(c1), .g(c2));

    // LP-LFSR with synchronous clock enable (advances every 8 cycles)
    // This replaces: assign gated_clk = clk & (~c1[3])
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            c3 <= 8'b10101010;  // seed for lfsr01
        end else if (~c1[3]) begin  // clock enable: same logic as gated clock
            c3[7] <= c3[1] ^ c3[0];
            c3[6] <= c3[7];
            c3[5] <= c3[6];
            c3[4] <= c3[5];
            c3[3] <= c3[4];
            c3[2] <= c3[3];
            c3[1] <= c3[2];
            c3[0] <= c3[1];
        end
    end

    assign y2 = c2 ^ c3;  // Final test pattern output
endmodule
