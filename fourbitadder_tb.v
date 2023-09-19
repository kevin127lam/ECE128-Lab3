`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 01:32:41 PM
// Design Name: 
// Module Name: fourbitadder_tb
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

module fourbitadder_tb();
    
    reg [3:0] At, Bt;
    //reg Ct; //input
	wire Coutt; //output
	wire [3:0] st;

	// you can use the same name, but in this case we made them different 	// to highlight the 2 (.UUT(TB))
	fourbitadder uut(.A(At), .B(Bt), .sum(st), .Cout(Coutt)); //portmap

	initial 
	begin
		At=4'b0000; Bt=4'b0000;
		#10;
		At=4'b0001; Bt=4'b0001;
		#10;
		At=4'b0010; Bt=4'b0010;
		#10;
		At=4'b0011; Bt=4'b0011;
		#10;
		At=4'b0100; Bt=4'b0100;
		#10;
		At=4'b0101; Bt=4'b0101;
		#10;
		At=4'b0110; Bt=4'b0110;
		#10;
		At=4'b0111; Bt=4'b0111;
		#10;
		At=4'b1000; Bt=4'b1000;
		#10;
		At=4'b1010; Bt=4'b1100;
		#10;
		At=4'b1011; Bt=4'b1001;
		#10;
		At=4'b1111; Bt=4'b1111;
		#10;
		
		
		
		$finish;
	end
		
endmodule