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
    output [31:0] addr;
    assign addr = {PC4[31:28],ins[27:2],0,0};
endmodule
