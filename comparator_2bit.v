`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2026 02:37:19 PM
// Design Name: 
// Module Name: comparator_2bit
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


module comparator_2bit(input [1:0]a_com, [1:0]b_com, output [2:0]out_com);
     wire a1b,a0b,b1b,b0b;
     not n1(a1b,a_com[1]);
     not n2(a0b,a_com[0]);
     not n3(b1b,b_com[1]);
     not n4(b0b,b_com[0]);
     
     wire up_and[2:0];
     and a1(up_and[2],a1b,a0b,b_com[0]);
     and a2(up_and[1],a1b,b_com[1]);
     and a3(up_and[0],a0b,b_com[1],b_com[0]);
     
     wire bet_xnor[1:0];
     xnor x1(bet_xnor[1],a_com[1],b_com[1]);
     xnor x2(bet_xnor[0],a_com[0],b_com[0]);
     
     wire bot_and[2:0];
     and a4(bot_and[2],a_com[0],b1b,b0b);
     and a5(bot_and[1],a_com[1],a_com[0],b0b);
     and a6(bot_and[0],a_com[1],b1b);
     
     //the outputs
     or o1(out_com[2],up_and[2],up_and[1],up_and[0]);     //A<B
     and a7(out_com[1],bet_xnor[1],bet_xnor[0]);            //A=B
     or o2(out_com[0],bot_and[2],bot_and[1],bot_and[0]);  //A>B
endmodule
