module top_level_multiplier(A, B, Product);
	input logic [5:0] A, B;
	output logic [11:0] Product;

	wire [11:0] R1, R2;
	wallace_tree_reduction wtr(.a(A), .b(B), .r1(R1), .r2(R2));
	final_adder fa(.a(R1), .b(R2), .s(Product));

endmodule
