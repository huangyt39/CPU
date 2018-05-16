`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/14 00:00:56
// Design Name: 
// Module Name: Mux_32_PCSrc
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


module Mux_32_PCSrc(signal, A, B, C, selected);
    input [1:0] signal;
    input [31:0] A, B, C;
    output reg [31:0] selected;
    
    always @(signal or A or B or C) begin
        case(signal)
            2'b00: selected = A;
            2'b01: selected = B;
            2'b10: selected = C;
        endcase
    end
endmodule
