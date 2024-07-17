// write RTL and TestBench for 4bit ripple carry adder using full adder
//ripple carry adder
module ripple_carry_adder(
	input [3:0] a,b,
	input cin,
	output [3:0] sum,
	output  carry
);
wire w1,w2,w3;

full_adder fa1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.carry(w1));
full_adder fa2(.a(a[1]),.b(b[1]),.cin(w1),.sum(sum[1]),.carry(w2));
full_adder fa3(.a(a[2]),.b(b[2]),.cin(w2),.sum(sum[2]),.carry(w3));
full_adder fa4(.a(a[3]),.b(b[3]),.cin(w3),.sum(sum[3]),.carry(carry));

endmodule

// full adder

module full_adder(
	input a,b,cin,
	output sum,carry
);

assign sum=a^b^cin;
assign carry=a&b;

endmodule

// Test bench

module ripple_carry_adder_tb();

reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

ripple_carry_adder DUT(a,b,cin,sum,cout);

initial 
begin

	a=4'b0000; b=4'b0000; cin=0;
	#10;
	
	a=4'b0001; b=4'b0001; cin=0;
	#10;

	a=4'b0010; b=4'b0010; cin=0;
	#10;

	a=4'b1111; b=4'b1111; cin=0;
	#10;


	a=4'b0000; b=4'b0000; cin=1;
	#10;
	
	a=4'b0001; b=4'b0001; cin=1;
	#10;

	a=4'b0010; b=4'b0010; cin=1;
	#10;

	a=4'b1111; b=4'b1111; cin=1;
	#10;

	 $finish;

end
endmodule
