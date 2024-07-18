// write the rtl and testbench for mux4x1 using mux2x1
// mux 4x1
module mux4x1(
	input [3:0] d,
	input [1:0] sel,
	output y
);

wire w1,w2;

mux2x1 mux1(.a(d[0]),.b(d[1]),.sel(sel[0]),.y(w1));
mux2x1 mux2(.a(d[2]),.b(d[3]),.sel(sel[0]),.y(w2));
mux2x1 mux3(.a(w1),.b(w2),.sel(sel[1]),.y(y));

endmodule
// mux2x1
module mux2x1(
	input a,b,
	input sel,
	output y
);

assign y=(sel)? b:a ;

endmodule 

// testbench
module mux4x1tb();
reg [3:0] d;
reg [1:0] sel;
wire y;

mux4x1 DUT(d,sel,y);

initial 
begin

	d=4'b1111; sel=2'b00;
	#10 ;

	d=4'b1001; sel=2'b01;
	#10 ;

	d=4'b1111; sel=2'b10;
	#10 ;
	
	d=4'b0110; sel=2'b11;
	#10 ;

	$finish;

end
endmodule
