module valueV(V, max);
	input	[7:0] max;
	
	output reg [6:0] V;
	
	always @(*) begin
		V = max*100/255;
	end

endmodule
