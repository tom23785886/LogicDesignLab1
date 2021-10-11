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
