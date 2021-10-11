module lab1_1(a,b,c,aluctr,d,e);
    input a,b,c;
    input [1:0] aluctr;
    output d,e;
    wire d;
    wire e;
    wire [1:0] tmp;
    wire [1:0] one;
    wire [1:0] two;
    wire[1:0] three;
    wire[1:0] four;
    first first_1(.out(one),.a(a),.b(b),.c(c));
    second second_1(.out(two),.a(a),.b(b));
    third third_1(.out(three),.a(a),.b(b));
    fourth fourth_1(.out(four),.a(a),.b(b));
    mux4_to_1 choose_1(.q_0(d),.a_i(one[0]),.b_i(two[0]),.c_i(three[0]),.d_i(four[0]),.sel_i(aluctr));
    mux4_to_1 choose_2(.q_0(e),.a_i(one[1]),.b_i(two[1]),.c_i(three[1]),.d_i(four[1]),.sel_i(aluctr));
endmodule
module mux4_to_1(q_0,a_i,b_i,c_i,d_i,sel_i);
    input a_i,b_i,c_i,d_i;
    input [1:0] sel_i;
    output q_0;
    reg q_0;
    always@(a_i or b_i or c_i or d_i or sel_i)
        begin
            case(sel_i)
                2'b00:q_0=a_i;
                2'b01:q_0=b_i;
                2'b10:q_0=c_i;
                2'b11:q_0=d_i; 
            endcase
        end
endmodule
module first(out,a,b,c);
    input a,b,c;
    output out;
    wire [1:0] out;
    //wire out;
    //assign {out[1],out[0]} = a+b+c;
    FA fulladder_1(.x(a),.y(b),.cin(c),.A(out[0]),.cout(out[1]));
endmodule
module second(out,a,b);
    input a,b;
    output [1:0]out;
    //wire out;
    wire and1;
    and and_1(out[0],a,b);
    assign out[1] = 1'b0;
endmodule
module third(out,a,b);
    input a,b;
    output [1:0] out;
    //wire out;
    wire or1,nor1;
    or tmp(or1,a,b);
    not nor_1(out[0],or1);
    assign out[1] = 1'b0;
endmodule
module fourth(out,a,b);
    input a,b;
    output [1:0] out;
    //wire out;
    myxor myxor_1(.out(out[0]),.a(a),.b(b));
    assign out[1] = 1'b0;
endmodule
module myxor(out,a,b);
    input a,b;
    output out;
    wire and1,and2;
    wire nota,notb;
    not not_1(nota,a);
    not not_2(notb,b);
    and and_1(and1,nota,b);
    and and_2(and2,notb,a);
    or or_1(out,and1,and2);
endmodule
module FA(input x,input y,input cin,output A, output cout);
wire  p,r,s;
	myxor myxor_1(.out(p),.a(x),.b(y));
	myxor myxor_2(.out(A),.a(p),.b(cin));
 
	and and_1(r,p,cin);
	and and_2(s,x,y);
	or or_1(cout,r,s);
 
endmodule