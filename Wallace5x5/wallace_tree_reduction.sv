// wallace_tree_reduction.sv
module wallace_tree_reduction(
    input logic [4:0] a, b,
    output logic [9:0] r1, r2
);

    wire [4:0] pp0, pp1, pp2, pp3, pp4;

    // Generate partial products
    assign pp0 = a & {5{b[0]}};
    assign pp1 = a & {5{b[1]}};
    assign pp2 = a & {5{b[2]}};
    assign pp3 = a & {5{b[3]}};
    assign pp4 = a & {5{b[4]}};

    wire s11, c11, s12, c12, s13, c13, s14, c14;
    wire s21, c21, s22, c22, s23, c23;

    assign r1[0] = pp0[0]; 

    // Half Adder for the first two bits
    HA ha1(.a(pp0[1]), .b(pp1[0]), .sum(r1[1]), .carry(c11));

    // Full Adders for the next levels
    FA fa1(.a(pp0[2]), .b(pp1[1]), .c(pp2[0]), .sum(s12), .carry(c12));
    FA fa2(.a(pp0[3]), .b(pp1[2]), .c(pp2[1]), .sum(s13), .carry(c13));
    FA fa3(.a(pp0[4]), .b(pp1[3]), .c(pp2[2]), .sum(s14), .carry(c14));

    // Connecting outputs of Full Adders
    FA fa4(.a(s12), .b(pp3[0]), .c(c11), .sum(r1[2]), .carry(c21));
    FA fa5(.a(s13), .b(pp3[1]), .c(c12), .sum(s22), .carry(c22));
    FA fa6(.a(s14), .b(pp3[2]), .c(c13), .sum(s23), .carry(c23));

    // Finalizing outputs
    FA fa7(.a(s22), .b(pp4[0]), .c(c21), .sum(r1[3]), .carry(r2[3]));
    FA fa8(.a(s23), .b(pp4[1]), .c(c22), .sum(r1[4]), .carry(r2[4]));

    assign r1[5] = c14;
    assign r2[0] = 0; // Initialize unused bits
    assign r2[1] = c14;
    assign r2[2] = 0;

endmodule
