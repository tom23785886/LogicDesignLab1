module lab1_b2(a,b,c,aluctr,d,e);
    input [3:0] a,b;
    input [1:0] aluctr;
    input c;
    output [3:0] d;
    output e;
    wire tmp0,tmp1,tmp2;
    lab1_b1 labb10(.a(a[0]),.b(b[0]),.c(c),.aluctr(aluctr),.d(d[0]),.e(tmp0));
    lab1_b1 labb12(.a(a[1]),.b(b[1]),.c(tmp0),.aluctr(aluctr),.d(d[1]),.e(tmp1));
    lab1_b1 labb13(.a(a[2]),.b(b[2]),.c(tmp1),.aluctr(aluctr),.d(d[2]),.e(tmp2));
    lab1_b1 labb14(.a(a[3]),.b(b[3]),.c(tmp2),.aluctr(aluctr),.d(d[3]),.e(e));
endmodule
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