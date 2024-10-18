// Design a 10-bit Carry Lookahead Adder
module final_adder(
    input logic [9:0] a,       // 10-bit input A
    input logic [9:0] b,       // 10-bit input B
    output logic [9:0] s,      // 10-bit sum output
    output logic carry_out      
);
    logic [9:0] generate;      
    logic [9:0] propagate;      
    logic [10:0] carry;        

    // Generate and Propagate Logic
    assign generate = a & b;   
    assign propagate = a | b;   

    //logic
    assign carry[0] = 1'b0;      //assumed to be 0
    assign carry[1] = generate[0] | (propagate[0] & carry[0]);
    assign carry[2] = generate[1] | (propagate[1] & carry[1]);
    assign carry[3] = generate[2] | (propagate[2] & carry[2]);
    assign carry[4] = generate[3] | (propagate[3] & carry[3]);
    assign carry[5] = generate[4] | (propagate[4] & carry[4]);
    assign carry[6] = generate[5] | (propagate[5] & carry[5]);
    assign carry[7] = generate[6] | (propagate[6] & carry[6]);
    assign carry[8] = generate[7] | (propagate[7] & carry[7]);
    assign carry[9] = generate[8] | (propagate[8] & carry[8]);
    assign carry_out = generate[9] | (propagate[9] & carry[9]); 

    // sum Calculation
    assign s = a ^ b ^ carry[9:0]; 

endmodule

