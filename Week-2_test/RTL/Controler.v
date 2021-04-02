module Controler(
    output reg[14:0]    control_Tier1,
    output reg[25:0]  	control_Tier2,
    output [2:0]	State_o,
    input       	Ready,
    input       	Start,
    input       	reset,
    input       	Clk
);


    reg[2:0] State;
    reg[2:0] NextState;

    initial begin 
	State = 0 ;
    end

    always @(posedge Clk or negedge reset) begin
        if(reset == 0 ) 
            State = 3'b0;
        else
            State = NextState;
    end
    always @(*) begin
        case (State)
            0: begin
                NextState = 1;
                control_Tier1 = 15'b000000000000000;
            end
            1: begin
                NextState = 2;
                control_Tier1 = 15'b000000000000001;
                control_Tier2 = 26'b000_00_0101_00000_000110_000010;
                
            end
            2: begin
                NextState = 3;
                control_Tier1 = 15'b000000000000110;
                control_Tier2 = 26'b000_11_1010_00000_001001_010001;
            end
            3: begin
                NextState = 4;
                control_Tier1 = 15'b000000010101000;
                control_Tier2 = 26'b010_00_0000_00101_100000_100000;
            end
            4: begin
                NextState = 5;
                control_Tier1 = 15'b010001011110100;
		        control_Tier2 = 26'b001_00_0000_01010_010000_010001;
            end
            5: begin
                NextState = 6;
                control_Tier1 = 15'b001110100000010;
                control_Tier2 = 26'b100_00_0000_00000_000000_001110;
            end
	        6: begin
                NextState = 1;
                control_Tier1 = 15'b100000000000000;
                control_Tier2 = 26'b000_00_0000_10000_000000_110000;
            end
            default: begin
                control_Tier1 = 15'bz;
                control_Tier2 = 26'bz;
                NextState = 0;
            end

        endcase
    end
    assign State_o = State;
endmodule