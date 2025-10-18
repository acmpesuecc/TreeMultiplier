`timescale 1ns / 1ps

module top_level_reduction_tb();
    logic [5:0]A,B;
    logic [11:0]P;
    top_level_reduction UUT(.A(A),.B(B),.P(P));
    
    initial
        begin
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);
            A=6'b101100;
            B=6'b101100;
            #10;assert (P==11'b00101011100) else $error("Failed");     
            A=6'b010101;
            B=6'b111111;
            #10;assert (P==11'b10101010101) else $error("Failed");    
            A=6'b101111;
            B=6'b000101;
            #10;assert (P==11'b00111010011) else $error("Failed");          
            A=6'b010110;
            B=6'b101110;
            #10;assert (P==11'b01001010100) else $error("Failed");          
            A=6'b000000;
            B=6'b101101;
            #10;assert (P==11'b00000000000) else $error("Failed");
            #10;
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);        
            $finish;          
        end          
endmodule
