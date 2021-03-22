module valueS(S, delta, max);
	input	[7:0] delta, max;
	
	output reg [6:0] S;
	
	always @(*) begin
		S = delta*100/max;
	end

endmodule
