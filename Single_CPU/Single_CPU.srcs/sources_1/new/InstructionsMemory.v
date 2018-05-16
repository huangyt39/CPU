`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/12 22:23:17
// Design Name: 
// Module Name: InstructionsMemory
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


module InstructionsMemory(InsMemRW, IAddr, instruction);
    input InsMemRW;
    input [31:0] IAddr;
    output reg [31:0] instruction;
    reg [7:0] instructions [0:127];

    initial begin
        $readmemb("../../../instructions.mips", instructions);
        instruction = 0;
    end;
    always @(IAddr or InsMemRW) begin
        if(InsMemRW) begin
            instruction[31:24] = instructions[IAddr];
            instruction[23:16] = instructions[IAddr + 1];
            instruction[15:8] = instructions[IAddr + 2];
            instruction[7:0] = instructions[IAddr + 3];
        end
    end
endmodule
