`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2023 15:53:01
// Design Name: 
// Module Name: main_decoder
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

module Main_Decoder(Op,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp);
    input [6:0]Op;          //Define opcode
    output RegWrite,ALUSrc,MemWrite,ResultSrc,Branch;   
    output [1:0]ImmSrc,ALUOp;

    assign RegWrite = (Op == 7'b0000011 | Op == 7'b0110011) ? 1'b1 : 1'b0 ; // R-Type or load operation
    assign ImmSrc = (Op == 7'b0100011) ? 2'b01 :            // I-Type
                    (Op == 7'b1100011) ? 2'b10 :            // B-Type
                                         2'b00 ;
    assign ALUSrc = (Op == 7'b0000011 | Op == 7'b0100011) ? 1'b1 :  // Load or store
                                                            1'b0 ;
    assign MemWrite = (Op == 7'b0100011) ? 1'b1 :       // Store operation
                                           1'b0 ;
    assign ResultSrc = (Op == 7'b0000011) ? 1'b1 :          // Load operation
                                            1'b0 ; 
    assign Branch = (Op == 7'b1100011) ? 1'b1 :             // Branch operation
                                         1'b0 ;
    assign ALUOp = (Op == 7'b0110011) ? 2'b10 :             // ALU operation
                   (Op == 7'b1100011) ? 2'b01 :
                                        2'b00 ;

endmodule
