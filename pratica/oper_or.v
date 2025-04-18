module oper_or(
    input [3:0] A, 
    input [3:0] B, 
    output [3:0] C
);
assign C = A|B;
endmodule