module testbench();
    wire [31:0] H;
    wire [31:0] S;
    wire [31:0] V;
    wire [31:0] S1;
    wire [31:0] S2;
    wire [31:0] Corner;
    wire [31:0] Delta;
    wire [31:0] Max;
    wire [2:0]  State;
    reg  [31:0] R;
    reg  [31:0] G;
    reg  [31:0] B;
    reg         Clk;
    reg         reset;

    parameter t = 20;
    parameter Height = 100;
    parameter Weight = 100;
    parameter DIM = Height * Weight;
    reg [32*3-1:0] img [DIM-1:0];
    reg [32-1:0] img_out [DIM*3-1:0];

    initial begin
	$readmemb("RGBFP.txt",img); 
    end   
	
    integer i;
    integer j;
    initial begin
	Clk = 0;
	reset = 0;
	#(5*t)
	reset = 1;
	for(i=0;i<DIM+1;i=i+1) begin
		for(j=1;j<7;j=j+1)begin
			R = img[i][32*3-1:32*2];
			G = img[i][32*2-1:32*1];
			B = img[i][32*1-1:32*0];
			if(j == 3 && Clk == 1) 
				img_out[i] = S;
			if(j == 4 && Clk == 1)
				img_out[i+1] = V;
			if(j == 5 && Clk == 1)
				img_out[i+2] = H;
			#t;
		end
	end
	$writememh("HSV.txt", img_out);
	#t $finish;	
    end
    always #(t/2) Clk = ~Clk;
 
RGBtoHSV rbg_hsv(
     	H,
     	S,
     	V,
   	S1,
     	S2,
	Corner,
	Delta,
 	Max,
  	State,
 	R, 
	G,
    	B,
 	Clk,
    	reset
	);
endmodule
