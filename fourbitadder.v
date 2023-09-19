`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 01:29:47 PM
// Design Name: 
// Module Name: fourbitadder
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

////////////////////////////////////////////////////////////////////////////
module fourbitadder(A, B, sum, Cout);

input [3:0] A, B;

output [3:0] sum;
output Cout;

wire [3:0] C;

onebitadder add0(.A(A[0]), .B(B[0]), .Cin(0), .s(sum[0]), .Cout(C[0]));
onebitadder add1(.A(A[1]), .B(B[1]), .Cin(C[0]), .s(sum[1]), .Cout(C[1]));
onebitadder add2(.A(A[2]), .B(B[2]), .Cin(C[1]), .s(sum[2]), .Cout(C[2]));
onebitadder add3(.A(A[3]), .B(B[3]), .Cin(C[2]), .s(sum[3]), .Cout(C[3]));

assign Cout = C[3];

endmodule
///////////////////////////////////////////////////////////////////////
module onebitadder(A, B, Cin, s, Cout);

	input A, B, Cin;
	output reg Cout, s;

	always@(A, B, Cin)//input list
	begin
	case ({A, B,Cin})		//cases of the truth table
        3'b000: s=0;
        3'b001: s=1;
    	3'b010: s=1; 
	    3'b011: s=0;
    	3'b100: s=1; 
        3'b101: s=0; 
        3'b110: s=0;
    	3'b111: s=1;
	endcase
	
	case ({A, B,Cin})		//cases of the truth table
        3'b000: Cout=0; 
        3'b001: Cout=0;
    	3'b010: Cout=0;
	    3'b011: Cout=1;
    	3'b100: Cout=0;
        3'b101: Cout=1;
        3'b110: Cout=1;
    	3'b111: Cout=1;
	endcase
	
	end
	
	endmodule
/////////////////////////////////////////////////////////////
module SevenSegment(Sum, Display);
input[3:0] Sum;
output reg [6:0] Display;

always@( Sum )
begin
case(Sum)
    4'b0000: Display = 7'b0000001; //(if active low then 000001)
    4'b0001: Display = 7'b1001111;
    4'b0010: Display = 7'b0010010;
    4'b0011: Display = 7'b0000110;
    4'b0100: Display = 7'b1001100;
    4'b0101: Display = 7'b0100100;
    4'b0110: Display = 7'b0100000;
    4'b0111: Display = 7'b0001111;
    4'b1000: Display = 7'b0000000; 
    4'b1001: Display = 7'b0001111;
 
endcase
end
endmodule
/////////////////////////////////////////////////////////////////////
module final(A, B, Cout, Display);
    input [3:0] A, B;
    output Cout;
    output [6:0] Display;
    wire [3:0] Sum;
    
     fourbitadder add0(.A(A), .B(B), .sum(Sum), .Cout(Cout));
     SevenSegment seg0(.Sum(Sum), .Display(Display));
endmodule