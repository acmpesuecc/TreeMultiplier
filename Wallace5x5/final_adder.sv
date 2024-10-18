
module final_adder (
    input  logic [9:0] a, 
    input  logic [9:0] b, 
    input  logic c_in,    // Carry input
    output logic [9:0] sum, 
    output logic c_out    // Carry output
);

    logic [9:0] p, g, c;  

    // Generate propagate and generate 
    assign p = a ^ b;  // Propagate
    assign g = a & b;  // Generate

    // Carry lookahead 
    assign c[0] = c_in;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & c[1]);
    assign c[3] = g[2] | (p[2] & c[2]);
    assign c[4] = g[3] | (p[3] & c[3]);
    assign c[5] = g[4] | (p[4] & c[4]);
    assign c[6] = g[5] | (p[5] & c[5]);
    assign c[7] = g[6] | (p[6] & c[6]);
    assign c[8] = g[7] | (p[7] & c[7]);
    assign c[9] = g[8] | (p[8] & c[8]);
    assign c_out = g[9] | (p[9] & c[9]);  // Final carry out

    // Sum calculation
    assign sum = p ^ c;

endmodule
