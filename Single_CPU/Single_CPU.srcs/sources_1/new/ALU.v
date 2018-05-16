`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/13 15:56:23
// Design Name: 
// Module Name: ALU
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


module ALU(ALUOp, numA, numB, zero, result);
    input [2:0] ALUOp;
    input [31:0] numA;
    input [31:0] numB;
    output zero;
    output reg [31:0] result;

    initial begin
        result = 0;
    end
    assign zero = result? 0 : 1;
    always @(numA or numB or ALUOp) begin
        case(ALUOp)
            3'b000: result = numA + numB;
            3'b001: result = numA - numB;
            3'b010: result = numB << numA;
            3'b011: result = numA | numB;
            3'b100: result = numA & numB;
            3'b101: result = (numA < numB)? 1 : 0;
            3'b110: result = (((numA<numB) && (numA[31] == numB[31])) ||(( numA[31] ==1 && numB[31] == 0))) ? 1:0;
            3'b111: result = numA ^ numB;
        endcase
    end
endmodule
