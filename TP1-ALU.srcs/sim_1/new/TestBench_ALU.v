`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2023 12:55:35 PM
// Design Name: 
// Module Name: TestBench_ALU
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


module TestBench_ALU;

//todos los input wire pasan a reg
  reg [7:0] i_A;
  reg [7:0] i_B;
  reg [5:0] i_ALUBitsControl;
  
//todos los output pasan a wire
  wire [7:0] o_ALUResult;
  wire o_Zero;

//instancio el módulo de la ALU
//uut= unit under test 
ALU #(
    .p_operatorsInputSize(8)
  ) 
  uut_ALU (
    .i_A(i_A),
    .i_B(i_B),
    .i_ALUBitsControl(i_ALUBitsControl),
    .o_ALUResult(o_ALUResult),
    .o_Zero(o_Zero)
  );

localparam ADD = 6'b100000;
localparam SUB = 6'b100010;
localparam AND = 6'b100100;
localparam OR  = 6'b100101;
localparam XOR = 6'b100110;
localparam SRA = 6'b000011;
localparam SRL = 6'b000010;
localparam NOR = 6'b100111;

  
initial
begin
    i_A = 8'd6;//decimal de 8 bits
    i_B = 8'd2;
    i_ALUBitsControl = ADD;//suma
    
    #500
    
    i_ALUBitsControl = SUB;

end

endmodule
