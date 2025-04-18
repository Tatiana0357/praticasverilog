`timescale 1ns/1ps

module calculadora_tb.v;

    // Entradas
    reg [3:0] A;
    reg [3:0] B;
    reg [1:0] op_sel;

    // Saídas
    wire [3:0] C_out;
    wire carry;

    // Instancia a unidade testada (UUT)
    calculadora uut (
        .A(A),
        .B(B),
        .op_sel(op_sel),
        .C_out(C_out),
        .carry(carry)
    );

    initial begin
        $display("Tempo\tA\tB\top_sel\tC_out\tcarry");
        $monitor("%4dns\t%b\t%b\t%b\t%b\t%b", $time, A, B, op_sel, C_out, carry);

        // Teste de Soma
        A = 4'b0011; B = 4'b0101; op_sel = 2'b00; #10; // 3 + 5 = 8
        A = 4'b1111; B = 4'b0001; op_sel = 2'b00; #10; // 15 + 1 = 16 (carry)

        // Teste de Subtração
        A = 4'b1000; B = 4'b0011; op_sel = 2'b01; #10; // 8 - 3 = 5
        A = 4'b0100; B = 4'b1000; op_sel = 2'b01; #10; // 4 - 8 = negativo (interpretação depende do módulo)

        // Teste AND
        A = 4'b1100; B = 4'b1010; op_sel = 2'b10; #10; // 1100 & 1010 = 1000

        // Teste OR
        A = 4'b0101; B = 4'b1001; op_sel = 2'b11; #10; // 0101 | 1001 = 1101

        $finish;
    end
endmodule