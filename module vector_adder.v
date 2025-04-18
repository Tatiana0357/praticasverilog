module vector_adder (
    input clk,
    input rst,
    input start,
    input [7:0] A [0:7],
    input [7:0] B [0:7],
    output reg [7:0] C [0:7],
    output reg done
);

    reg [2:0] idx;
    reg processing;
    integer i;

    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 8; i = i + 1)
                C[i] <= 0;
            idx <= 0;
            done <= 0;
            processing <= 0;
        end else begin
            if (start && !processing) begin
                done <= 0;
                idx <= 0;
                processing <= 1;
            end else if (processing) begin
                C[idx] <= A[idx] + B[idx];
                if (idx == 7) begin
                    done <= 1;
                    processing <= 0;
                end else begin
                    idx <= idx + 1;
                end
            end
        end
    end

endmodule
