module robot(
    input clk,
    input reset,
    input insere,
    input [3:0] entrada,
    output reg [1:0] saida // 00(errado), 01(parcial), 11(sucesso), 10(processo)
);

reg [2:0] step;
reg [2:0] count;
reg [3:0] seq [4:0];
reg [1:0] estado;

always @(posedge clk) begin
    if (reset) begin
        seq[0] <= 4'b0001; // 1
        seq[1] <= 4'b1000; // 8
        seq[2] <= 4'b0101; // 5
        seq[3] <= 4'b0010; // 2
        seq[4] <= 4'b0011; // 3

        estado <= 2'b10; // processo
        count <= 0;
        step <= 0;
        saida <= 2'b10;
    end else if (insere) begin
        if (estado == 2'b10) begin
            if (entrada == seq[step]) begin
                step <= step + 1;
            end else begin
                count <= count + 1;
            end

            if (count > 1) begin
                estado <= 2'b00; // errado
            end else if (step == 4 && estado != 2'b00) begin
                if (count > 0)
                    estado <= 2'b01; // parcial
                else
                    estado <= 2'b11; // sucesso
            end
        end
        case (estado)
            2'b00: saida <= 2'b00;
            2'b01: saida <= 2'b01;
            2'b11: saida <= 2'b11;
            default: saida <= 2'b10;
        endcase
    end
end
endmodule
