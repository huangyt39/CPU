`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/14 00:46:41
// Design Name: 
// Module Name: ImmediateExtend
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


module ImmediateExtend(PC4, ins, addr);
    input [31:0] PC4;
    input [31:0] ins;
    output reg [31:0] addr;
    always @(PC4 or ins) begin
        addr[31:28] = PC4[31:28];
        addr[27:2] = ins[25:0];
        addr[1:0] = 00;
    end
endmodule
