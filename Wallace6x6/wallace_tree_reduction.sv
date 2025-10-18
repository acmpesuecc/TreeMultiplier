module wallace_tree_reduction(a, b, r1, r2);
	input logic [5:0] a, b;
	output logic [11:0] r1, r2;

			logic [13:0]S_FA, C_FA;
            logic [14:0]S_HA, C_HA;

            HA ha1(B[2]&A[0], B[1]&A[1], S_HA[0],C_HA[0]);

			FA fa1(B[3]&A[0], B[2]&A[1], B[1]&A[2], S_FA[0], C_FA[0]);

			FA fa2(B[4]&A[0], B[3]&A[1], B[2]&A[2], S_FA[1], C_FA[1]);

            HA ha2(B[1]&A[3], B[0]&A[4], S_HA[1], C_HA[1]);

			FA fa3(B[5]&A[0], B[4]&A[1], B[3]&A[2], S_FA[2], C_FA[3]);

			FA fa4(B[2]&A[3], B[1]&A[4], B[0]&A[5], S_FA[3], C_FA[3]);

			FA fa5(B[5]&A[1], B[4]&A[2], B[3]&A[3], S_FA[4], C_FA[4]);

			FA fa6(B[5]&A[2], B[4]&A[3], B[3]&A[4], S_FA[5], C_FA[5]);

			HA ha4(B[5]&A[3], B[4]&A[4], S_HA[3], C_HA[3]);

			HA ha5(C_HA[0], S_FA[0], S_HA[1], C_HA[1]);

            FA fa7(C_FA[0], S_FA[1], S_HA[1], S_FA[6], C_FA[6]);

            FA fa8(C_FA[1], C_HA[1], S_FA[2], S_FA[7], C_FA[7]);

            FA fa9(C_FA[2], C_FA[3], S_FA[4], S_FA[8], C_FA[8]);

			FA fa10(C_FA[4], C_HA[2], S_FA[5], S_FA[9], C_FA[9]);

			HA ha6(C_FA[5] S_HA[3], S_HA[5], C_HA[5]);

			HA ha7(C_HA[3], B[5]&A[4], S_HA[6], C_HA[6]);

			HA ha8(C_FA[6], S_FA[7], S_HA[7], C_HA[7]);

			HA ha9(C_FA[7], S_FA[8], S_HA[8], C_HA[8]);

			HA ha10(C_FA[8], S_FA[9], S_HA[9], C_HA[9]);

			HA ha11(C_FA[9], S_HA[5], S_HA[10], C_HA[10]);

			HA ha12(C_HA[5], S_HA[6], S_HA[11], C_HA[11]);

			HA ha13(C_HA[7], S_HA[8], S_HA[12], C_HA[12]);

			FA fa11(C_HA[8], S_HA[9], B[2]&A[5], S_FA[10], C_FA[10]);

			FA fa12(C_HA[9], S_HA[10], B[3]&A[5], S_FA[11], C_FA[11]);

			FA fa13(C_HA[10], S_HA[11], B[4]&A[5], S_FA[12], C_FA[12]);

			HA ha14(C_HA[11], B[5]&A[5], S_HA[13], C_HA[13]);

            assign R1[0]=B[0]&A[0];
			assign R1[1]=B[1]&A[0];
			assign R1[2]=S_HA[0];
			assign R1[3]=S_HA[4];
			assign R1[4]=C_HA[4];
			assign R1[5]=S_HA[8];
			assign R1[6]=S_HA[13];
			assign R1[7]=C_HA[13];
			assign R1[8]=C_FA[11];
			assign R1[9]=C_FA[12];
			assign R1[10]=C_FA[13];
			assign R1[11]=1'b0;

			assign R2[0]=1'b0;
            assign R2[1]=B[0]&A[1];
			assign R2[2]=B[0]&A[2];
			assign R2[3]=B[0]&A[3];
			assign R2[4]=S_FA[7];
			assign R2[5]=S_FA[4];
			assign R2[6]=S_HA[3];
			assign R2[7]=S_FA[11];
			assign R2[8]=S_FA[12];
			assign R2[9]=S_FA[13];
			assign R2[10]=S_HA[14];
			assign R2[11]=C_HA[14];
endmodule
