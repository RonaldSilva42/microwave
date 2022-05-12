`timescale 1ms/1ms

module encoder_tb;
    reg [9:0] keypad_tb;
    reg clk_tb, enablen_tb;

    wire [3:0] D_tb;
    wire pgt1_hz_tb, loadn_tb;

    encoder uut (
    .keypad(keypad_tb),
    .clk(clk_tb),
    .enablen(enablen_tb),
    .D(D_tb),
    .pgt_1hz(pgt1_hz_tb),
    .loadn(loadn_tb));

    initial begin 
        clk_tb = 0;

        forever begin
            #5 clk_tb = ~clk_tb;
        end 
    end

    initial
        begin

            $dumpfile("encoder.vcd");
            $dumpvars(0, encoder_tb);

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

            // Testando o clock durante o funcionamento do microondas
            enablen_tb = 0;
            #2000;

            $finish;
        end
endmodule