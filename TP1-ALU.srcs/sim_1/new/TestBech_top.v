`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 10:02:07 PM
// Design Name: 
// Module Name: TestBech_top
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

module TestBech_top;
  parameter dataLength=`dataLength;
  parameter opLength=`opLength;
//todos los input wire pasan a reg
  reg [dataLength-1:0] i_topTb_switch=0;
  reg i_topTb_button1=0;
  reg i_topTb_button2=0;
  reg i_topTb_button3=0;
  reg i_topTb_clock=0;
  reg i_topTb_reset=0;
  
  wire [dataLength-1:0] o_topTb_LED;


//instancio el módulo de la ALU
//uut= unit under test 
topLevelAlu #(
    .p_operatorsInputSize(8)
  ) 
  u_topLevelAlu (
    .switch(i_topTb_switch),
    .button1(i_topTb_button1),
    .button2(i_topTb_button2),
    .button3(i_topTb_button3),
    .clockCustom(i_topTb_clock),
    .resetGral(i_topTb_reset),
    .LED(o_topTb_LED)
  );

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
#100
//suma 1+1
    //i_topTb_switch = dataLength'd1;
    i_topTb_switch = 4'd1;
    i_topTb_button1= 1'b1;
    #60
    i_topTb_button1= 1'b0;
    #60
    //------------
    i_topTb_switch = 4'd1;
    i_topTb_button2= 1'b1;
    #60
    i_topTb_button2= 1'b0;
    #60
    //------------
    i_topTb_switch = ADD;
    i_topTb_button3= 1'b1;
    #60
    i_topTb_button3= 1'b0;

#300
//resta 1-1
    //------------
    i_topTb_switch = SUB;
    i_topTb_button3= 1'b1;
    #60
    i_topTb_button3= 1'b0;

/*
#500
    i_topTb_reset=1;
#500
    i_topTb_reset=0;
*/

end
    always 
	#5 i_topTb_clock = ~i_topTb_clock;

endmodule
