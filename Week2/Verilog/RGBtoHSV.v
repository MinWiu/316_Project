module RGBtoHSV(R, G, B, H, S, V, temp, maxLocation);

	input [7:0] R, G, B;
	
	output [13:0] temp;
	output [8:0] H;
	output [6:0] S, V;
	
	output [1:0] maxLocation;
	wire [8:0] Ht;
	wire [7:0] maxValue, minValue, delta;
	wire [6:0] St;
	
	maxValueLocation 	M(maxValue, maxLocation, 			R, G, B);
	minValue				m(minValue, 							R, G, B);
	
	deltaMaxMin			D(delta, 								maxValue, minValue);

	valueH				h(Ht, 									R, G, B, delta, maxValue, maxLocation, 				temp);
	valueS				s(St, 									delta, maxValue);
	valueV				v(V, 										maxValue);
	
	assign H = (delta==0)?0:Ht;
	assign S = (delta==0)?0:St;
	
endmodule
	
	
	