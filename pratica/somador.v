module somador(
    input [3:0] A, 
    input [3:0] B, 
    output [3:0] C
    output carry
);
assign {carry,C} = A + B;
endmodule