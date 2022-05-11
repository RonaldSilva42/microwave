module priority_encoder (
    input [9:0] keypad,
    input enablen,

    output reg [3:0] digit,
    output reg validn
);

    always @(keypad, enablen) begin
        // Está desligado, então não acontece nada
        if (enablen == 0) begin
            validn = 1;
        end

        else begin
            validn = 0;

            case (keypad)
                // 1
                10'b1000000000: digit = 4'b0001;

                // 2
                10'b0100000000: digit = 4'b0010;
                
                // 3
                10'b0010000000: digit = 4'b0011;
                
                // 4
                10'b0001000000: digit = 4'b0100;

                // 5
                10'b0000100000: digit = 4'b0101;

                // 6
                10'b0000010000: digit = 4'b0110;

                // 7
                10'b0000001000: digit = 4'b0111;

                // 8
                10'b1000000100: digit = 4'b1000;

                // 9
                10'b0000000010: digit = 4'b1001;

                // 0
                10'b0000000001: digit = 4'b0000;

                // Input inválido
                default: begin
                    validn = 1;
                end
            endcase
        end
    end
endmodule