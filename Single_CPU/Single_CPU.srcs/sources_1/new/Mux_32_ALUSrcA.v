`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/13 23:53:59
// Design Name: 
// Module Name: Mux_32_ALUSrcA
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


module Mux_32_ALUSrcA(signal, A, B, selected);
    input signal;
    input [31:0] A,B;
    output [31:0] selected;
    assign selected = (signal == 1'b0 ? A : B);
endmodule
