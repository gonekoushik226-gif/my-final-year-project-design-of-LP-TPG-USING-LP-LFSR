`timescale 1ns / 1ps
// Full Adder - Verified for Vivado 2025.1
module fa1(
    input  a,
    input  b,
    input  c,
    output s,
    output c0
);
    assign s  = a ^ b ^ c;
    assign c0 = (a & b) | (b & c) | (c & a);
endmodule
