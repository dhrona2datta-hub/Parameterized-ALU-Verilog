`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2026 18:21:13
// Design Name: 
// Module Name: tb_parameterized_alu
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


`timescale 1ns/1ps

module tb_parameterized_alu;

parameter WIDTH = 8;

reg [WIDTH-1:0] A;
reg [WIDTH-1:0] B;
reg [3:0] opcode;

wire [WIDTH-1:0] result;
wire carry;
wire overflow;
wire zero;

parameterized_alu #(
    .WIDTH(WIDTH)
) DUT (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry),
    .overflow(overflow),
    .zero(zero)
);

initial begin

    A=8'd10; B=8'd5; opcode=4'b0000;
    #10;

    A=8'd10; B=8'd5; opcode=4'b0001;
    #10;

    A=8'hAA; B=8'h55; opcode=4'b0010;
    #10;

    A=8'hAA; B=8'h55; opcode=4'b0011;
    #10;

    A=8'hAA; B=8'h55; opcode=4'b0100;
    #10;

    A=8'd10; B=0; opcode=4'b0101;
    #10;

    A=8'd10; B=0; opcode=4'b0110;
    #10;

    A=8'd25; B=8'd25; opcode=4'b0111;
    #10;

    A=8'd30; B=8'd20; opcode=4'b1000;
    #10;

    $finish;

end

endmodule
