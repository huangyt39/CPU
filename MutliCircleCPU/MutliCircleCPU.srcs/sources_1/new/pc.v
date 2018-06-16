`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/10 14:47:46
// Design Name: 
// Module Name: pc
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


module PC(
    input CLK, Reset, PCWre,
    input [1:0] PCSrc,
    input wire [31:0] imm, addr, RDout1,
    output reg [31:0] Address
    );
    always @(PCWre or negedge Reset) begin
        if(Reset == 0) begin
           Address = 0;
        end else if (PCWre) begin
           if(PCSrc == 2'b00) begin
                Address = Address + 4;
           end else if (PCSrc == 2'b01) begin
                Address = imm*4 + Address + 4;
            end else if (PCSrc == 2'b10) begin
                Address = RDout1;
            end else if (PCSrc == 2'b11) begin
                Address = addr;
            end
        end
    end
endmodule
