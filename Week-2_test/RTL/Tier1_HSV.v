module Tier1_HSV(
    output [31:0] S1,
    output [31:0] S2,
    output [31:0] Corner,
    output [31:0] Delta_o,
    output [31:0] Max,
    input  [31:0] InR,
    input  [31:0] InG,
    input  [31:0] InB,
    input  [14:0] control_Tier1,
    input         Clk,
    input         reset
            
);
    // Input control FSM
    wire [4:0]  Wr          = control_Tier1[4:0];
    wire [2:0]  Com_selA    = control_Tier1[6:5];
    wire        Com_selB    = control_Tier1[7];
    wire        t1_sel      = control_Tier1[8];
    wire        t2_sel      = control_Tier1[9];
    wire [4:0]  ctr_out     = control_Tier1[14:10];
 //***State1***    
    reg[31:0]   R;
    reg[31:0]   G;
    reg[31:0]   B;

    always @( posedge Clk or negedge reset) begin
        if(reset == 0) begin
            R = 32'b0;
            G = 32'b0;
            B = 32'b0;
        end else if(Wr[0] == 1) begin
            R = InR;
            G = InG;
            B = InB;
        end
    end
    
    // 2xOutput in Compare_fp 
    wire[31:0]  compare_max;
    wire[31:0]  compare_min;
 
//***State 2-3-4-5***
    reg[31:0]   t1;
    reg[31:0]   t2;
    
    wire [31:0] delta;
    wire [31:0] t1_temp;
    wire [31:0] t2_temp; 


    
    always @(posedge Clk or negedge reset) begin
        if(reset == 0 )begin
            t1 = 32'b0;
            t2 = 32'b0;
        end else begin
            if(Wr[1])
                t1 = t1_temp;
            if(Wr[2])
                t2 = t2_temp;
        end 
    end

//***State3***
    reg[31:0]   t3;

    always @(posedge Clk or negedge reset) begin
        if(reset == 0 )begin
            t3 = 32'b0;
        end else if (Wr[3]) begin
            t3 = compare_max;
        end
    end
//***State4***
    reg [31:0]  t4;
    reg [31:0]  t5;
    reg [31:0]  t6;
    
    wire [31:0] t4_temp;
    wire [31:0] t5_temp;
    wire [31:0] t6_temp;
   

    always @(posedge Clk or negedge reset) begin
        if(reset == 0 )begin
            t4  = 32'b0;
            t5  = 32'b0;
            t6  = 32'b0;    
        end else if (Wr[4]) begin
            t4 = t4_temp;
            t5 = t5_temp;
            t6 = t6_temp;
        end
    end

    assign t1_temp = t1_sel ? delta         : compare_min;
    assign t2_temp = t2_sel ? compare_min   : compare_max;

    Select_RGB sel_rgb( 
                        .S1(t4_temp),
                        .S2(t5_temp),
                        .corner(t6_temp),
                        .Max(t3),
                        .R(R),
                        .G(G),
                        .B(B)
    );

     //Com_sel choose value into input func compare_fp 
    wire [31:0] AA;
    wire [31:0] BB;
    assign AA = Com_selA[1]  ? t1 :   (Com_selA[0] ? t2 : R) ;
    assign BB = Com_selB     ? B  :   G  ;

    Compare_fp compare_fp(
                        .Max(compare_max),
                        .Min(compare_min),
                        .A(AA),
                        .B(BB)
    );
// ***State 5***

    addSub delta1( 
                .o(delta), 
                .a(t3), 
                .b(t2), 
                .s(1'b1)
    );

    assign S1       = (ctr_out[0]) ? t4 : 32'bz;
    assign S2       = (ctr_out[1]) ? t5 : 32'bz;
    assign Corner   = (ctr_out[2]) ? t6 : 32'bz;
    assign Max      = (ctr_out[3]) ? t3 : 32'bz;
    assign Delta_o  = (ctr_out[4]) ? t1 : 32'bz;
endmodule
    





