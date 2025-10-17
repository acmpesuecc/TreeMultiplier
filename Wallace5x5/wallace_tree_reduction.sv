`timescale 1ns / 1ps

//Changed Ha.sv in repo to match sum,carry format (like in FA.sv) instead of carry,sum.

module wallace_tree_reduction(
            input logic [4:0] A, B,
            output logic [9:0] R1,R2);
            
            logic [6:0]S_FA, C_FA;
            logic [7:0]S_HA, C_HA;
            logic [7:0]S_P, C_P;

            HA ha1(B[2]&A[0], B[1]&A[1], S_HA[0],C_HA[0]);

            HA ha2(B[1]&A[3], B[0]&A[4], S_HA[1], C_HA[1]);

            FA fa1(B[3]&A[0], B[2]&A[1], B[1]&A[2], S_FA[0], C_FA[0]);

            HA ha3(C_HA[0], S_FA[0], S_HA[2], C_HA[2]);

            FA fa2(B[4]&A[0], B[3]&A[1], B[2]&A[2], S_FA[1], C_FA[1]);

            FA fa3(B[4]&A[1], B[3]&A[2], B[2]&A[3], S_FA[2], C_FA[3]);

            FA fa4(B[4]&A[2], B[3]&A[3], B[2]&A[4], S_FA[3], C_FA[3]);

            FA fa5(C_FA[0], S_FA[1], S_HA[1], S_FA[4], C_FA[4]);

            FA fa6(C_FA[1], C_HA[1], S_FA[2], S_FA[5], C_FA[5]);

            FA fa7(C_FA[3], B[4]&A[3], B[3]&A[4], S_FA[6], C_FA[6]);

            HA ha4(C_FA[2], S_FA[3], S_HA[3], C_HA[3]);

            HA ha5(C_FA[4], S_FA[5], S_HA[4], C_HA[4]);

            HA ha6(C_FA[5], S_HA[3], S_HA[5], C_HA[5]);

            HA ha7(C_HA[3], S_FA[6], S_HA[6], C_HA[6]);

            HA ha8(C_FA[6], B[4]&A[4], S_HA[7], C_HA[7]);
            
            assign R1[0]=B[0]&A[0];
			assign R1[1]=B[1]&A[0];
			assign R1[2]=S_HA[0];
			assign R1[3]=S_HA[2];
			assign R1[4]=C_HA[2];
			assign R1[5]=S_HA[4];
			assign R1[6]=C_HA[4];
			assign R1[7]=C_HA[5];
			assign R1[8]=C_HA[6];
			assign R1[9]=1'b0;

			assign R2[0]=1'b0;
            assign R2[1]=B[0]&A[1];
			assign R2[2]=B[0]&A[2];
			assign R2[3]=B[0]&A[3];
			assign R2[4]=S_FA[4];
			assign R2[5]=B[1]&A[4];
			assign R2[6]=S_HA[5];
			assign R2[7]=S_HA[6];
			assign R2[8]=S_HA[7];
			assign R2[9]=C_HA[7];

endmodule
