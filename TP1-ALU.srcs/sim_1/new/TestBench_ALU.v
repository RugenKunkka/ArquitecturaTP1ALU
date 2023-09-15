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


`define dataLength 4
`define opLength 4

module TestBench_ALU;

 parameter dataLength=`dataLength;
  parameter opLength=`opLength;
//todos los input wire pasan a reg
  reg [dataLength-1:0] i_A;
  reg [dataLength-1:0] i_B;
  reg [opLength-1:0] i_ALUBitsControl;
  
//todos los output pasan a wire
  wire [dataLength-1:0] o_ALUResult;

//instancio el módulo de la ALU
//uut= unit under test 
ALU #(
    .p_operatorsInputSize(8)
  ) 
  uut_ALU (
    .i_A(i_A),
    .i_B(i_B),
    .i_ALUBitsControl(i_ALUBitsControl),
    .o_ALUResult(o_ALUResult)
  );

/*localparam ADD = 6'b100000;
localparam SUB = 6'b100010;
localparam AND = 6'b100100;
localparam OR  = 6'b100101;
localparam XOR = 6'b100110;
localparam SRA = 6'b000011;
localparam SRL = 6'b000010;
localparam NOR = 6'b100111;*/

localparam ADD = 4'b0001;
localparam SUB = 4'b0010;
localparam AND = 4'b0011;
localparam OR  = 4'b0101;
localparam XOR = 4'b0111;
localparam SRA = 4'b1000;
localparam SRL = 4'b1100;
localparam NOR = 4'b1110;

  
initial
begin
    i_A = 4'd6;//decimal de 8 bits
    i_B = 4'd2;
    i_ALUBitsControl = ADD;//suma
    
    #500
    
    i_ALUBitsControl = SUB;

end

endmodule
