module RGBtoHSV(
    output [31:0] H,
    output [31:0] S,
    output [31:0] V,
    output [31:0] S1,
    output [31:0] S2,
    output [31:0] Corner,
    output [31:0] Delta,
    output [31:0] Max,
    output [2:0]  State,
    input  [31:0] R,
    input  [31:0] G,
    input  [31:0] B,
    input         Clk,
    input         reset
);


   wire[14:0] Control1;
   wire[25:0] Control2;
   wire[31:0] Delta_t;
   wire[31:0] S1_t;
   wire[31:0] S2_t;
   wire[31:0] Corner_t;
   wire[31:0] Max_t;

   Tier1_HSV tier1(
	.S1(S1_t),
     	.S2(S2_t),
     	.Corner(Corner_t),
    	.Delta_o(Delta_t),
    	.Max(Max_t),
    	.InR(R),
   	.InG(G),
    	.InB(B),
	.control_Tier1(Control1),
    	.Clk(Clk),
   	.reset(reset)         
    );
    assign S1     = S1_t;
    assign S2     = S2_t;
    assign Corner = Corner_t;
    assign Delta  = Delta_t;
    assign Max    = Max_t; 


    Tier2_HSV tier2(
      	.H(H),
     	.S(S),
      	.V(V),
  	.S1(S1_t),
   	.S2(S2_t),
   	.Corner(Corner_t),
    	.Delta(Delta_t),
    	.Max(Max_t),
    	.Control(Control2),
    	.Clk(~Clk),
    	.reset(reset)
    );


    Controler ctr(
   	.control_Tier1(Control1),
	.control_Tier2(Control2),
	.State_o(State),
   	.Ready(),
    	.Start(Start),
    	.reset(reset),
  	.Clk(Clk)
    );

endmodule
