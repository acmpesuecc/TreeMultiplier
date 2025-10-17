// This module is the core of the Wallace Tree multiplier.
// It takes 6 partial products (pp) and reduces them down to two vectors
// (sum_out and carry_out) using stages of full and half adders.
// It uses the FA and HA modules defined in FA.sv and HA.sv.

module wallace_tree_reduction (
    input  logic [5:0] pp[5:0],      // Input: An array of 6 partial products, each 6 bits wide.
    output logic [11:0] sum_out,   // Output: The final sum vector.
    output logic [11:0] carry_out  // Output: The final carry vector.
);

    // Wires to connect the stages of the Wallace Tree.
    // The width is 12 bits to accommodate the final 12-bit product.
    
    // Stage 1: Reduces 6 rows to 4 rows.
    logic [11:0] s1[3:0]; 
    logic [11:0] c1[1:0]; 

    // Stage 2: Reduces 4 rows to 3 rows.
    logic [11:0] s2[2:0];
    logic [11:0] c2[1:0];
    
    // Stage 3: Reduces 3 rows to 2 rows (final output).
    logic [11:0] s3;
    logic [11:0] c3;

    // --- STAGE 1: 6 rows -> 4 rows ---
    genvar i;
    generate
        for (i = 0; i < 6; i++) begin : stage1_reduction
            // Group pp[0], pp[1], pp[2] using the module from FA.sv
            FA fa1 (
                .a(pp[0][i]), .b(pp[1][i]), .cin(pp[2][i]),
                .sum(s1[0][i]), .cout(c1[0][i+1])
            );
            // Group pp[3], pp[4], pp[5] using the module from FA.sv
            FA fa2 (
                .a(pp[3][i]), .b(pp[4][i]), .cin(pp[5][i]),
                .sum(s1[1][i]), .cout(c1[1][i+1])
            );
        end
        // The other two rows for the next stage are just the carry outputs.
        assign s1[2] = c1[0];
        assign s1[3] = c1[1];
    endgenerate

    // --- STAGE 2: 4 rows -> 3 rows ---
    generate
        for (i = 0; i < 8; i++) begin : stage2_reduction
            // For columns with 3 or 4 bits, use a Full Adder
             FA fa3 (
                .a(s1[0][i]), .b(s1[1][i]), .cin(s1[2][i]),
                .sum(s2[0][i]), .cout(c2[0][i+1])
            );
        end
        // Pass through the remaining bit from the 4th row
        assign s2[1] = s1[3];
        assign s2[2] = c2[0];
    endgenerate


    // --- STAGE 3: 3 rows -> 2 rows (Final Stage) ---
    generate
        for (i = 0; i < 10; i++) begin : stage3_reduction
            // Group the 3 rows to get the final two rows.
            FA fa4 (
                .a(s2[0][i]), .b(s2[1][i]), .cin(s2[2][i]),
                .sum(s3[i]), .cout(c3[i+1])
            );
        end
    endgenerate

    // Assign the final two rows to the module's outputs.
    assign sum_out = s3;
    assign carry_out = c3;

endmodule

