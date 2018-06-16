`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/15 20:10:43
// Design Name: 
// Module Name: DataLatepos
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


module DataLatepos(
    input [31:0] i_data,  
    input CLK,  
    output reg [31:0] o_data
    );  
  
    always @(posedge CLK) begin  
        o_data = i_data;  
    end  
endmodule
