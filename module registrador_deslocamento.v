module registrador_deslocamento(
    input clk,
    input reset,
    input enable,
    input in_bit,
    input dir,
    output reg[3:0] out_reg
);
always @(posedge clk) begin
  if(reset)
    out_reg <= 0;
  else if(enable)
    if(dir)
      out_reg <= {in_bit, out_reg[3:1]};
    else
      out_reg <= {out_reg[2:0], in_bit;};
end

endmodule