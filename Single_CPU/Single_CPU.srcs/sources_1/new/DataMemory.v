`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/13 16:31:09
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(nRD, nWR, CLK, Datain, DAddr, DataOut);
    input nRD;
    input nWR;
    input CLK;
    input [31:0] Datain;
    input [31:0] DAddr;
    output reg [31:0] DataOut;
    reg [7:0] datamemory [0:63];
    
    initial begin
        DataOut = 0;
    end
    always @(negedge CLK) begin
        if(nWR) begin
            datamemory[DAddr + 3] = Datain[31:24];
            datamemory[DAddr + 2] = Datain[23:16];
            datamemory[DAddr + 1] = Datain[15:8];
            datamemory[DAddr] = Datain[7:0];
        end
        if(nRD) begin
            DataOut[31:24] = datamemory[DAddr + 3];
            DataOut[23:16] = datamemory[DAddr + 2];
            DataOut[15:8] = datamemory[DAddr + 1];
            DataOut[7:0] = datamemory[DAddr];
        end
    end
endmodule
