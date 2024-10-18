// Design a 12-bit carry lookahead adder
module final_adder(
    input wire [11:0] a,   // 12-bit input A
    input wire [11:0] b,   // 12-bit input B
    output wire [11:0] s   // 12-bit sum output
);

    wire [11:0] G;   // Generate signals
    wire [11:0] P;   // Propagate signals
    wire [12:0] C;   // Carry signals (C[0] is the initial carry-in, typically 0)

    // Generate and propagate calculations
    assign G = a & b;         // Generate: G[i] = a[i] & b[i]
    assign P = a ^ b;         // Propagate: P[i] = a[i] ^ b[i]

    // Calculate carry signals using lookahead logic
    assign C[0] = 1'b0;       // Initial carry-in is 0
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign C[6] = G[5] | (P[5] & C[5]);
    assign C[7] = G[6] | (P[6] & C[6]);
    assign C[8] = G[7] | (P[7] & C[7]);
    assign C[9] = G[8] | (P[8] & C[8]);
    assign C[10] = G[9] | (P[9] & C[9]);
    assign C[11] = G[10] | (P[10] & C[10]);
    assign C[12] = G[11] | (P[11] & C[11]);

    // Calculate the sum using propagate and carry
    assign s = P ^ C[11:0];

endmodule
