module minValue(minValue, R, G, B);
	input	[7:0] R, G, B;

	output reg [7:0] minValue;

	always @ (*) begin
		if (R <= G && R <= B) begin
			minValue = R;
		end else if (G <= R && G <= B) begin
			minValue = G;
		end else begin
			minValue = B;
		end
	end
endmodule
