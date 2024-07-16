// write RTL for 2x4 decoder using dataflow abstraction

// decoder
module decoder(
	input [1:0] D,
	output reg [3:0] y
);

always @(D) 
begin
	y=0;
	case(D)
		2'b00: y[0]=1'b1;
		2'b01: y[1]=1'b1;
		2'b10: y[2]=1'b1;
		2'b11: y[3]=1'b1;
		
		default: y=0;
	endcase

end
endmodule

// test bench
module decoder(
	input [1:0] D,
	output reg [3:0] y
);

always @(D) 
begin
	y=0;
	case(D)
		2'b00: y[0]=1'b1;
		2'b01: y[1]=1'b1;
		2'b10: y[2]=1'b1;
		2'b11: y[3]=1'b1;
		
		default: y=0;
	endcase

end
endmodule
