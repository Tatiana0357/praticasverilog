module registrador_serial(
    input clk,
    input reset,
    input enable,
    input dir,
    input in_bit,
    output reg out_bit
);
reg [7:0] out;
always @(posedge clk) begin
  if(reset) begin
    out_bit <= 0;
    out <= 8'b00000000;
  end else if(in_bit) begin
        if(dir) begin
            out_bit <= out[0];
            out <= {in_bit, out[7:1]};
        end else begin
            out_bit <= out[7];
            out <= {out[6:0], in_bit};
        end
    end
end
endmodule