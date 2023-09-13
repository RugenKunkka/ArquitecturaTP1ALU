`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2023 11:23:15 AM
// Design Name: 
// Module Name: topLevelAlu
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

`define dataLength 8
`define opLength 6

module topLevelAlu(
    //inputs
    input wire [`dataLength - 1 : 0] switch,
    input wire button1,//para A
    input wire button2,//para B
    input wire button3,//para OPCODE
    input wire clockCustom,
    
    output wire LED
    
    //para el clock
    //input wire resetGral
    );
    
    parameter dataLength=`dataLength;
    parameter opLength=`opLength;
    
    reg signed [dataLength-1 : 0] dataA = 0;
	reg signed [dataLength-1 : 0] dataB = 0;
	reg [opLength-1 : 0] OPCODE = 0;
	
	/*wire o_clockWizzard;
	wire o_locked;
	clk_wiz_0
	u_clk(
        // Clock out ports  
        .clk_out1(o_clockWizzard),
        // Status and control signals               
        .reset(resetGral), 
        .locked(o_locked),
        // Clock in ports
        .clk_in1(clockCustom)
	);*/
	
	
	
	ALU #(.p_dataLength(dataLength))
	u_alu(
		.i_A(dataA),
		.i_B(dataB),
		.i_ALUBitsControl(OPCODE),
		.o_ALUResult(LED)
		);
		
	
	
    //always @(posedge o_clockWizzard)
    always @(posedge clockCustom)
	begin
        if (button1 == 1'b1) begin//&& o_locked saco esto de todos los ifs else ifs
            dataA = switch;			
        end
        else if (button2 == 1'b1) begin
            dataB = switch;			
        end
        else if (button3 == 1'b1) begin
            OPCODE = switch;
        end
        else begin
            dataA = dataA;	
            dataB = dataB;
            OPCODE = OPCODE;
        end
	end
    
endmodule
