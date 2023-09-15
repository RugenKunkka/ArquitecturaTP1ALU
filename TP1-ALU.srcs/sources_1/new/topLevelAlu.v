`timescale 1ns / 1ps

`define dataLength 4
`define opLength 4

module topLevelAlu(
    //inputs
    input wire [`dataLength - 1 : 0] switch,
    input wire button1,//para A
    input wire button2,//para B
    input wire button3,//para OPCODE
    input wire clockCustom,
    input wire resetGral,
    
    output wire [`dataLength - 1 : 0]LED
    );
    
    parameter dataLength=`dataLength;
    parameter opLength=`opLength;
    
    reg signed [dataLength-1 : 0] dataA = 0;
	reg signed [dataLength-1 : 0] dataB = 0;
	reg [opLength-1 : 0] OPCODE = 0;
	
	
	ALU #(.p_dataLength(dataLength))
	u_alu(
		.i_A(dataA),
		.i_B(dataB),
		.i_ALUBitsControl(OPCODE),
		.o_ALUResult(LED)
		);
		
	/*always @(resetGral) begin
	   dataA <= {dataLength{1'b0}};	
       dataB <= {dataLength{1'b0}};
       OPCODE <= {dataLength{1'b0}};
	end*/
	
    always @(posedge clockCustom)
	begin
	    /*if(resetGral==1'b1)
	       begin
	           dataA <= {dataLength{1'b0}};	
               dataB <= {dataLength{1'b0}};
               OPCODE <= {dataLength{1'b0}};
	       end
	    else
	       begin*/
            if (button1 == 1'b1) begin//&& o_locked saco esto de todos los ifs else ifs
                dataA <= switch;			
            end
            else if (button2 == 1'b1) begin
                dataB <= switch;			
            end
            else if (button3 == 1'b1) begin
                OPCODE <= switch;
            end
            else begin
                dataA <= dataA;	
                dataB <= dataB;
                OPCODE <= OPCODE;
            end
        //end
	end
    
endmodule
