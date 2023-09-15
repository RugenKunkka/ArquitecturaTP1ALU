`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 09:33:42 PM
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
module ALU
//parametros 
#(
  parameter p_dataLength =4//32
)
//campo
(
  input wire [p_dataLength-1:0] i_A,
  input wire [p_dataLength-1:0] i_B,
  input wire [3:0] i_ALUBitsControl,
  
  //debe ser un reg para almacenar y retener su valor entre ciclos de reloj.
  output reg [p_dataLength-1:0] o_ALUResult
  //output wire o_Zero
  //output wire o_Overflow
);

//si pusieramos @(*) bastaría xq el evento se emitiría para la modificación de cualquier entrada
  always @(i_ALUBitsControl,i_A,i_B) begin
    case (i_ALUBitsControl)
      4'b0001: o_ALUResult <= i_A + i_B;   // ADD suma
      4'b0010: o_ALUResult <= i_A - i_B;   // SUB resta
      4'b0011: o_ALUResult <= i_A & i_B;   // AND 
      4'b0101: o_ALUResult <= i_A | i_B;   // OR
      4'b0111: o_ALUResult <= i_A ^ i_B;   // XOR
      4'b1000: o_ALUResult <= (i_A >>> i_B);   // SRA (Shift Right Arithmetic)
      4'b1100: o_ALUResult <= (i_A >> i_B);    // SRL (Shift Right Logical)
      4'b1110: o_ALUResult <= ~(i_A | i_B);   // NOR
      //JAMAS OLVIDARES EL DEFAULT!!!!! si uno se lo olvida, el sintetizador hace cualquier cosa.. crea compuertas flipflops etc.. No queremos un comportamiento anómalo
      default: o_ALUResult <= {p_dataLength{1'b0}};
    endcase
  end

  //assign o_Zero = (o_ALUResult == {p_operatorsInputSize{1'b0}})?1'b1:1'b0;
  //assign Overflow = (i_A[31] & i_B[31] & ~o_ALUResult[31]) | (~i_A[31] & ~i_B[31] & o_ALUResult[31]);
endmodule

