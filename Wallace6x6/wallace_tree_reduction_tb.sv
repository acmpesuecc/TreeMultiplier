`timescale 1ns / 1ps

module wallace_tree_reduction_tb();
            logic [5:0] A, B;
            logic [11:0] R1,R2;
    wallace_tree_reduction UUT(.A(A),.B(B),.P(P));
    
    initial
        begin
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);
            A=6'b101110;
            B=6'b101110;
            #10;assert ((R1==11'b00101010100)&(R2==11'b00111011001)) else $error("Failed");
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);     
            A=6'b010101;
            B=6'b111111;
            #10;assert ((R1==11'b11101011100)&(R2==11'b00110100101)) else $error("Failed");   
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);   
            A=6'b101011;
            B=6'b001011;
            #10;assert ((R1==11'b00111010001)&(R2==11'b001010011001)) else $error("Failed");  
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);          
            A=6'b010110;
            B=6'b011110;
            #10;assert ((R1==11'b00101011010)&(R2==11'b00101100001)) else $error("Failed");  
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);          
            A=6'b000000;
            B=6'b110111;
            #10;assert ((R1==11'b11000101111)&(R2==11'b00000000001)) else $error("Failed");
            #10;
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);        
            $finish;          
        end    

endmodule      
