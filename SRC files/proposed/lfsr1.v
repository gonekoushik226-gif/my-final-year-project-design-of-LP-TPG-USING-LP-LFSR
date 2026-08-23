`timescale 1ns / 1ps
// LP-LFSR for TPG1 - Verified for Vivado 2025.1
// Seed: 8'b10101101 | Feedback taps: f[1] XOR f[0] -> f[7] (intentional LP design)
// Asynchronous reset as per LP-LFSR algorithm
module lfsr1(
    input            clk,
    input            rst,
    output reg [7:0] f
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            f <= 8'b10101101;
        end else begin
            f[7] <= f[1] ^ f[0];
            f[6] <= f[7];
            f[5] <= f[6];
            f[4] <= f[5];
            f[3] <= f[4];
            f[2] <= f[3];
            f[1] <= f[2];
            f[0] <= f[1];
        end
    end
endmodule
