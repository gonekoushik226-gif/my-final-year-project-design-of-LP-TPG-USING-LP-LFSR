`timescale 1ns / 1ps
// 8x8 Braun Array Multiplier - Verified for Vivado 2025.1
// Circuit Under Test (CUT) for LP-TPG evaluation
// Wire index ranges verified:
//   x[63:1]  - partial products
//   c[54:0]  - carry wires (indices 0-54)
//   w[42:1]  - intermediate sum wires
module arraymultiplier01(
    input  [7:0]  a,
    input  [7:0]  b,
    output [15:0] p
);
    wire [63:1] x;
    wire [54:0] c;
    wire [42:1] w;

    // --- Partial Product Generation ---
    assign p[0]  = a[0] & b[0];
    assign x[1]  = a[1] & b[0];  assign x[2]  = a[0] & b[1];
    assign x[3]  = a[2] & b[0];  assign x[4]  = a[1] & b[1];
    assign x[5]  = a[0] & b[2];
    assign x[6]  = a[3] & b[0];  assign x[7]  = a[2] & b[1];
    assign x[8]  = a[1] & b[2];  assign x[9]  = a[0] & b[3];
    assign x[10] = a[4] & b[0];  assign x[11] = a[3] & b[1];
    assign x[12] = a[2] & b[2];  assign x[13] = a[1] & b[3];
    assign x[14] = a[0] & b[4];
    assign x[15] = a[5] & b[0];  assign x[16] = a[4] & b[1];
    assign x[17] = a[3] & b[2];  assign x[18] = a[2] & b[3];
    assign x[19] = a[1] & b[4];  assign x[20] = a[0] & b[5];
    assign x[21] = a[6] & b[0];  assign x[22] = a[5] & b[1];
    assign x[23] = a[4] & b[2];  assign x[24] = a[3] & b[3];
    assign x[25] = a[2] & b[4];  assign x[26] = a[1] & b[5];
    assign x[27] = a[0] & b[6];
    assign x[28] = a[7] & b[0];  assign x[29] = a[6] & b[1];
    assign x[30] = a[5] & b[2];  assign x[31] = a[4] & b[3];
    assign x[32] = a[3] & b[4];  assign x[33] = a[2] & b[5];
    assign x[34] = a[1] & b[6];  assign x[35] = a[0] & b[7];
    assign x[36] = a[7] & b[1];  assign x[37] = a[6] & b[2];
    assign x[38] = a[5] & b[3];  assign x[39] = a[4] & b[4];
    assign x[40] = a[3] & b[5];  assign x[41] = a[2] & b[6];
    assign x[42] = a[1] & b[7];
    assign x[43] = a[7] & b[2];  assign x[44] = a[6] & b[3];
    assign x[45] = a[5] & b[4];  assign x[46] = a[4] & b[5];
    assign x[47] = a[3] & b[6];  assign x[48] = a[2] & b[7];
    assign x[49] = a[7] & b[3];  assign x[50] = a[6] & b[4];
    assign x[51] = a[5] & b[5];  assign x[52] = a[4] & b[6];
    assign x[53] = a[3] & b[7];
    assign x[54] = a[7] & b[4];  assign x[55] = a[6] & b[5];
    assign x[56] = a[5] & b[6];  assign x[57] = a[4] & b[7];
    assign x[58] = a[7] & b[5];  assign x[59] = a[6] & b[6];
    assign x[60] = a[5] & b[7];
    assign x[61] = a[7] & b[6];  assign x[62] = a[6] & b[7];
    assign x[63] = a[7] & b[7];

    // --- Row 1: Half Adder for p[1] ---
    ha1 g1  (.a(x[1]),  .b(x[2]),  .s(p[1]),  .c(c[0]));

    // --- Row 2 ---
    ha1 g2  (.a(x[5]),  .b(w[1]),  .s(p[2]),  .c(c[8]));
    fa1 g9  (.a(x[3]),  .b(x[4]),  .c(c[0]),  .s(w[1]),  .c0(c[1]));

    // --- Row 3 ---
    ha1 g3  (.a(x[9]),  .b(w[8]),  .s(p[3]),  .c(c[16]));
    fa1 g10 (.a(x[6]),  .b(x[7]),  .c(c[1]),  .s(w[2]),  .c0(c[2]));
    fa1 g15 (.a(x[8]),  .b(w[2]),  .c(c[8]),  .s(w[8]),  .c0(c[9]));

    // --- Row 4 ---
    ha1 g4  (.a(x[14]), .b(w[15]), .s(p[4]),  .c(c[24]));
    fa1 g11 (.a(x[10]), .b(x[11]), .c(c[2]),  .s(w[3]),  .c0(c[3]));
    fa1 g16 (.a(x[12]), .b(w[3]),  .c(c[9]),  .s(w[9]),  .c0(c[10]));
    fa1 g22 (.a(x[13]), .b(w[9]),  .c(c[16]), .s(w[15]), .c0(c[17]));

    // --- Row 5 ---
    ha1 g5  (.a(x[20]), .b(w[22]), .s(p[5]),  .c(c[32]));
    fa1 g12 (.a(x[15]), .b(x[16]), .c(c[3]),  .s(w[4]),  .c0(c[4]));
    fa1 g17 (.a(x[17]), .b(w[4]),  .c(c[10]), .s(w[10]), .c0(c[11]));
    fa1 g23 (.a(x[18]), .b(w[10]), .c(c[17]), .s(w[16]), .c0(c[18]));
    fa1 g29 (.a(x[19]), .b(w[16]), .c(c[24]), .s(w[22]), .c0(c[25]));

    // --- Row 6 ---
    ha1 g6  (.a(x[27]), .b(w[29]), .s(p[6]),  .c(c[40]));
    fa1 g13 (.a(x[21]), .b(x[22]), .c(c[4]),  .s(w[5]),  .c0(c[5]));
    fa1 g18 (.a(x[23]), .b(w[5]),  .c(c[11]), .s(w[11]), .c0(c[12]));
    fa1 g24 (.a(x[24]), .b(w[11]), .c(c[18]), .s(w[17]), .c0(c[19]));
    fa1 g30 (.a(x[25]), .b(w[17]), .c(c[25]), .s(w[23]), .c0(c[26]));
    fa1 g36 (.a(x[26]), .b(w[23]), .c(c[32]), .s(w[29]), .c0(c[33]));

    // --- Row 7 ---
    ha1 g7  (.a(x[35]), .b(w[36]), .s(p[7]),  .c(c[48]));
    fa1 g14 (.a(x[28]), .b(x[29]), .c(c[5]),  .s(w[6]),  .c0(c[6]));
    fa1 g19 (.a(x[30]), .b(w[6]),  .c(c[12]), .s(w[12]), .c0(c[13]));
    fa1 g25 (.a(x[31]), .b(w[12]), .c(c[19]), .s(w[18]), .c0(c[20]));
    fa1 g31 (.a(x[32]), .b(w[18]), .c(c[26]), .s(w[24]), .c0(c[27]));
    fa1 g37 (.a(x[33]), .b(w[24]), .c(c[33]), .s(w[30]), .c0(c[34]));
    fa1 g43 (.a(x[34]), .b(w[30]), .c(c[40]), .s(w[36]), .c0(c[41]));

    // --- Row 8 (last full row) ---
    ha1 g8  (.a(x[36]), .b(c[6]),  .s(w[7]),  .c(c[7]));
    fa1 g20 (.a(x[37]), .b(w[7]),  .c(c[13]), .s(w[13]), .c0(c[14]));
    fa1 g26 (.a(x[38]), .b(w[13]), .c(c[20]), .s(w[19]), .c0(c[21]));
    fa1 g32 (.a(x[39]), .b(w[19]), .c(c[27]), .s(w[25]), .c0(c[28]));
    fa1 g38 (.a(x[40]), .b(w[25]), .c(c[34]), .s(w[31]), .c0(c[35]));
    fa1 g44 (.a(x[41]), .b(w[31]), .c(c[41]), .s(w[37]), .c0(c[42]));
    fa1 g50 (.a(x[42]), .b(w[37]), .c(c[48]), .s(p[8]),  .c0(c[49]));

    // --- Row 9 ---
    fa1 g21 (.a(x[43]), .b(c[7]),  .c(c[14]), .s(w[14]), .c0(c[15]));
    fa1 g27 (.a(x[44]), .b(w[14]), .c(c[21]), .s(w[20]), .c0(c[22]));
    fa1 g33 (.a(x[45]), .b(w[20]), .c(c[28]), .s(w[26]), .c0(c[29]));
    fa1 g39 (.a(x[46]), .b(w[26]), .c(c[35]), .s(w[32]), .c0(c[36]));
    fa1 g45 (.a(x[47]), .b(w[32]), .c(c[42]), .s(w[38]), .c0(c[43]));
    fa1 g51 (.a(x[48]), .b(w[38]), .c(c[49]), .s(p[9]),  .c0(c[50]));

    // --- Row 10 ---
    fa1 g28 (.a(x[49]), .b(c[15]), .c(c[22]), .s(w[21]), .c0(c[23]));
    fa1 g34 (.a(x[50]), .b(w[21]), .c(c[29]), .s(w[27]), .c0(c[30]));
    fa1 g40 (.a(x[51]), .b(w[27]), .c(c[36]), .s(w[33]), .c0(c[37]));
    fa1 g46 (.a(x[52]), .b(w[33]), .c(c[43]), .s(w[39]), .c0(c[44]));
    fa1 g52 (.a(x[53]), .b(w[39]), .c(c[50]), .s(p[10]), .c0(c[51]));

    // --- Row 11 ---
    fa1 g35 (.a(x[54]), .b(c[23]), .c(c[30]), .s(w[28]), .c0(c[31]));
    fa1 g41 (.a(x[55]), .b(w[28]), .c(c[37]), .s(w[34]), .c0(c[38]));
    fa1 g47 (.a(x[56]), .b(w[34]), .c(c[44]), .s(w[40]), .c0(c[45]));
    fa1 g53 (.a(x[57]), .b(w[40]), .c(c[51]), .s(p[11]), .c0(c[52]));

    // --- Row 12 ---
    fa1 g42 (.a(x[58]), .b(c[31]), .c(c[38]), .s(w[35]), .c0(c[39]));
    fa1 g48 (.a(x[59]), .b(w[35]), .c(c[45]), .s(w[41]), .c0(c[46]));
    fa1 g54 (.a(x[60]), .b(w[41]), .c(c[52]), .s(p[12]), .c0(c[53]));

    // --- Row 13 ---
    fa1 g49 (.a(x[61]), .b(c[39]), .c(c[46]), .s(w[42]), .c0(c[47]));
    fa1 g55 (.a(x[62]), .b(w[42]), .c(c[53]), .s(p[13]), .c0(c[54]));

    // --- Row 14 (MSB) ---
    fa1 g56 (.a(x[63]), .b(c[47]), .c(c[54]), .s(p[14]), .c0(p[15]));

endmodule
