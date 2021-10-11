module lab1_b1(a,b,c,aluctr,d,e);
    input a,b,c;
    input [1:0] aluctr;
    output d,e;
    reg d;
    reg e;
    wire tmp;
    always@(*) 
        begin
            if(aluctr[1]==1'b0 && aluctr[0]==1'b0) 
                begin 
                    {e,d}=a+b+c;

                end
            else if(aluctr[1]==1'b0 && aluctr[0]==1'b1)
                begin
                    d=a&b;
                    e=1'b0;

                end
            else if(aluctr[1]==1'b1 && aluctr[0]==1'b0)
                begin
                    d=1'b0;
                    if(a>b) e=1'b1;
                        else if(a<b) e=1'b0;
                    else
                        begin
                            if(c==1'b0) e=1'b0;
                            else e=1'b1;
                        end
                                    
                end
            else if(aluctr[1]==1'b1 && aluctr[0]==1'b1)
                begin
                    d=a^b;
                    e=1'b0;
                end
        end
endmodule