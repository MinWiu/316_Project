module Tier2_HSV(
    output [31:0]   H,
    output [31:0]   S,
    output [31:0]   V,
    input  [31:0]   S1,
    input  [31:0]   S2,
    input  [31:0]   Corner,
    input  [31:0]   Delta,
    input  [31:0]   Max,
    input  [25:0]   Control,
    input           Clk,
    input           reset
);


    wire [5:0]Wr         =  Control[5:0];
    wire [5:0]Sel        =  Control[11:6];
    wire [4:0]Sel_addsub =  Control[16:12];
    wire [3:0]Sel_div    =  Control[20:17];
    wire [1:0]Sel_mul    =  Control[22:21];
    wire [2:0]ctr_out    =  Control[25:23];


    wire [31:0] wire_mul;
    wire [31:0] wire_addsub;
    wire [31:0] wire_div;
//***State 1***//
    reg[31:0] t1;

    wire[31:0] t1_temp;

    always @(posedge Clk or negedge reset) begin
        if(reset == 0 )
            t1 = 32'b0;
        //Wr1 = 1
        else if(Wr[0] == 1)
            t1 = t1_temp;            
    end

//***State 2-4***//
    reg [31:0] t2;
    reg [31:0] t3;
    reg [31:0] t4;
    reg [31:0] t5;

    wire [31:0] t2_temp;
    wire [31:0] t3_temp;

    always @(posedge Clk or negedge reset) begin
        if(reset == 0)begin
            t2 = 32'b0;
            t3 = 32'b0;
            t4 = 32'b0;
            t5 = 32'b0;
        //write_en of t2 , t3
        end else begin
	    if (Wr[1] == 1 ) begin
            	t2 = t2_temp;
            	t3 = t3_temp;
        	//write_en of t4
            end 
	    if (Wr[2] == 1)
            	t4 = Corner;
        //write_en of t4
	    if (Wr[3] == 1) 
                t5 = wire_div;
	end
    end

//***State 3-5***//
    reg [31:0] t6;
    reg [31:0] t7;

    wire [31:0] t6_temp;
    wire [31:0] t7_temp;

    always @(posedge Clk or negedge reset) begin
        if(reset == 0 )begin
            t6 = 32'b0;
            t7 = 32'b0;
            //write_en of t6
        end else begin
	   if (Wr[4] == 1)
            	t6 = t6_temp;
            //write_en of t7
           if(Wr[5] == 1)
            	t7 = t7_temp;
	end 
    end

    assign t1_temp = (Sel[0]) ? wire_mul    : Max;
//***State 4***//
    assign t2_temp = (Sel[1]) ? wire_mul : S1;
    assign t3_temp = (Sel[2]) ? wire_div : S2;
//***State 5***//
    assign t6_temp = (Sel[4]) ? wire_addsub :(Sel[3] ? wire_div : wire_addsub);
//***State 6***// 
    assign t7_temp = (Sel[5]) ? wire_addsub : Delta;


///addSub//
    wire [31:0] addsub_a;
    wire [31:0] addsub_b;
    wire addsub_s ;

    assign addsub_a = Sel_addsub[1] ? t7 : (Sel_addsub[0] ? t6 : t2);
    assign addsub_b = Sel_addsub[3] ?  32'h43B40000 : (Sel_addsub[2] ? t4 : t3);
    assign addsub_s = Sel_addsub[4] ?   1'b1 : 1'b0;

    addSub addsub1( .o(wire_addsub), .a(addsub_a), .b(addsub_b), .s(addsub_s));

///div///
    wire [31:0] div_a;
    wire [31:0] div_b;

    assign div_a = Sel_div[1] ? t2 : (Sel_div[0] ? t7: t1);
    assign div_b = Sel_div[3] ? t7 : (Sel_div[2] ? t1: 32'h40233333);

    div div1( .o(wire_div), .a(div_a), .b(div_b));
///mul///
   
    wire[31:0] mul_a;
    wire[31:0] mul_b;

    assign mul_a = Sel_mul[0] ? t3              : t6;
    assign mul_b = Sel_mul[1] ? 32'h42C80000    : 32'h42700000;
 
    mul mul1(.Out(wire_mul), .InA(mul_a), .InB(mul_b));

    assign V = ctr_out[0] ? t5 : 32'bz;
    assign S = ctr_out[1] ? t1 : 32'bz;
    assign H = ctr_out[2] ?( (t7 == 32'hffffffff) ? 32'b0 : (t7[31] ? t6 : t7)) : 32'bz;

endmodule
