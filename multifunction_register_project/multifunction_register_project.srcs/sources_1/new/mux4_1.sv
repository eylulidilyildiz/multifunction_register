`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 23:32:27
// Design Name: 
// Module Name: mux4_1
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


module mux4_1( input logic i0, i1, i2, i3, S0, S1,
    		     output logic Y);
	always_comb begin
        case ({S0, S1})
            2'b00: Y = i0;   
            2'b01: Y = i1;   
            2'b10: Y = i2;   
            2'b11: Y = i3;   
            default: Y = 1'b0;
        endcase
    end
endmodule
