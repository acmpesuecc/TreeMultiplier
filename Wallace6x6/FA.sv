// Full adder 
module FA_1(input logic a, b, c, output logic sum, carry);

assign sum = (a^b)^c;
assign carry = (a&b)|(b&c)|(c&a);

endmodule 
