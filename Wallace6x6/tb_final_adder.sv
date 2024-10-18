// Testbench for 12-bit carry lookahead adder
module tb_final_adder;

    reg [11:0] a, b;   // 12-bit input A and B
    wire [11:0] s;     // 12-bit sum output

    // Instantiate the final_adder module
    final_adder uut (
        .a(a),
        .b(b),
        .s(s)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_final_adder);
        // Test cases
        a = 12'd5; b = 12'd7; #10; // Example: 5 + 7
        $display("A = %d, B = %d, Sum = %d", a, b, s);
        
        a = 12'd50; b = 12'd75; #10; // Example: 50 + 75
        $display("A = %d, B = %d, Sum = %d", a, b, s);
        
        a = 12'd1000; b = 12'd500; #10; // Example: 1000 + 500
        $display("A = %d, B = %d, Sum = %d", a, b, s);

        a = 12'd4095; b = 12'd1; #10; // Example: 4095 + 1 (max value + 1)
        $display("A = %d, B = %d, Sum = %d", a, b, s);

        $finish; // End simulation
    end

endmodule
