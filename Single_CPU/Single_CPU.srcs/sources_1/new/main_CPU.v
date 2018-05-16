`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/14 13:18:06
// Design Name: 
// Module Name: main_CPU
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


module main_CPU(CLK, Reset, currentInstruction, nextInstructionAddr, opcode, pcSrc, 
    writeData, readData1, readData2, Immediate_32, 
    aluOp, aluResult, Zero, dataOut, nRD, nWR);
    input CLK, Reset;
    output [31:0] currentInstruction, nextInstructionAddr, writeData, readData1, readData2, 
            Immediate_32, aluResult, dataOut;
    output [5:0] opcode;
    output [2:0] aluOp;
    output Zero, pcSrc;
    output nRD, nWR;
    wire [31:0] in_pc, out_pc;
    wire [31:0] out_pc_InstructionsMemory, out_pc_AddFour, out_pc_AddImmediate;
    wire [31:0] ALUResult, WriteData, ReadData1, ReadData2, immediate_32, DataOut;
    wire [2:0] ALUOp;
    wire zero, PCWre,ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW, DataMemRW, ExtSel, RegOut, nRD, nWR, RegDst;
    wire [1:0] PCSrc;
    wire [4:0] Mux_5_selected;
    wire [31:0] Mux_32_selectedA, Mux_32_selectedB;
    wire [31:0] pcImmediateExtend;
    
    assign currentInstruction = out_pc_InstructionsMemory;
        assign nextInstructionAddr = in_pc;
        assign opcode = out_pc_InstructionsMemory[31:26];
        assign pcSrc = PCSrc;
        assign writeData = WriteData;
        assign readData1 = ReadData1;
        assign readData2 = ReadData2;
        assign Immediate_32 = immediate_32;
        assign aluOp = ALUOp;
        assign aluResult = ALUResult;
        assign Zero = zero;
        assign dataOut = DataOut;
              
        PC pc(PCWre, CLK, Reset, in_pc, out_pc);
        PCAddFour pcAddFour(out_pc, out_pc_AddFour);
        PCAddImmediate pcAddImmediate(out_pc_AddFour, immediate_32, out_pc_AddImmediate);
        InstructionsMemory InstructionsMemory(InsMemRW, out_pc, out_pc_InstructionsMemory);
        ControlUnit ControlUnit(out_pc_InstructionsMemory[31:26], zero, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, InsMemRW,
                                nRD, nWR, RegDst, ExtSel, PCSrc, ALUOp);
        RegisterFile RegisterFile(RegWre, CLK, out_pc_InstructionsMemory[25:21], out_pc_InstructionsMemory[20:16],
                     Mux_5_selected, WriteData, ReadData1, ReadData2);
        ALU ALU(ALUOp, Mux_32_selectedA, Mux_32_selectedB, zero, ALUResult);
        DataMemory DataMemory(nRD, nWR, CLK, ALUResult, ReadData2, DataOut);
        signExtend signExtend(ExtSel, out_pc_InstructionsMemory[15:0], immediate_32);
        Mux_5 Mux_5(RegDst, out_pc_InstructionsMemory[20:16], out_pc_InstructionsMemory[15:11], Mux_5_selected);
        Mux_32_ALUSrcA Mux_32_ALUSrcA(ALUSrcA, ReadData1,{{27{0}} ,out_pc_InstructionsMemory[5:0]}, Mux_32_selectedA);
        Mux_32_ALUSrcB Mux_32_ALUSrcB(ALUSrcB, ReadData2, immediate_32, Mux_32_selectedB);
        Mux_32_ALUM2Reg Mux_32_ALUM2Reg(DBDataSrc, ALUResult, DataOut, WriteData);
        Mux_32_PCSrc Mux_32_PCSrc(PCSrc, out_pc_AddFour, out_pc_AddImmediate, pcImmediateExtend, in_pc);
        ImmediateExtend ImmediateExtend(out_pc_AddFour, out_pc_InstructionsMemory, pcImmediateExtend);
        
endmodule
