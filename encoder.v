module encoder (
    input [9:0] keypad,

    output reg [3:0] digit
);

    always @(keypad) begin
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
        endcase
    end
endmodule