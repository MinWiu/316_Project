module div( o, a, b);

	input [31:0] a,b;
	output reg [31:0] o;
	
	wire [47:0] a1, b1;
	wire [47:0] o1;

	assign a1 = {1'b1,a[22:0],24'b0};
	assign b1 = {24'b0,1'b1,b[22:0]};
	assign o1 = a1/b1;
	
	

	always @(*)begin
		o[31] = a[31] ^ b[31];
			if (b[30:0]==0)
				o[31:0] = 32'hffffffff;
			else if(a[31:0]==0)
				o[31:0] = 0; 
			else if(b[22:0] == a[22:0]) begin 
				o[30:23] = a[30:23] + 8'd127 - b[30:23] ;
				o[22:0] = o1[22:0];
			end
			else if (a[22:0] > b[22:0]) begin 
				o[30:23] = a[30:23] + 8'd127 - b[30:23];
				o[22:0] = o1[23:1];
			end
			else begin
				o[30:23] = a[30:23] + 8'd127 - b[30:23]  - 8'd1;
				o[22:0] = o1[22:0];
			end
	end	
endmodule
