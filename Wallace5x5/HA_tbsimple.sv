`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2025 21:31:29
// Design Name: 
// Module Name: HA_tbsimple
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


module HA_tbsimple;
reg a,b;
wire sum, carry;
HA dut (a,b,carry,sum);
initial
begin
a=1'b0;b=1'b0;
#10;
a=1'b0;b=1'b1;
#10;
a=1'b1;b=1'b0;
#10;
a=1'b1;b=1'b1;
end
endmodule
