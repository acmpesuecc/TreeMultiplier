module wallace_tree_reduction(
	input logic [4:0] a, b,
	output logic [9:0] r1, r2
);
	logic [4:0] p [4:0];
	logic [9:0] s1_sum_w, s1_carry_w;
	logic [9:0] s2_sum_w, s2_carry_w;
	logic p30_w3;
	logic p31_w4, p40_w4;
	logic p41_w5;
	logic s3_in_w5, s3_in_w6_b;
	logic final_c9;

	module FA (input logic i1, i2, i3, output logic s, c);
		assign s = i1 ^ i2 ^ i3;
		assign c = (i1 & i2) | (i2 & i3) | (i1 & i3);
	endmodule

	module HA (input logic i1, i2, output logic s, c);
		assign s = i1 ^ i2;
		assign c = i1 & i2;
	endmodule

	assign p[0][0] = a[0] & b[0];
	assign p[0][1] = a[0] & b[1];
	assign p[0][2] = a[0] & b[2];
	assign p[0][3] = a[0] & b[3];
	assign p[0][4] = a[0] & b[4];
	assign p[1][0] = a[1] & b[0];
	assign p[1][1] = a[1] & b[1];
	assign p[1][2] = a[1] & b[2];
	assign p[1][3] = a[1] & b[3];
	assign p[1][4] = a[1] & b[4];
	assign p[2][0] = a[2] & b[0];
	assign p[2][1] = a[2] & b[1];
	assign p[2][2] = a[2] & b[2];
	assign p[2][3] = a[2] & b[3];
	assign p[2][4] = a[2] & b[4];
	assign p[3][0] = a[3] & b[0];
	assign p[3][1] = a[3] & b[1];
	assign p[3][2] = a[3] & b[2];
	assign p[3][3] = a[3] & b[3];
	assign p[3][4] = a[3] & b[4];
	assign p[4][0] = a[4] & b[0];
	assign p[4][1] = a[4] & b[1];
	assign p[4][2] = a[4] & b[2];
	assign p[4][3] = a[4] & b[3];
	assign p[4][4] = a[4] & b[4];
	
	assign s1_sum_w[9] = 1'b0;
	assign s1_carry_w[9] = 1'b0;
	assign s2_sum_w[9] = 1'b0;
	assign s2_carry_w[9] = 1'b0;

    assign s1_carry_w[0] = 1'b0;
    assign s1_carry_w[1] = 1'b0;
    
    assign s2_carry_w[0] = 1'b0;
    assign s2_carry_w[1] = 1'b0;
    assign s2_carry_w[2] = 1'b0;

	assign s1_sum_w[0] = p[0][0];
	HA ha_s1_w1 (.i1(p[0][1]), .i2(p[1][0]), .s(s1_sum_w[1]), .c(s1_carry_w[2]));
	FA fa_s1_w2 (.i1(p[0][2]), .i2(p[1][1]), .i3(p[2][0]), .s(s1_sum_w[2]), .c(s1_carry_w[3]));
	FA fa_s1_w3 (.i1(p[0][3]), .i2(p[1][2]), .i3(p[2][1]), .s(s1_sum_w[3]), .c(s1_carry_w[4]));
	assign p30_w3 = p[3][0];

	logic s1_FA_S_w4, s1_FA_C_w5; 
	FA fa_s1_w4_a (.i1(p[0][4]), .i2(p[1][3]), .i3(p[2][2]), .s(s1_FA_S_w4), .c(s1_FA_C_w5));

	logic s1_HA_S_w4, s1_HA_C_w5; 
	HA ha_s1_w4_b (.i1(p[3][1]), .i2(p[4][0]), .s(s1_HA_S_w4), .c(s1_HA_C_w5));

	assign s1_sum_w[4] = s1_FA_S_w4;
	assign p31_w4 = s1_HA_S_w4;
	assign s1_carry_w[5] = s1_FA_C_w5;
	assign p40_w4 = s1_HA_C_w5;

	FA fa_s1_w5 (.i1(p[1][4]), .i2(p[2][3]), .i3(p[3][2]), .s(s1_sum_w[5]), .c(s1_carry_w[6]));
	assign p41_w5 = p[4][1];

	FA fa_s1_w6 (.i1(p[2][4]), .i2(p[3][3]), .i3(p[4][2]), .s(s1_sum_w[6]), .c(s1_carry_w[7]));
	HA ha_s1_w7 (.i1(p[3][4]), .i2(p[4][3]), .s(s1_sum_w[7]), .c(s1_carry_w[8]));
	assign s1_sum_w[8] = p[4][4];

	assign s2_sum_w[0] = s1_sum_w[0];
	assign s2_sum_w[1] = s1_sum_w[1];

	HA ha_s2_w2 (.i1(s1_sum_w[2]), .i2(s1_carry_w[2]), .s(s2_sum_w[2]), .c(s2_carry_w[3]));
	FA fa_s2_w3 (.i1(s1_sum_w[3]), .i2(s1_carry_w[3]), .i3(p30_w3), .s(s2_sum_w[3]), .c(s2_carry_w[4]));
	FA fa_s2_w4 (.i1(s1_sum_w[4]), .i2(s1_carry_w[4]), .i3(p31_w4), .s(s2_sum_w[4]), .c(s2_carry_w[5]));

	logic s2_FA_S_w5, s2_FA_C_w6; 
	FA fa_s2_w5_a (.i1(s1_sum_w[5]), .i2(s1_carry_w[5]), .i3(p41_w5), .s(s2_FA_S_w5), .c(s2_FA_C_w6));

	logic s2_HA_S_w5, s2_HA_C_w6; 
	HA ha_s2_w5_b (.i1(s1_carry_w[6]), .i2(p40_w4), .s(s2_HA_S_w5), .c(s2_HA_C_w6));
	
	assign s2_sum_w[5] = s2_FA_S_w5;
	assign s3_in_w5 = s2_HA_S_w5;
	assign s2_carry_w[6] = s2_FA_C_w6;
	assign s3_in_w6_b = s2_HA_C_w6;

	FA fa_s2_w6 (.i1(s1_sum_w[6]), .i2(s1_carry_w[7]), .i3(s2_carry_w[6]), .s(s2_sum_w[6]), .c(s2_carry_w[7]));
	HA ha_s2_w7 (.i1(s1_sum_w[7]), .i2(s1_carry_w[8]), .s(s2_sum_w[7]), .c(s2_carry_w[8]));
	assign s2_sum_w[8] = s1_sum_w[8];

	assign r1[0] = s2_sum_w[0];
	assign r2[0] = 1'b0;

	assign r1[1] = s2_sum_w[1];
	assign r2[1] = 1'b0;

	assign r1[2] = s2_sum_w[2];
	assign r2[2] = s2_carry_w[3];
	
	assign r1[3] = s2_sum_w[3];
	assign r2[3] = s2_carry_w[4];
	
	assign r1[4] = s2_sum_w[4];
	assign r2[4] = s2_carry_w[5];

	FA fa_s3_w5 (.i1(s2_sum_w[5]), .i2(s2_carry_w[5]), .i3(s3_in_w5), .s(r1[5]), .c(r2[6]));
	FA fa_s3_w6 (.i1(s2_sum_w[6]), .i2(s2_carry_w[6]), .i3(s3_in_w6_b), .s(r1[6]), .c(r2[7]));
    HA ha_s3_w7 (.i1(s2_sum_w[7]), .i2(s2_carry_w[7]), .s(r1[7]), .c(r2[8]));
	HA ha_s3_w8_inst (.i1(s2_sum_w[8]), .i2(s2_carry_w[8]), .s(r1[8]), .c(final_c9));
    assign r2[9] = 1'b0;
	assign r1[9] = final_c9;

endmodule
