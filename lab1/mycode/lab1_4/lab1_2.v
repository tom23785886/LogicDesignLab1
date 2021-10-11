module lab1_2(a,b,c,aluctr,d,e);
    input a,b,c;
    input [1:0] aluctr;
    output d,e;
    assign {e,d}=(aluctr[1]==1'b0 && aluctr[0]==1'b0)? a+b+c:
            (aluctr[1]==1'b0 && aluctr[0]==1'b1)? {1'b0,a&b}:
            (aluctr[1]==1'b1 && aluctr[0]==1'b0)? {1'b0,!(a|b)}:
            {1'b0,a^b};
endmodule