`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/10 15:13:52
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


module DataMemory(
    input [31:0] addr, Data2,  
    input nRD, nWR,  
    output reg [31:0] DataOut
    );                         
     reg [7:0] memory [0:63];  
     integer i;  
     initial begin  
         for (i = 0; i < 64; i = i+1) memory[i] <= 0;  
     end  
       
    always @(addr or Data2 or nRD or nWR) begin  
        if (nWR) begin // write data  
             memory[addr] = Data2[31:24];  
             memory[addr+1] = Data2[23:16];  
             memory[addr+2] = Data2[15:8];  
             memory[addr+3] = Data2[7:0];  
        end else if(nRD) begin // read data  
             DataOut[31:24] = memory[addr];  
             DataOut[23:16] = memory[addr+1];  
             DataOut[15:8] = memory[addr+2];  
             DataOut[7:0] = memory[addr+3];  
        end  
    end    
endmodule  
