`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/12 20:39:54
// Design Name: 
// Module Name: PC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PC(PCWre, CLK, Reset, in, out);
    input PCWre, CLK, Reset;
    input [31:0] in;
    output reg [31:0] out;

    always @(posedge CLK) begin
        if(Reset) begin
            out = 0;
        end else if(PCWre) begin
            out = in;
        end else if(!PCWre) begin
            out = out;
        end
    end
endmodule
