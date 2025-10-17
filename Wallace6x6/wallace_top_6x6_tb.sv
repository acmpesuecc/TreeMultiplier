// This testbench verifies the complete top-level Wallace6x6 multiplier.
// It generates two random 6-bit numbers (A and B), feeds them to the
// multiplier, and asserts that the output Product is equal to A * B.

// Note: This testbench assumes the top-level module is named `top_level_multiplier`
// to match your screenshot.

module wallace_top_6x6_tb;

    // Signals to connect to the DUT
    logic [5:0]  A;
    logic [5:0]  B;
    logic [11:0] Product;

    // Instantiate the top-level Wallace6x6 module
    // I am using the name from your screenshot.
    top_level_multiplier dut (
        .A(A),
        .B(B),
        .Product(Product)
    );

    // Verification logic
    initial begin
        $display("--- Starting Top-Level Wallace6x6 Multiplier Testbench ---");

        // Test with 200 random input values
        for (int i = 0; i < 200; i++) begin
            A = $urandom;
            B = $urandom;
            #10; // Wait for logic to compute
            
            assert (Product === A * B) else
                $fatal(1, "ERROR: Random test failed! %0d * %0d = %0d, but expected %0d", A, B, Product, A * B);
        end
        $display("All 200 random tests passed!");

        // Test specific edge cases for robustness
        $display("--- Testing Edge Cases ---");
        
        // Case 1: Multiplying by zero
    A = 63; B = 0; #10; assert (Product === 0) else $fatal(1, "ERROR: Zero test failed.");
        $display("Edge Case: A * 0 PASSED.");
        
        // Case 2: Multiplying by one
    A = 42; B = 1; #10; assert (Product === 42) else $fatal(1, "ERROR: One test failed.");
        $display("Edge Case: A * 1 PASSED.");

        // Case 3: Multiplying maximum values
    A = 63; B = 63; #10; assert (Product === 63 * 63) else $fatal(1, "ERROR: Max value test failed.");
        $display("Edge Case: MAX * MAX PASSED.");

        $display("--- All tests passed successfully! ---");
        $finish;
    end

endmodule
