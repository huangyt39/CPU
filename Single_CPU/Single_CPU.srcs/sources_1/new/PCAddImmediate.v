`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/12 21:39:00
// Design Name: 
// Module Name: PCAddImmediate
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


module PCAddImmediate(in, offset, out);
    input [31:0] in, offset;
    output [31:0] out;

    assign out = in + offset * 4;
endmodule
