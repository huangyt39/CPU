`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/13 12:58:47
// Design Name: 
// Module Name: Top
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


module Top(
    input CLK, Reset,  
    output wire [2:0] state_out,  
    output wire [5:0] opcode,  
    output wire [4:0] rs, rt, rd,  
    // output ins[31:26], ins[25:21], ins[20:16], ins[15:11],  
    output wire [31:0] ins, ReadData1, ReadData2, pc0, result);  
             
    assign opcode = ins[31:26];  
    assign rs = ins[25:21];  
    assign rt = ins[20:16];  
    assign rd = ins[15:11];  
  
    // 数据通路  
    wire [31:0] j_addr, out1, out2, result1, i_IR, extendData, LateOut1, LateOut2, DataOut, selectedA, selectedB, lastpc0;  
    wire zero, sign;        
    // 控制信号  
    wire [2:0] ALUOp;  
    wire [1:0] RegDst, PCSrc;  
    wire PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, WrRegDSrc, InsMemRW, nRD, nWR, IRWre, ExtSel;

     PC pc(CLK, Reset, PCWre, PCSrc, extendData, j_addr, ReadData1, pc0);  
     lastPC lastpc(CLK, Reset, PCWre, pc0, lastpc0);
     InsMemory insmemory(pc0, InsMemRW, IRWre, CLK, ins);       
     PCAddr pcaddr(ins[25:0], pc0, j_addr);    
     RegFile regfile(ins[25:21], ins[20:16], ins[15:11], CLK, RegWre, WrRegDSrc, RegDst, (pc0+4), LateOut2, lastpc0, ReadData1, ReadData2);  
     DataLate ADR(selectedA, CLK, out1);  
     DataLate BDR(selectedB, CLK, out2);       
     Extend extend(ins[15:0], ExtSel, extendData);        
     ALU alu(out1, out2, ALUOp, zero, sign, result);
     ALUSrcAsel ALUSrcAsel(ReadData1, ins[10:6], ALUSrcA, selectedA);
     DataSelect_2 ALUSrcBsel(ReadData2, extendData, ALUSrcB, selectedB);   
     DataLate ALUoutDR(result, CLK, result1);        
     DataMemory datamemory(result1, out2, nRD, nWR, DataOut);    
     DataSelect_2 dataselect_2(result, DataOut, DBDataSrc, LateOut1);  
     DataLatepos BDDR(LateOut1, CLK, LateOut2);  
     controlUnit control(ins[31:26], zero, sign, CLK, Reset, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, WrRegDSrc, InsMemRW, nRD, nWR, IRWre, ExtSel, PCSrc,RegDst, ALUOp, state_out);    
endmodule  
