`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2023 10:22:48
// Design Name: 
// Module Name: DFF_Byte_Enable
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


module DFF_Byte_Enable(
input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q
    );
    integer i;
    always @ (posedge clk) begin
    if(resetn==1'b1) begin
    if(byteena==2'b00)
    q<=q;
    else if(byteena==2'b11)
    q<=d;
    else if(byteena==2'b10) begin
    for(i=8;i<16;i=i+1)
    q[i]<=d[i];
    end
    else if(byteena==2'b01) begin
    for(i=0;i<8;i=i+1)
    q[i]<=d[i];
    end
    end 
    else if(resetn==1'b0)
    q<=0;
    end
endmodule
