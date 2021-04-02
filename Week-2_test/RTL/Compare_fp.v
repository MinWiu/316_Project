module	Compare_fp(Max,Min, A, B);

	input [31:0]	A, B;
	output reg [31:0] Max,Min;
	
	wire sign;
	
	assign sign = A[31] ^ B[31];
	
	always @ (*) begin
		if (sign) begin
			if (A[31] == 1) begin
				Max = B;
                		Min = A;
            		end
			else begin
               			Min = B;
				Max = A;
            		end
		end else begin
			if (A[31]==1) begin
				if (A[30:0]>B[30:0])begin
                   			Max = B;
                    			Min = A;
               		 	end
				else begin
					Max = A;
                    			Min = B;
                		end
			end else begin
				if (A[30:0]>B[30:0])begin
					Max = A;
                    			Min = B;
                		end
				else begin
					Max = B;
                    			Min = A;
                		end
			end
		end
	end
	
endmodule
