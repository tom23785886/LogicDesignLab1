module lab1_4(a,b,c,aluctr,d,e);
    input[3:0]a,b;
    input[1:0]aluctr;
    input c;
    output[3:0]d;
    output e;
    wire c1,c2,c3;
    lab1_2 alu0(.a(a[0]),.b(b[0]),.c(c),.aluctr(aluctr),.d(d[0]),.e(c1));
    lab1_2 alu1(.a(a[1]),.b(b[1]),.c(c1),.aluctr(aluctr),.d(d[1]),.e(c2));
    lab1_2 alu2(.a(a[2]),.b(b[2]),.c(c2),.aluctr(aluctr),.d(d[2]),.e(c3));
    lab1_2 alu3(.a(a[3]),.b(b[3]),.c(c3),.aluctr(aluctr),.d(d[3]),.e(e));
    
    
endmodule