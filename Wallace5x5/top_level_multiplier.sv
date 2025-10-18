module top_level_multiplier(A, B, P);
	input logic [4:0] A, B;
	output logic [9:0] P;
	
	logic [9:0]R3, R4;
    logic [8:0]S_P,C_P;

	wallace_tree_reduction wtr(.A(A), .B(B), .R1(R3), .R2(R4));

    final_adder fa1(R3[1], R4[1], S_P[0], C_P[0]);

    final_adder fa1(R3[2], R4[2], S_P[1], C_P[1]);

    final_adder fa1(R3[3], R4[3], S_P[2], C_P[2]);

    final_adder fa1(R3[4], R4[4], S_P[3], C_P[3]);

    final_adder fa1(R3[5], R4[5], S_P[4], C_P[4]);

    final_adder fa1(R3[6], R4[6], S_P[5], C_P[5]);

    final_adder fa1(R3[7], R4[7], S_P[6], C_P[6]);

    final_adder fa1(R3[8], R4[8], S_P[7], C_P[7]);

    assign P[0]=R3[0];
    assign P[1]=S_P[0];
    assign P[2]=S_P[1];
    assign P[3]=S_P[2];
    assign P[4]=S_P[3];
    assign P[5]=S_P[4];
    assign P[6]=S_P[5];
    assign P[7]=S_P[6];
    assign P[8]=S_P[7];
    assign P[9]=R4[9];        

endmodule 
