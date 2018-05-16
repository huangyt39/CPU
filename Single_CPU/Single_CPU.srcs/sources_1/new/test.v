`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/14 20:53:54
// Design Name: 
// Module Name: test
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


module test();
    reg CLK;
    reg Reset;
    
    wire [31:0] currentInstruction;
    wire [31:0] nextInstructionAddr;
    wire [5:0] opcode;
    wire pcSrc;
    wire [31:0] writeData;
    wire [31:0] readData1;
    wire [31:0] readData2;
    wire [31:0] Immediate_32;
    wire [2:0] aluOp;
    wire [31:0] aluResult;
    wire Zero;
    wire [31:0] dataOut;
    wire nRD;
    wire nWR;
    main_CPU uut(
        .CLK(CLK),
        .Reset(Reset),
        .currentInstruction(currentInstruction),
        .nextInstructionAddr(nextInstructionAddr),
        .opcode(opcode),
        .pcSrc(pcSrc),
        .writeData(writeData),
        .readData1(readData1),
        .readData2(readData2),
        .Immediate_32(Immediate_32),
        .aluOp(aluOp),
        .aluResult(aluResult),
        .Zero(Zero),
        .dataOut(dataOut)
    );
    initial begin
        CLK = 0;
        Reset = 1;
        #50;
            CLK = ~CLK;
        #50;// 初始设置pc为0
            Reset = 0;
        forever #50 begin // 周期为100ns
            CLK = ~CLK;
        end
    end
endmodule

