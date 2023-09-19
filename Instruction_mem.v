`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2023 18:10:35
// Design Name: 
// Module Name: Instruction_mem
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

module Instruction_Memory #(parameter reg_size=32,parameter num_reg=1024) (rst,A,RD);

  input rst;
  input [reg_size-1:0]A;
  output [reg_size-1:0]RD;

  reg [reg_size-1:0] mem [num_reg-1:0];
  
  assign RD = (~rst) ? {reg_size{1'b0}} : mem[A[reg_size-1:2]];

  initial begin
    $readmemh("memfile.hex",mem);
  end


/*
  initial begin
    //mem[0] = 32'hFFC4A303;
    //mem[1] = 32'h00832383;
    // mem[0] = 32'h0064A423;
    // mem[1] = 32'h00B62423;
    mem[0] = 32'h0062E233;
    // mem[1] = 32'h00B62423;

  end
*/
endmodule

