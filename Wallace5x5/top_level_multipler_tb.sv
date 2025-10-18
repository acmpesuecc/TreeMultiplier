`timescale 1ns / 1ps

module top_level_reduction_tb();
    logic [4:0]A,B;
    logic [9:0]P;
    top_level_reduction UUT(.A(A),.B(B),.P(P));
    
    initial
        begin
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);
            A=5'b10110;
            B=5'b10110;
            #10;assert (P==9'001010100) else $error("Failed");     
            A=5'b01011;
            B=5'b11111;
            #10;assert (P==9'b101010101) else $error("Failed");    
            A=5'b10111;
            B=5'b00101;
            #10;assert (P==9'b001110011) else $error("Failed");          
            A=5'b01010;
            B=5'b01110;
            #10;assert (P==9'b010001100) else $error("Failed");          
            A=5'b00000;
            B=5'b10111;
            #10;assert (P==9'b000000000) else $error("Failed");
            #10;
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);        
            $finish;          
        end          
endmodule
