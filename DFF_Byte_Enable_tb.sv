`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2023 10:32:50
// Design Name: 
// Module Name: DFF_Byte_Enable_tb
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


module DFF_Byte_Enable_tb(

    );
    reg clk;
    reg [15:0] d;
    reg resetn;
    reg [1:0] byteena;
    wire [15:0] q;
    DFF_Byte_Enable dut(.clk(clk),.d(d),.q(q),.resetn(resetn),.byteena(byteena));
    always #10 clk=~clk;
    initial
    begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("time=%0t d=%b q=%b resetn=%0b byteena=%b",$time,d,q,resetn,byteena);
    #50 $finish;
    end
    initial
    begin
    clk<=0;
    #9;
    d<=16'h4567;
    byteena<=2'b01;
    resetn<=1'b1;
    #19;
    d<=16'h4537;
    byteena<=2'b10;
    resetn<=1'b0;
    end
endmodule
