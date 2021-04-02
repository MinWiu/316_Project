module Select_RGB( 
    output reg[31:0] S1,
    output reg[31:0] S2,
    output reg[31:0] corner,
    input  [31:0] Max,
    input  [31:0] R,
    input  [31:0] G,
    input  [31:0] B
);
    always @(*) begin
        case (Max)
            R : begin
                S1 = G;
                S2 = B;
                corner = 32'b0;
                end
            G : begin
                S1 = B;
                S2 = R;
                corner = 32'h42F00000;
                end
            B : begin
                S1 = R;
                S2 = G;
                corner = 32'h43700000;
                end
            default: begin
                S1 = 32'b0;
                S2 = 32'b0;
                corner = 32'b0;
                end
        endcase  
    end
endmodule