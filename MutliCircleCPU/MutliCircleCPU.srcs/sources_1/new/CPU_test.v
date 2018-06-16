`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/13 13:09:15
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


module CPU_test();
    reg CLK;
    reg Reset;
    
    wire [2:0] state_out;
    wire [5:0] opcode;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;   
    wire [31:0] ins;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire [31:0] pc0;
    wire [31:0] result;
    
    Top uut(
        .CLK(CLK),
        .Reset(Reset),
        .state_out(state_out),
        .opcode(opcode),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .ins(ins),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .pc0(pc0),
        .result(result)
    );
        
    initial begin
        CLK = 0;
        Reset = 0;
        CLK = ~CLK;
        #100;
            Reset = 1;
        forever #100 begin
            CLK = ~CLK;
        end
    end
endmodule
