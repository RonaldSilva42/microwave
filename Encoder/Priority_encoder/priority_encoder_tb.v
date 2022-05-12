`timescale 1ms/1ms

module priority_encoder_tb;
    reg [9:0] keypad_tb;
    reg enablen_tb;

    wire [3:0] D_tb;
    wire validn_tb;

    priority_encoder uut (
    .keypad(keypad_tb),
    .enablen(enablen_tb),
    .D(D_tb),
    .validn(validn_tb));

    initial
        begin

            $dumpfile("priority_encoder.vcd");
            $dumpvars(0, priority_encoder_tb);

            enablen_tb = 1;
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