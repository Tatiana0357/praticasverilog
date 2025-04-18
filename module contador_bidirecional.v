module contador_bidirecional(
    input clk,
    input reset,
    input enable,
    input up_down,
    output reg[3:0] count
);
always @(posedge clk)begin
  if(reset)
    count <= 4'b0000;
  else if(enable)
    if(up_down)
        if (count == 4'b1111) // if(count<4'b1111) count <= count + 1;
            count <= 4'b1111;
        else
            count <= count + 1;
    else
        if(count == 4'b0000) // if(count>4'b0000) count <= count - 1;
            count <= 4'b0000;
        else
            count <= count - 1;
end
endmodule