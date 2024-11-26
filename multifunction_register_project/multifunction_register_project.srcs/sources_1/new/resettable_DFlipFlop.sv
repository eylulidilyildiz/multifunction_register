`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 23:36:34
// Design Name: 
// Module Name: resettable_DFlipFlop
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


module resettable_DFlipFlop(input logic CLK, Reset, D,
  			         output logic Q  );
    always_ff @(posedge CLK) begin
   	    if (Reset) Q <= 1'b0; //Q gets 0 when Reset is 1
    	else Q <= D;
    end
endmodule

