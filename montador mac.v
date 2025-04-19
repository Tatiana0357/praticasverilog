module MAC(
    input [7:0] x0,x1,x2,x3,
    input [7:0] y0,y1,y2,y3,
    output reg [15:0] R
);

// assign R = (x0*y0)+(x1*y1)+(x2*y2)+(x3*y3);

always @(*) begin
  R = (x0*y0)+(x1*y1)+(x2*y2)+(x3*y3);
end
endmodule