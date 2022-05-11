`timescale 1ns/1ps

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
            #10 clk_tb = ~clk_tb;
        end 
    end

    initial
        begin

            $dumpfile("encoder.vcd");
            $dumpvars(0, encoder_tb);

            // Teste do pgt e priority encoder
            enablen_tb = 1;
            #10;

            keypad_tb = 10'b1000000000;
            #10;
            
            keypad_tb = 10'b0000000001;
            #10;

            keypad_tb = 10'b0000001000;
            #10;

            keypad_tb = 10'b1000000000;
            #10;

            // Input inválido
            keypad_tb = 10'b1000010000;
            #10;
        end
endmodule