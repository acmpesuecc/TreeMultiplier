
module wallace_tree_testbench;

    logic [4:0] a, b;
    logic [9:0] r1, r2;
    
    wallace_tree_reduction uut (
        .a(a),
        .b(b),
        .r1(r1),
        .r2(r2)
    );

    initial begin
        $monitor("Time = %0t | A = %b, B = %b | R1 = %b, R2 = %b", $time, a, b, r1, r2);
        
        a = 5; b = 3; #10;
        a = 15; b = 7; #10;
        a = 31; b = 31; #10;
        a = 9; b = 12; #10;
        a = 0; b = 0; #10;
        a = 1; b = 1; #10;

        $stop;
    end
endmodule