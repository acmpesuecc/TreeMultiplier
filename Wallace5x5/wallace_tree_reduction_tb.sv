module wallace_tree_reduction_tb();
            logic [4:0] A, B;
            logic [9:0] R1,R2;
    wallace_tree_reduction UUT(.A(A),.B(B),.P(P));
    
    initial
        begin
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);
            A=5'b10110;
            B=5'b10110;
            #10;assert ((R1==9'b001010100)&(R2==9'b001111001)) else $error("Failed");
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);     
            A=5'b01011;
            B=5'b11111;
            #10;assert ((R1==9'b111010100)&(R2==9'b001100101)) else $error("Failed");   
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);   
            A=5'b10111;
            B=5'b00101;
            #10;assert ((R1==9'b001110100)&(R2==9'b0010101001)) else $error("Failed");  
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);          
            A=5'b01010;
            B=5'b01110;
            #10;assert ((R1==9'b001010110)&(R2==9'b001100001)) else $error("Failed");  
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);          
            A=5'b00000;
            B=5'b10111;
            #10;assert ((R1==9'b000101111)&(R2==9'b000000001)) else $error("Failed");
            #10;
            $monitor($time,"A=%d,B=%d,P=%d",A,B,P);        
            $finish;          
        end    

endmodule      