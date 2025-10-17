// This module is the core of the Wallace Tree multiplier.
// it's basically a adder which "ll add parallely the numbers"

module wallace_tree_reduction (
    input  logic [5:0] a, // multiplicand
    input  logic [5:0] b, // multiplier
    output logic [11:0] r1,   // reduced sum row (to be added by final adder)
    output logic [11:0] r2    // reduced carry row (to be added by final adder)
);


    // Wires to connect the stages of the Wallace Tree.
    // The width is 12 bits to accommodate the final 12-bit product.
    
    // Stage 1: Reduces 6 rows to 4 rows.
    logic [11:0] s1[3:0]; // Sums from stage 1
    logic [11:0] c1[3:0]; // Carries from stage 1 (shifted)

    // Generate shifted partial products (each row shifted by its index)
    logic [11:0] pp[5:0];
    integer ri, cj;
    always_comb begin
        for (ri = 0; ri < 6; ri = ri + 1) begin
            pp[ri] = 12'b0;
            for (cj = 0; cj < 6; cj = cj + 1) begin
                pp[ri][ri + cj] = a[cj] & b[ri];
            end
        end
    end

    // Stage 2: Reduces 4 rows to 3 rows.
    logic [11:0] s2[2:0];
    logic [11:0] c2[2:0];
    
    // Stage 3: Reduces 3 rows to 2 rows (final output).
    logic [11:0] s3[1:0];
    logic [11:0] c3[1:0];

    // Ensure base carry bits are zero (no driver writes index 0 of carry vectors)
    // This prevents X propagation from undriven bits.
    // These are simple tied-zeros for the column 0 carry-ins.
    assign c1[0][0] = 1'b0;
    assign c1[1][0] = 1'b0;
    assign c2[0][0] = 1'b0;
    assign c3[0][0] = 1'b0;


    // --- STAGE 1: 6 rows -> 4 rows ---
    // We use full adders to combine groups of 3 partial product bits.
    genvar i;
    generate
        for (i = 0; i < 11; i++) begin : stage1_reduction
            // Group pp[0], pp[1], pp[2]
            FA_1 fa1 (
                .a(pp[0][i]), .b(pp[1][i]), .c(pp[2][i]),
                .sum(s1[0][i]), .carry(c1[0][i+1])
            );
            // Group pp[3], pp[4], pp[5]
            FA_1 fa2 (
                .a(pp[3][i]), .b(pp[4][i]), .c(pp[5][i]),
                .sum(s1[1][i]), .carry(c1[1][i+1])
            );
        end
        // The other two rows for the next stage are just the carry outputs.
        assign s1[2] = c1[0];
        assign s1[3] = c1[1];
    endgenerate

    // --- STAGE 2: 4 rows -> 3 rows ---
    generate
    for (i = 0; i < 11; i++) begin : stage2_reduction
             // Group s1[0], s1[1], s1[2]
            FA_1 fa3 (
                .a(s1[0][i]), .b(s1[1][i]), .c(s1[2][i]),
                .sum(s2[0][i]), .carry(c2[0][i+1])
            );
        end
        // The remaining row is passed through, and the third row is the carry.
        assign s2[1] = s1[3];
        assign s2[2] = c2[0];
    endgenerate

    // --- STAGE 3: 3 rows -> 2 rows (Final Stage) ---
    generate
    for (i = 0; i < 11; i++) begin : stage3_reduction
            // Group s2[0], s2[1], s2[2] to get the final two rows.
            FA_1 fa4 (
                .a(s2[0][i]), .b(s2[1][i]), .c(s2[2][i]),
                .sum(s3[0][i]), .carry(c3[0][i+1])
            );
        end
        // The second final row is the carry output from the last stage of adders.
        assign s3[1] = c3[0];
    endgenerate

    // Assign the final two rows to the module's outputs.
    // Some most-significant bits (index 11) are not produced by the reduction
    // (the 6x6 partial products only occupy indices 0..10). Force any
    // unassigned MSB bits to 0 to avoid X propagation into the final adder.
    assign s1[0][11] = 1'b0;
    assign s1[1][11] = 1'b0;
    assign s2[0][11] = 1'b0;
    assign s3[0][11] = 1'b0;

    assign r1 = s3[0];
    assign r2 = s3[1];

endmodule
