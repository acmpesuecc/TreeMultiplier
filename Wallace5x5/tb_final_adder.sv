module tb_final_adder;

    logic [9:0] a, b;
    logic c_in;
    logic [9:0] sum;
    logic c_out;

    // Instantiate the 10-bit Carry Lookahead Adder
    final_adder uut (
        .a(a), 
        .b(b), 
        .c_in(c_in), 
        .sum(sum), 
        .c_out(c_out)
    );

    initial begin
        // Test Case 1: 0 + 0
        a = 10'b0000000000; 
        b = 10'b0000000000;
        c_in = 1'b0;
        #10;
        $display("Test 1: a = %b, b = %b, sum = %b, carry out = %b", a, b, sum, c_out);

        // Test Case 2: Random values
        a = 10'b1010101010; 
        b = 10'b0101010101;
        c_in = 1'b0;
        #10;
        $display("Test 2: a = %b, b = %b, sum = %b, carry out = %b", a, b, sum, c_out);

        // Test Case 3: Overflow scenario
        a = 10'b1111111111;
        b = 10'b0000000001;
        c_in = 1'b0;
        #10;
        $display("Test 3: a = %b, b = %b, sum = %b, carry out = %b", a, b, sum, c_out);

        // Finish the simulation
        $finish;
    end

endmodule
