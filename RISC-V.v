`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2023 21:47:09
// Design Name: 
// Module Name: RISC-V
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


module ALU #(parameter N=32) (A,B,Result,ALUControl,OverFlow,Carry,Zero,Negative);

    input [N-1:0]A,B;
    input [2:0]ALUControl;
    output Carry,OverFlow,Zero,Negative;
    output [N-1:0]Result;

    wire Cout;
    wire [N-1:0]Sum;

    assign Sum = (ALUControl[0] == 1'b0) ? (A + B) : (A + ((~B)+1)) ;  //for '0' sum and for '1' substraction
    assign {Cout,Result} = (ALUControl == 3'b000) ? Sum :           // For ALUControl 0 -> sum
                           (ALUControl == 3'b001) ? Sum :           // For ALUControl 1 -> difference
                           (ALUControl == 3'b010) ? A & B :         // For ALUControl 2 -> AND logic
                           (ALUControl == 3'b011) ? A | B :         // For ALUControl 3 -> OR logic
                           (ALUControl == 3'b101) ? {{N{1'b0}},(Sum[N-1])} :        //For future use
                           {(N+1){1'b0}};                                           //Set Cout and result to 0
    assign OverFlow = ((Sum[N-1] ^ A[N-1]) & (~(ALUControl[0] ^ B[N-1] ^ A[N-1])) & (~ALUControl[1]));  /* For overflow */
    assign Carry = ((~ALUControl[1]) & Cout);    //Carry or borrow flag
    assign Zero = &(~Result);           //Zero flag
    assign Negative = Result[N-1];      // Sign Flag

endmodule
