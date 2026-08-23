`timescale 1ns / 1ps
// Conventional 8-bit Maximal-Length LFSR
// Taps: [8,6,5,4] -> polynomial x^8+x^6+x^5+x^4+1
// This is the STANDARD LFSR used as baseline for comparison
// with LP-LFSR. Advances EVERY clock cycle (no gating).
// This causes HIGH switching activity -> HIGH power consumption.
module lfsr_conv(
    input            clk,
    input            rst,
    output reg [7:0] f
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            f <= 8'b10101010;  // non-zero seed
        end else begin
            // Maximal length LFSR taps [8,6,5,4]
            f[7] <= f[0];
            f[6] <= f[7];
            f[5] <= f[6] ^ f[0];
            f[4] <= f[5] ^ f[0];
            f[3] <= f[4] ^ f[0];
            f[2] <= f[3];
            f[1] <= f[2];
            f[0] <= f[1];
        end
    end
endmodule
