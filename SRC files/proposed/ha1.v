`timescale 1ns / 1ps
// Half Adder - Verified for Vivado 2025.1
module ha1(
    input  a,
    input  b,
    output s,
    output c
);
    assign s = a ^ b;
    assign c = a & b;
endmodule
