`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/13 16:45:09
// Design Name: 
// Module Name: signExtend
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


module signExtend(ExtSel,immediate_16, immediate_32);
    input ExtSel;
    input [15:0] immediate_16;
    output reg [31:0] immediate_32;

    initial begin
        immediate_32 = 0;
    end
    always @(immediate_16 or ExtSel) begin
        if(ExtSel) begin
            immediate_32 <= {{16{immediate_16[15]}}, immediate_16[15:0]};
        end
    end
endmodule
