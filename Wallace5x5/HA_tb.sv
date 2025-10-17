`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 21:21:09
// Design Name: 
// Module Name: HA_tb
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


module HA_tb;
reg a,b;
wire sum, carry;
HA dut (a,b,carry,sum);
initial
begin
a=1'b0;b=1'b0;
#10;
assert (sum===1'b0&&carry===1'b0) else $error("00 failed");
a=1'b0;b=1'b1;
#10;
assert (sum===1'b1&&carry===1'b0) else $error("01 failed");
a=1'b1;b=1'b0;
#10;
assert (sum===1'b1&&carry===1'b0) else $error("10 failed");
a=1'b1;b=1'b1;
#10;
assert (sum===1'b0&&carry===1'b1) else $error("11 failed");
end
endmodule
