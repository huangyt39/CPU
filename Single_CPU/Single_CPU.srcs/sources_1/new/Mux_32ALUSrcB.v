`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/13 23:56:00
// Design Name: 
// Module Name: Mux_32ALUSrcB
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

module Mux_32_ALUSrcB(signal, A, B, selected);
    input signal;
    input [31:0] A,B;
    output [31:0] selected;
    assign selected = (signal == 1'b0 ? A : B);
endmodule