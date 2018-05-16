`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/13 14:55:10
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(opcode, zero, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMenRW, nRD, nWR, RegDst, ExtSel, PCSrc, ALUOp);
    input [5:0] opcode;
    input zero;
    output reg PCWre;
    output reg ALUSrcA;
    output reg ALUSrcB;
    output reg DBDataSrc;
    output reg RegWre;
    output reg InsMenRW;
    output reg nRD;
    output reg nWR;
    output reg RegDst;
    output reg ExtSel;
    output reg [1:0] PCSrc;
    output reg [2:0] ALUOp;
    initial begin
        PCWre = 1;
        ALUSrcA = 0;
        ALUSrcB = 0;
        DBDataSrc = 0;
        RegWre = 0;
        InsMenRW = 0;
        nRD = 0;
        nWR = 0;
        RegDst = 0;
        ExtSel = 0;
        PCSrc = 0;
        ALUOp = 0;
    end
    always @(opcode or zero) begin
        case(opcode)
            6'b000000:              //add
            begin
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 1;
                InsMenRW = 1;
                nRD = 0;
                nWR = 0;
                RegDst = 1;
                ExtSel = 0;
                PCSrc = 00;
                ALUOp = 000;
                end
            6'b000001:              //addi
             begin
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 1;
                DBDataSrc = 0;
                RegWre = 1;
                InsMenRW = 1;
                nRD = 0;
                nWR = 0;
                RegDst = 0;
                ExtSel = 1;                  
                PCSrc = 00;
                ALUOp = 000;
            end            
            6'b000010:              //sub
            begin
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 1;
                InsMenRW = 1;
                nRD = 0;
                nWR = 0;
                RegDst = 1;
                ExtSel = 1;
                PCSrc = 00;
                ALUOp = 001;
            end
            6'b010000:              //ori
            begin
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 1;
                DBDataSrc = 0;
                RegWre = 1;
                InsMenRW = 1;
                nRD = 0;
                nWR = 0;
                RegDst = 0;
                ExtSel = 0; 
                PCSrc = 00;
                ALUOp = 011;
            end
            6'b010001:              //and
            begin
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 1;
                InsMenRW = 1;
                nRD = 0;
                nWR = 0;
                RegDst = 1;
                ExtSel = 1; 
                PCSrc = 00;
                ALUOp = 100;
            end
            6'b010010:              //or
            begin
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 1;
                InsMenRW = 1;
                nRD = 0;
                nWR = 0;
                RegDst = 1;
                ExtSel = 1;  
                PCSrc = 00;
                ALUOp = 011;
            end
            6'b011000:              //sll
            begin
                PCWre = 1;
                ALUSrcA = 1;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 1;
                InsMenRW = 1;
                nRD = 0;
                nWR = 0;
                RegDst = 1;
                ExtSel = 1;
                PCSrc = 00;
                ALUOp = 010;
            end
            6'b011011:              //slti
            begin
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 1;
                DBDataSrc = 0;
                RegWre = 1;
                InsMenRW = 1;
                nRD = 0;
                nWR = 0;
                RegDst = 0;
                ExtSel = 1;  
                PCSrc = 00;
                ALUOp = 110;
            end
            6'b100110:              //sw
            begin
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 1;
                DBDataSrc = 0;
                RegWre = 0;
                InsMenRW = 1;
                nRD = 0;
                nWR = 1;
                RegDst = 0;
                ExtSel = 0; 
                PCSrc = 00;
                ALUOp = 000;
            end
            6'b100111:              //lw
            begin
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 1;
                DBDataSrc = 1;
                RegWre = 1;
                InsMenRW = 1;
                nRD = 1;
                nWR = 0;
                RegDst = 0;
                ExtSel = 0; 
                PCSrc = 00;
                ALUOp = 000;
            end
            6'b110000:              //beq
            begin
                if(zero) begin
                    PCSrc = 01;
                end else begin
                    PCSrc = 00;
                end
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 0;
                InsMenRW = 1;
                nRD = 0;
                nWR = 0;
                RegDst = 0;
                ExtSel = 0;  
                ALUOp = 001;
            end           
            6'b110001:              //bne
            begin
                if(zero) begin
                    PCSrc = 00;
                end else begin
                    PCSrc = 01;
                end
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 0;
                InsMenRW = 1;
                nRD = 0;
                nWR = 0;
                RegDst = 0;
                ExtSel = 0; 
                ALUOp = 001;
            end
            6'b111000:              //j
            begin
                PCWre = 1;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 0;
                InsMenRW = 1;
                nRD = 0;
                nWR = 0;
                RegDst = 0;
                ExtSel = 0;
                PCSrc = 10;
                ALUOp = 000;
            end
            6'b111111:              //halt
            begin
                PCWre = 01;
                ALUSrcA = 0;
                ALUSrcB = 0;
                DBDataSrc = 0;
                RegWre = 0;
                InsMenRW = 1;
                nRD = 0;
                nWR = 0;
                RegDst = 0;
                ExtSel = 0; 
                PCSrc = 00;
                ALUOp = 000;
            end
        endcase
    end            
endmodule
