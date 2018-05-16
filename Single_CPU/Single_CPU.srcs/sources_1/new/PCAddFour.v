`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/12 21:36:31
// Design Name: 
// Module Name: PCAddFour
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


module PCAddFour(in, out);
    input [31:0] in;
    output [31:0] out;
    
    assign out[31:0] = in[31:0] + 4;
endmodule
