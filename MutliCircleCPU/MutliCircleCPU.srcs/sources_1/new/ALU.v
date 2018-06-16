`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/13 12:54:31
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


module ALU(
    input [31:0] A, B, 
    input [2:0] ALUOp,  
    output wire zero,
    output reg sign,  
    output reg [31:0] result
    );  
       
     initial begin  
        result = 0;  
    end  
    
    assign zero = (result? 0 : 1);  
       
    always @(A or B or ALUOp) begin  
        case(ALUOp)  
            3'b000: result = A + B;  // A + B  
            3'b001: result = A - B;  // A - B  
            3'b010: begin
                    result = (A < B ? 1 : 0);  // 比较A与B  
                    sign = 0;
                    end
            3'b011:begin
                   result = (((A < B)&&(A[31] == B[31]))||
                    ((A[31] == 1 && B[31] == 0)))? 1: 0; // 比较AB 带符号 
                   sign = 1;
                   end
            3'b100: result = B << A; // B左移A位  
            3'b101: result = A | B; // 或  
            3'b110: result = A & B; // 与  
            3'b111: result = (~A & B) | (A & ~B); // 异或  
        default: result = 0;  
    endcase  
  end  
       
endmodule  
