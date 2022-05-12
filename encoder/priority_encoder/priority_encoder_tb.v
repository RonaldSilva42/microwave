`timescale 1ms/1ms

module priority_encoder_tb;
    reg [9:0] keypad_tb;
    reg enable_tb;

    wire [3:0] D_tb;
    wire valid_tb;

    priority_encoder uut (
    .keypad(keypad_tb),
    .enable(enable_tb),
    .D(D_tb),
    .valid(valid_tb));

    initial
        begin

            $dumpfile("priority_encoder.vcd");
            $dumpvars(0, priority_encoder_tb);

            enable_tb = 0;
            #5;
        
            keypad_tb = 10'b0000000000;
            #5;

            keypad_tb = 10'b1000000000;
            #100;

            keypad_tb = 10'b0000000000;
            #5;

            keypad_tb = 10'b0000000001;
            #100;

            keypad_tb = 10'b0000000000;
            #5;

            keypad_tb = 10'b0000001000;
            #100;

            keypad_tb = 10'b0000000000;
            #5;

            keypad_tb = 10'b1000000000;
            #100;

            keypad_tb = 10'b0000000000;
            #5;

            // Input inválido
            keypad_tb = 10'b1000010000;
            #100;

            $finish;
        end
endmodule