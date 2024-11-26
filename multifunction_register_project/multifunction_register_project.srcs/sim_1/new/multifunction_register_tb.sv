`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 23:39:48
// Design Name: 
// Module Name: multifunction_register_tb
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

module multifunction_register_tb();
// Inputs
logic CLK;
logic Reset;
logic [1:0] S;
logic [3:0] D;
logic shift_in;
// Output
 logic [3:0] Q;

// Instantiate device under test
multifunction_register dut (.CLK(CLK), .Reset(Reset), .S(S), .D(D),  .shift_in(shift_in), .Q(Q));

//generate clock
always     // no sensitivity list, so it always executes     
     begin       
          CLK = 1; #5; CLK = 0; #5;     
     end

initial begin
    // all combinations of selection inputs (Reset, S1, S0)
    for (int s = 0; s < 8; s++) begin
               {Reset, S1, S0} = s; // based on the loop index
        // all combinations of data inputs (D0 to D3 and shift_in)
        for (int i = 0; i < 32; i++) begin
            {D3, D2, D1, D0, shift_in} = i;
            #10;
            $display("%0t\t %b %b %b %b %b | %b %b %b | %b %b %b %b", 
                     $time, D[3], D[2], D[1], D[0], shift_in, Reset, S[1], S[0], Q[3], Q[2], Q[1], Q[0] );
        end
    end
    $finish;
end
endmodule
