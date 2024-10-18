module final_adder_testbench;
    logic [9:0] a, b;
    logic [9:0] s;

    // Instantiate the final adder module
    final_adder uut (
        .a(a),
        .b(b),
        .s(s)
    );

    initial begin
        // Test Case 1
        a = 10'b0001101101; // 429
        b = 10'b0001010011; // 339
        #10;
        $display("Test 1: a = %b, b = %b, Sum = %b", a, b, s);

        // Test Case 2
        a = 10'b1111111111; // 1023
        b = 10'b1111111111; // 1023
        #10;
        $display("Test 2: a = %b, b = %b, Sum = %b", a, b, s);

        #10 $finish;
    end
endmodule
