`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2026 10:01:25 PM
// Design Name: 
// Module Name: rca_4bit
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


module rca_4bit(input [3:0]a_rca,[3:0]b_rca,cin_rca, output [3:0]sum_rca,cout_rca);
   wire c0,c1,c2;
   full_adder f1(.a(a_rca[0]),.b(b_rca[0]),.cin(cin_rca),.sum(sum_rca[0]),.carry(c0)); //
   full_adder f2(a_rca[1],b_rca[1],c0,sum_rca[1],c1);
   full_adder f3(a_rca[2],b_rca[2],c1,sum_rca[2],c2);
   full_adder f4(a_rca[3],b_rca[3],c2,sum_rca[3],cout_rca);
endmodule
