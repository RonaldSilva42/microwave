module priority_encoder (
    input [9:0] keypad,
    input enablen,

    output reg [3:0] D,
    output reg validn
);

    always @(keypad, enablen) begin
        // O microondas está funcionando, logo não é possível pressionar nenhuma tecla
        if (enablen == 0) begin
            validn = 1;
        end

        else begin
            case (keypad)
                // 1
                10'b1000000000: begin
                    D = 4'b0001;
                    validn = 0;
                end

                // 2
                10'b0100000000: begin
                    D = 4'b0010;
                    validn = 0;
                end
                
                // 3
                10'b0010000000: begin
                    D = 4'b0011;
                    validn = 0;
                end
                
                // 4
                10'b0001000000: begin
                    D = 4'b0100;
                    validn = 0;
                end

                // 5
                10'b0000100000: begin
                    D = 4'b0101;
                    validn = 0;
                end

                // 6
                10'b0000010000: begin
                    D = 4'b0110;
                    validn = 0;
                end

                // 7
                10'b0000001000: begin
                    D = 4'b0111;
                    validn = 0;
                end

                // 8
                10'b1000000100: begin
                    D = 4'b1000;
                    validn = 0;
                end

                // 9
                10'b0000000010: begin
                    D = 4'b1001;
                    validn = 0;
                end

                // 0
                10'b0000000001: begin
                    D = 4'b0000;
                    validn = 0;
                end

                // Caso em que nenhuma tecla está sendo pressionada
                10'b0000000000: validn = 1;

                // Input inválido
                default: begin
                    validn = 1;
                end
            endcase
        end
    end
endmodule