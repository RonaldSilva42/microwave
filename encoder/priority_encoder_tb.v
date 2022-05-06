`timescale 1ns/1ps

module priority_encoder_tb;
    reg [9:0] keypad_tb;
    reg enablen_tb;

    wire [3:0] digit_tb;
    wire loadn_tb;

    priority_encoder uut (
    .keypad(keypad_tb),
    .enablen(enablen_tb),
    .digit(digit_tb),
    .loadn(loadn_tb));

    initial
        begin

            $dumpfile("priority_encoder.vcd");
            $dumpvars(0, priority_encoder_tb);

            // Inicia
            enablen_tb = 0;

            keypad_tb = 10'b1000000000;
            #10;
            
            keypad_tb = 10'b0000000001;
            #10;

            // Para
            enablen_tb = 1;
            #10;

            keypad_tb = 10'b0000001000;
            #10;

            // Reinicia
            enablen_tb = 0;
            keypad_tb = 10'b1000000000;
            #10;

            // Input inválido
            keypad_tb = 10'b1000010000;
            #10;
        end
endmodule