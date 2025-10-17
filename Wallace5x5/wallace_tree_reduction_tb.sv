module wallace_tree_reduction_tb;
module RCA_10bit(input logic [9:0] a,b,output logic [9:0] sum,output logic carry_out);
logic [9:0] carry;
assign carry[0]=1'b0;

// Explicit Adder Stages (replacing generate for loop)

// Stage 0
logic FA_s0, FA_c0;
assign FA_s0 = a[0]^b[0]^carry[0];
assign FA_c0 = (a[0]&b[0])|(b[0]&carry[0])|(a[0]&carry[0]);
assign sum[0] = FA_s0;
assign carry[1] = FA_c0;

// Stage 1
logic FA_s1, FA_c1;
assign FA_s1 = a[1]^b[1]^carry[1];
assign FA_c1 = (a[1]&b[1])|(b[1]&carry[1])|(a[1]&carry[1]);
assign sum[1] = FA_s1;
assign carry[2] = FA_c1;

// Stage 2
logic FA_s2, FA_c2;
assign FA_s2 = a[2]^b[2]^carry[2];
assign FA_c2 = (a[2]&b[2])|(b[2]&carry[2])|(a[2]&carry[2]);
assign sum[2] = FA_s2;
assign carry[3] = FA_c2;

// Stage 3
logic FA_s3, FA_c3;
assign FA_s3 = a[3]^b[3]^carry[3];
assign FA_c3 = (a[3]&b[3])|(b[3]&carry[3])|(a[3]&carry[3]);
assign sum[3] = FA_s3;
assign carry[4] = FA_c3;

// Stage 4
logic FA_s4, FA_c4;
assign FA_s4 = a[4]^b[4]^carry[4];
assign FA_c4 = (a[4]&b[4])|(b[4]&carry[4])|(a[4]&carry[4]);
assign sum[4] = FA_s4;
assign carry[5] = FA_c4;

// Stage 5
logic FA_s5, FA_c5;
assign FA_s5 = a[5]^b[5]^carry[5];
assign FA_c5 = (a[5]&b[5])|(b[5]&carry[5])|(a[5]&carry[5]);
assign sum[5] = FA_s5;
assign carry[6] = FA_c5;

// Stage 6
logic FA_s6, FA_c6;
assign FA_s6 = a[6]^b[6]^carry[6];
assign FA_c6 = (a[6]&b[6])|(b[6]&carry[6])|(a[6]&carry[6]);
assign sum[6] = FA_s6;
assign carry[7] = FA_c6;

// Stage 7
logic FA_s7, FA_c7;
assign FA_s7 = a[7]^b[7]^carry[7];
assign FA_c7 = (a[7]&b[7])|(b[7]&carry[7])|(a[7]&carry[7]);
assign sum[7] = FA_s7;
assign carry[8] = FA_c7;

// Stage 8
logic FA_s8, FA_c8;
assign FA_s8 = a[8]^b[8]^carry[8];
assign FA_c8 = (a[8]&b[8])|(b[8]&carry[8])|(a[8]&carry[8]);
assign sum[8] = FA_s8;
assign carry[9] = FA_c8;

// Stage 9 (Final Stage)
logic FA_s9, FA_c9;
assign FA_s9 = a[9]^b[9]^carry[9];
assign FA_c9 = (a[9]&b[9])|(b[9]&carry[9])|(a[9]&carry[9]);
assign sum[9] = FA_s9;
assign carry_out = FA_c9;

endmodule
logic [4:0] a_in,b_in;
logic [9:0] r1_out,r2_out;
logic [9:0] final_product;
logic final_cout;
logic [9:0] expected_product;
logic error_flag;
wallace_tree_reduction DUT(.a(a_in),.b(b_in),.r1(r1_out),.r2(r2_out));
RCA_10bit Final_Adder(.a(r1_out),.b(r2_out),.sum(final_product),.carry_out(final_cout));
initial begin
$display("------------------------------------------------------------------");
$display("5x5 Wallace Tree Multiplier Testbench Start");
$display("------------------------------------------------------------------");
error_flag=1'b0;
a_in=5'b00101;
b_in=5'b00011;
expected_product=10'd15;
#10;
check_result(5,3);
a_in=5'b11111;
b_in=5'b11111;
expected_product=10'd961;
#10;
check_result(31,31);
a_in=5'd10;
b_in=5'd20;
expected_product=10'd200;
#10;
check_result(10,20);
a_in=5'd1;
b_in=5'd0;
expected_product=10'd0;
#10;
check_result(1,0);
a_in=5'd30;
b_in=5'd25;
expected_product=10'd750;
#10;
check_result(30,25);
$display("------------------------------------------------------------------");
if(error_flag)
$display("TEST FAILED: One or more test cases did not pass.");
else
$display("TEST PASSED: All test cases verified successfully.");
$display("------------------------------------------------------------------");
end
task check_result(input integer A_val,input integer B_val);
$display("Test: %0d * %0d",A_val,B_val);
$display("A: %b | B: %b",a_in,b_in);
$display("R1 (Sum Row):    %b",r1_out);
$display("R2 (Carry Row):  %b",r2_out);
$display("Final Product (Decimal): %0d (Binary: %b)",final_product,final_product);
$display("Expected Product (Decimal): %0d",expected_product);
if(final_product==expected_product)begin
$display("Result: PASS\n");
end else begin
$display("Result: *** FAIL *** (Expected %0d, Got %0d)\n",expected_product,final_product);
error_flag=1'b1;
end
endtask
endmodule