
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 23:31:35
// Design Name: 
// Module Name: multifunction_register
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
`timescale 1ns / 1ps

module multifunction_register(input logic CLK, 
    input logic Reset,
    input logic [1:0] S,
    input logic [3:0] D,
    input logic shift_in,
    output logic [3:0] Q
);
    logic [3:0] Q_prev;
    always_ff @(posedge CLK or posedge Reset) begin
        if (Reset) begin
            Q_prev <= 4'b0000; 
        end else begin
            Q_prev <= Q; 
        end
    end
    
    logic [3:0] muxOutput;  
    mux4_1 mux0 (.i0(Q_prev[0]), .i1(shift_in), .i2(Q_prev[1]), .i3(D[0]), .S0(S[0]), .S1(S[1]), .Y(muxOutput[0]));  
    mux4_1 mux1 (.i0(Q_prev[1]), .i1(Q_prev[0]), .i2(Q_prev[2]), .i3(D[1]), .S0(S[0]), .S1(S[1]), .Y(muxOutput[1]));      
    mux4_1 mux2 (.i0(Q_prev[2]), .i1(Q_prev[1]), .i2(Q_prev[3]), .i3(D[2]), .S0(S[0]), .S1(S[1]), .Y(muxOutput[2]));      
    mux4_1 mux3 (.i0(Q_prev[3]), .i1(Q_prev[2]), .i2(shift_in), .i3(D[3]), .S0(S[0]), .S1(S[1]), .Y(muxOutput[3]));  

    resettable_DFlipFlop ff0 (.CLK(CLK), .Reset(Reset), .D(muxOutput[0]), .Q(Q[0]));
    resettable_DFlipFlop ff1 (.CLK(CLK), .Reset(Reset), .D(muxOutput[1]), .Q(Q[1]));
    resettable_DFlipFlop ff2 (.CLK(CLK), .Reset(Reset), .D(muxOutput[2]), .Q(Q[2]));
    resettable_DFlipFlop ff3 (.CLK(CLK), .Reset(Reset), .D(muxOutput[3]), .Q(Q[3]));
endmodule
