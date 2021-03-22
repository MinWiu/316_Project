module deltaMaxMin(delta, max, min);
	input [7:0] max, min;
	
	output reg [7:0] delta;
	
	always @(*) begin
		delta = max - min;
	end
	
endmodule
