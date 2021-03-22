module maxValueLocation(maxValue, maxLocation, R, G, B);

input	[7:0] R, G, B;

output reg [1:0] maxLocation;
output reg [7:0] maxValue;

always @ (*) begin
	if (R >= G && R >= B) begin
		maxValue = R;
		maxLocation = 2'b01;
	end else if (G >= R && G >= B) begin
		maxValue = G;
		maxLocation = 2'b10;
	end else begin
		maxValue = B;
		maxLocation = 2'b11;
	end
end

endmodule

