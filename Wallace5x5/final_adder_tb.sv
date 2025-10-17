module final_adder_tb;

    logic [9:0] a;
    logic [9:0] b;
    logic [9:0] s;
    logic carry_out;

    final_adder DUT (
        .a(a),
        .b(b),
        .s(s),
        .carry_out(carry_out)
    );

    initial begin

        a = 10'd1;
        b = 10'd1;
        #5;
        
        a = 10'd100;
        b = 10'd50;
        #5;

        a = 10'd511; 
        b = 10'd512; 
        #5;
        a = 10'd1023; 
        b = 10'd1;
        #5;
        
        a = 10'd0;
        b = 10'd0;
        #5;
        

        $finish;
    end

endmodule