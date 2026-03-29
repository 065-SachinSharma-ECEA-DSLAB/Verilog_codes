`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2026 09:33:25 PM
// Design Name: 
// Module Name: bcd_adder
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


module bcd_adder(input [3:0]a_bcd, [3:0]b_bcd, c_in, output[3:0]sum_bcd,output c_out );
   wire [3:0]sum_temp;
   wire a1,a2,o1;
   wire cout_temp;
   
   rca_4bit rca1(a_bcd,b_bcd,c_in,sum_temp,cout_temp);
   and a_1(a1,sum_temp[3],sum_temp[2]);
   and a_2(a2,sum_temp[3],sum_temp[1]);
   or o_1(o1,a1,a2,cout_temp);
   
   wire [3:0]b_rca2;
   assign b_rca2[0]=0;
   assign b_rca2[3]=0;
   assign b_rca2[1]=o1;
   assign b_rca2[2]=o1;
   rca_4bit rca2(sum_temp,b_rca2 ,0,sum_bcd,c_out);

endmodule
