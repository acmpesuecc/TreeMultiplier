module wallace_tree_reduction(a, b, r1, r2);
	input logic [4:0] a, b;
	output logic [9:0] r1, r2;

	// Partial products
	wire [4:0] pp [0:4];
	assign pp[0] = a & {5{b[0]}};
	assign pp[1] = a & {5{b[1]}};
	assign pp[2] = a & {5{b[2]}};
	assign pp[3] = a & {5{b[3]}};
	assign pp[4] = a & {5{b[4]}};

	// Stage 1 wires
	wire s1_0, c1_0, s1_1, c1_1, s1_2, c1_2, s1_3, c1_3;

	// Stage 1 adders
	HA ha1_0 (pp[0][1], pp[1][0], c1_0, s1_0);
	FA_1 fa1_1 (pp[0][2], pp[1][1], pp[2][0], s1_1, c1_1);
	FA_1 fa1_2 (pp[0][3], pp[1][2], pp[2][1], s1_2, c1_2);
	FA_1 fa1_3 (pp[0][4], pp[1][3], pp[2][2], s1_3, c1_3);

	// Stage 2 wires
	wire s2_0, c2_0, s2_1, c2_1, s2_2, c2_2, s2_3, c2_3;

	// Stage 2 adders
	HA ha2_0 (s1_1, c1_0, c2_0, s2_0);
	FA_1 fa2_1 (s1_2, c1_1, pp[3][0], s2_1, c2_1);
	FA_1 fa2_2 (s1_3, c1_2, pp[3][1], s2_2, c2_2);
	FA_1 fa2_3 (c1_3, pp[1][4], pp[2][3], s2_3, c2_3);

	// Stage 3 wires
	wire s3_0, c3_0, s3_1, c3_1, s3_2, c3_2, s3_3, c3_3;

	// Stage 3 adders
	HA ha3_0 (s2_1, c2_0, c3_0, s3_0);
	FA_1 fa3_1 (s2_2, c2_1, pp[4][0], s3_1, c3_1);
	FA_1 fa3_2 (s2_3, c2_2, pp[4][1], s3_2, c3_2);
	FA_1 fa3_3 (c2_3, pp[2][4], pp[3][3], s3_3, c3_3);

	// Final Rows assignment
	assign r1 = {pp[4][4], pp[3][4], s3_3, s3_2, s3_1, s3_0, s2_0, s1_0, pp[0][0]};
	assign r2 = {1'b0, c3_3, c3_2, c3_1, c3_0, pp[4][2], pp[3][2], pp[1][3], pp[0][4], pp[0][3]};

endmodule