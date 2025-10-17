`timescale 1ns / 1ps

module wallace_tree_reduction_tb;

	logic [4:0] a, b;
	logic [9:0] r1, r2;
	logic [9:0] expected_product;

	wallace_tree_reduction dut (
		.a(a),
		.b(b),
		.r1(r1),
		.r2(r2)
	);

	initial begin
		$dumpfile("waveform.vcd");
		$dumpvars(0, wallace_tree_reduction_tb);

		// Test case 1: Basic multiplication
		a = 5'd5;  b = 5'd7; #10;
		expected_product = a * b;
		assert (r1 + r2 === expected_product) else $error("Test Case 1 Failed: 5 * 7");

		// Test case 2: Multiplication by zero
		a = 5'd15; b = 5'd0; #10;
		expected_product = a * b;
		assert (r1 + r2 === expected_product) else $error("Test Case 2 Failed: 15 * 0");

		// Test case 3: Multiplication with max values
		a = 5'd31; b = 5'd31; #10;
		expected_product = a * b;
		assert (r1 + r2 === expected_product) else $error("Test Case 3 Failed: 31 * 31");

		// Test case 4: Random values
		a = $random; b = $random; #10;
		expected_product = a * b;
		assert (r1 + r2 === expected_product) else $error("Test Case 4 Failed: Random values");
		
		$display("All test cases passed!");
		$finish;
	end

endmodule