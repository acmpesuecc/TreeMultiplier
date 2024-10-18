// Full adder 
module FA_1(
    input wire a, b, c,
    output wire sum, carry
);

    assign sum = (a ^ b) ^ c;
    assign carry = (a & b) | (b & c) | (c & a);

endmodule