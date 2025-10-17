`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 21:19:12
// Design Name: 
// Module Name: self_tb
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


module self_tb;
reg a, b, c;
wire sum, carry;
fa dut( a, b, c,sum, carry);
initial
begin
a=1'b0;b=1'b0;c=1'b0;
#10;assert (sum===1'b0&&carry==1'b0) else $error("000 failed");
#10 a=1'b1;b=1'b0;c=1'b0;
#10;assert (sum===1'b1&&carry==1'b0) else $error("100 failed");
#10 a=1'b1;b=1'b1;c=1'b1;
#10;assert (sum===1'b1&&carry==1'b1) else $error("111 failed");
#10 a=1'b1;b=1'b0;c=1'b1;
#10;assert (sum===1'b0&&carry==1'b0) else $error("101 failed");
end
endmodule
