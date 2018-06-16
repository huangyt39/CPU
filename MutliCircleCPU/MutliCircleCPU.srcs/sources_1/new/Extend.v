`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/10 15:07:29
// Design Name: 
// Module Name: Extend
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


module Extend(
    input [15:0] in_num,
    input [1:0] ExtSel,
    output reg [31:0] out
    );
    always @(in_num or ExtSel) begin
        case(ExtSel)
            2'b00: out <= {{27{0}}, in_num[10:6]};
            2'b01: out <= {{16{0}}, in_num[15:0]};
            2'b10: out <= {{16{in_num[15]}}, in_num[15:0]};
            default: out <= {{16{in_num[15]}}, in_num[15:0]};
        endcase
    end
endmodule
