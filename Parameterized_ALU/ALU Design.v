`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2026 18:20:27
// Design Name: 
// Module Name: ALU Design
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


module parameterized_alu #(
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    input  [3:0] opcode,

    output reg [WIDTH-1:0] result,
    output reg carry,
    output reg overflow,
    output zero
);

always @(*) begin
    carry = 0;
    overflow = 0;

    case(opcode)

        4'b0000:
            {carry,result} = A + B;

        4'b0001:
            {carry,result} = A - B;

        4'b0010:
            result = A & B;

        4'b0011:
            result = A | B;

        4'b0100:
            result = A ^ B;

        4'b0101:
            result = A << 1;

        4'b0110:
            result = A >> 1;

        4'b0111:
            result = (A == B);

        4'b1000:
            result = (A > B);

        default:
            result = 0;

    endcase
end

assign zero = (result == 0);

endmodule