`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/13 00:18:00
// Design Name: 
// Module Name: controlUnit
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


module controlUnit(
    input [5:0] opcode,   
    input zero, sign , CLK, Reset,  
    output reg PCWre, ALUSrcA, ALUSrcB, DBDataSrc, RegWre, WrRegDSrc, InsMemRW, nRD, nWR, IRWre, ExtSel,
    output reg [1:0] PCSrc, RegDst,
    output reg [2:0] ALUOp, state_out
    ); 
     
    parameter [2:0] sif = 3'b000,   // sIF state  
                      sid = 3'b001,   // sID state  
                      sexe = 3'b010,  // add、sub、addl、or、and、ori、sltiu、slt、sll、beq、bltz、sw、lw
                      smem = 3'b100,  // sw、lw
                      swb = 3'b011;   // add、sub、addi、or、and、ori、sltiu、slt、sll、lw
                            
     parameter [5:0] add = 6'b000000,  
                       sub = 6'b000001,
                       addi = 6'b000010,
                       Or = 6'b010000,
                       And = 6'b010001,
                       ori = 6'b010010,
                       sll = 6'b011000,
                       slt = 6'b100110,
                       sltiu = 6'b100111,
                       sw = 6'b110000,
                       lw = 6'b110001,
                       beq = 6'b110100,
                       bltz = 6'b110110,
                       j = 6'b111000,
                       jr = 6'b111001,
                       jal = 6'b111010,
                       halt = 6'b111111;        
                                   
     reg [2:0] state, next_state;  
      
    initial begin  
        PCWre = 0;
        ALUSrcA = 0;
        ALUSrcB = 0;
        DBDataSrc = 0;
        RegWre = 0;
        WrRegDSrc = 0;
        InsMemRW = 0;
        nRD = 0;
        nWR = 0;
        IRWre = 0;
        ExtSel = 0;
        PCSrc = 2'b00;
        RegDst = 2'b00;
        ALUOp = 3'b000;  
        state = sif;  
        state_out = state;  
    end  
      
    always @(posedge CLK) begin  
         if (Reset == 0) begin  
              state <= sif;  
          end else begin  
              state <= next_state;  
          end  
          state_out = state;  
     end  
      
    always @(state or opcode) begin  
        case(state)  
            sif: next_state = sid;  
            sid: begin  
                    case (opcode[5:3])  
                        3'b111: next_state = sif; // j, jal, jr, halt
                        default: next_state = sexe; // add、sub、addl、or、and、ori、sltiu、slt、sll、beq、bltz、sw、lw 
                    endcase  
                 end  
            sexe: begin
                    case (opcode[5:2])
                        4'b1100: next_state = smem; //sw、lw
                        4'b1101: next_state = sif; //beq、bltz
                        default : next_state = swb; // add、sub、addi、or、and、ori、sltiu、slt、sll
                    endcase
                  end   
            smem: begin  
                    if (opcode == 6'b110001) next_state = swb; // lw指令  
                    else next_state = sif; // sw指令  
                 end  
            swb: next_state = sif;
            default: next_state = sif;  
        endcase  
    end  
           
    always @(state) begin  
      
        // 确定PCWre的值  
        if (state == sif && opcode != halt) PCWre = 1;  
        else PCWre = 0;  
            
        //确定ALUSrcA的值
        if(opcode == sll) ALUSrcA = 1;
        else ALUSrcA = 0;
                
        // 确定ALUSrcB的值  
        if (opcode == addi || opcode == ori || opcode == sltiu || opcode == sw || opcode == lw) ALUSrcB = 1;  
        else ALUSrcB = 0;  
            
        //确定DBDataSrc的值
        if(opcode == lw) DBDataSrc = 1;
        else DBDataSrc = 0;    
        
        // 确定RegWre的值  
        if (state == swb || opcode == jal) RegWre = 1;  
        else RegWre = 0;  
        
        // 确定WrRegDsrc的值  
        if (state == swb) WrRegDSrc = 1;  
        else WrRegDSrc = 0;    
        
        // 确定InsMemRW的值  
        InsMemRW = 1;  
        
        // 确定nWR的值  
        if (state == smem && opcode == sw)  nWR = 1;  
        else nWR = 0;  
                 
        //确定nRD的值
        if(opcode == lw) nRD = 1;
        else nRD = 0;
        
        // 确定IRWre的值  
        if (state == sif) IRWre = 1;  
        else IRWre = 0;  

        // 确定ExtSel的值  
        if (opcode == ori) ExtSel = 2'b01;  
        else if (opcode == sll) ExtSel = 2'b00;  
        else ExtSel = 2'b10;  
        
        // 确定PCSrc的值  
        case(opcode)  
            j: PCSrc = 2'b11;  
            jal: PCSrc = 2'b11;  
            jr: PCSrc = 2'b10;  
            beq: begin  
                if (zero) PCSrc = 2'b01;  
                else PCSrc = 2'b00;  
            end  
            bltz: begin
                if(zero || !sign) PCSrc = 2'b00;
                else if(!zero && sign) PCSrc = 2'b01;
            end
            default: PCSrc = 2'b00;  
        endcase  
        
        // 确定RegDst的值  
        if (opcode == jal) RegDst = 2'b00;  
        else if (opcode == addi || opcode == ori || opcode == lw || opcode == sltiu) RegDst = 2'b01;  
        else RegDst = 2'b10;  
          
        // 确定ALUOp的值  
        case(opcode)  
            add: ALUOp = 3'b000;
            sub: ALUOp = 3'b001;  
            addi: ALUOp = 3'b000;
            Or: ALUOp = 3'b101;  
            And: ALUOp = 3'b110;  
            ori: ALUOp = 3'b101;  
            slt: ALUOp = 3'b011;
            sltiu: ALUOp = 3'b010;  
            sll: ALUOp = 3'b100;  
            beq: ALUOp = 3'b001;  
            default: ALUOp = 3'b000;  
        endcase  
          
          // 防止在IF阶段写数据  
        if (state == sif) begin  
            RegWre = 0;  
            nWR = 0;  
        end  
    end  
      
       
endmodule  
