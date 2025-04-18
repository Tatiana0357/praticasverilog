module calculadora(
    input [3:0] A,
    input [3:0] B,
    input [1:0] op_sel,    // 00 = soma, 01 = subtração, 10 = AND, 11 = OR
    output reg [3:0] C_out,
    output reg carry
);

wire [3:0] soma;
wire [3:0] sub;
wire [3:0] sand;
wire [3:0] sor;
wire temp_carry;

somador a1(
    .A(A), 
    .B(B), 
    .C(soma),
    .carry(temp_carry)
);

subtrator a2(
    .A(A), 
    .B(B), 
    .C(sub),
);

oper_and a3(
    .A(A), 
    .B(B), 
    .C(sand),
);

oper_or a4(
    .A(A), 
    .B(B), 
    .C(sor),
);

 always @(*) begin
        carry = 0;
        case (op_sel)
            2'b00: begin
                C_out = soma;
                carry = temp_carry;
            end
            2'b01: C_out = sub;
            2'b10: C_out = sand;
            2'b11: C_out = sor;
        endcase
    end
endmodule