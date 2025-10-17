`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 21:25:48
// Design Name: 
// Module Name: simple_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module simple_tb;
reg a, b, c;
wire sum, carry;
fa dut( a, b, c,sum, carry);
initial
begin
a=1'b0;b=1'b0;c=1'b0;
#100 a=1'b0;b=1'b0;c=1'b1;
#100 a=1'b0;b=1'b1;c=1'b0;
#100 a=1'b1;b=1'b0;c=1'b1;
#100 a=1'b1;b=1'b0;c=1'b0;
#100 a=1'b1;b=1'b1;c=1'b1;
#100 a=1'b1;b=1'b1;c=1'b0;
end
endmodule
