`timescale 1ns/1ps

module encoder_tb;
    reg [9:0] keypad_tb;

    wire [3:0] digit_tb;

    encoder uut (
    .keypad(keypad_tb),
    .digit(digit_tb));

    initial
        begin

            $dumpfile("encoder.vcd");
            $dumpvars(0, encoder_tb);

            keypad_tb = 10'b1000000000;
            #10;
            
            keypad_tb = 10'b0000000001;
            #10;

            keypad_tb = 10'b0000001000;
            #10;

            keypad_tb = 10'b1000000000;
            #10;
        end
endmodule