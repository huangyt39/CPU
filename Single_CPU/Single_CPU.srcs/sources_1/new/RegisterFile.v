`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/13 23:15:25
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(RegWre, CLK, rs, rt, rd, in_data, ReadData1, ReadData2);
    input RegWre, CLK;
    input [4:0] rs, rt, rd;
    input [31:0] in_data;
    output [31:0] ReadData1, ReadData2;
    reg [31:0] register [0:31];
    
    initial begin
        register[0] = 0;
    end
    assign ReadData1 = register[rs];
    assign ReadData2 = register[rt];
    always @(posedge CLK) begin
        if((rd != 5'b00000) && (RegWre == 1)) begin
            register[rd] = in_data;
        end
    end
endmodule
