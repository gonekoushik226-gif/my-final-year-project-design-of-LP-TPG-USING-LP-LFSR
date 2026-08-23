`timescale 1ns / 1ps
// 8-bit Counter for TPG1 - Verified for Vivado 2025.1
// Synchronous reset (active high)
module count1(
    input            clk,
    input            rst,
    output reg [7:0] count
);
    always @(posedge clk) begin
        if (rst)
            count <= 8'b0;
        else
            count <= count + 1'b1;
    end
endmodule
