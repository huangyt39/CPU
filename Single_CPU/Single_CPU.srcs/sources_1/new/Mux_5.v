`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/13 16:58:58
// Design Name: 
// Module Name: Mux_5
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


module Mux_5(
    input RegDst,
    input [4:0] A,
    input [4:0] B,
    output [4:0] selected
    );
    assign selected = (RegDst == 1'b0 ? A : B);
endmodule
