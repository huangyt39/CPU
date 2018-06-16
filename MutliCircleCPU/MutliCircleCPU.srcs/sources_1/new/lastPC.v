`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/16 22:08:11
// Design Name: 
// Module Name: lastPC
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


module lastPC(
    input CLK, Reset, PCWre, 
    input [31:0] pc,
    output reg [31:0] lastpc
    );  
    initial begin 
        lastpc = 0;
    end
    
    always @(posedge PCWre) begin
        if(lastpc != pc) begin
            lastpc = pc;
        end
    end
endmodule
