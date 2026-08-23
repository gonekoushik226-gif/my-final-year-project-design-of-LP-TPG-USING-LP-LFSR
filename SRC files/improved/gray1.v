`timescale 1ns / 1ps
// Gray Code Generator for TPG1 - Verified for Vivado 2025.1
// NOTE: clk port retained for compatibility but is not used in combinational logic.
//       Vivado will issue a harmless "unused input" warning - this is expected.
module gray1(
    input      [7:0] count,
    input            clk,    // retained for port compatibility (unused in logic)
    input            rst,
    output reg [7:0] g
);
    always @* begin
        if (rst) begin
            g <= 8'b00000000;
        end else begin
            g[7] <= count[7];
            g[6] <= count[7] ^ count[6];
            g[5] <= count[6] ^ count[5];
            g[4] <= count[5] ^ count[4];
            g[3] <= count[4] ^ count[3];
            g[2] <= count[3] ^ count[2];
            g[1] <= count[2] ^ count[1];
            g[0] <= count[1] ^ count[0];
        end
    end
endmodule
