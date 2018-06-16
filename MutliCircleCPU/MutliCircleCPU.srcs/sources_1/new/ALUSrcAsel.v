`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/14 13:57:15
// Design Name: 
// Module Name: ALUSrcAsel
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


module ALUSrcAsel(
    input [31:0] A,
    input [4:0] sa,  
    input Sign,  
    output [31:0] selected);  
    
    assign selected = Sign? {{27{1'b0}}, sa} : A;
endmodule
