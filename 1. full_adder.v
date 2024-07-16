// write RTL for 1bit full adder using dataflow abstraction
// full adder
module full_adder (
	input a_in,b_in,cin,
	output sum_out,carry_out
);

wire w1,w2,w3;

half_adder ha1(.a(a_in),.b(b_in),.sum(w1),.carry(w2));
half_adder ha2(.a(w1),.b(cin),.sum(sum_out),.carry(w3));

assign carry_out=w3|w2; 

endmodule

// half adder
module half_adder(
	input a,b,
	output sum,carry
);

assign sum=a^b;
assign carry=a|b;

endmodule 

// full adder test bench
module full_adder_tb();

reg a,b,cin;
wire sum,carry;

full_adder dut(a,b,cin,sum,carry);

integer i;

initial 
begin
a=0;
b=0;
cin=0;
end

initial 
begin
	for (i=0;i<8;i=i+1)
	begin
		{a,b,cin}=i;
		#10;
	end

end

initial 
$monitor("input a=%b,b=%b,cin=%b,output sum=%b,carry=%b", a,b,cin,sum,carry);

initial #100 $finish;

endmodule


