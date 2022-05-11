`timescale 1ms/1ms

module microwave_tb;
  reg [9:0] key;
  reg clk, start, stop, clear, door;
  
  wire [6:0] ones, tens, mins;
  wire mag;
  
  microwave uut(
    .keypad(key),
    .clock(clk),
    .startn(start),
    .stopn(stop),
    .clearn(clear),
    .door_closed(door),
    .sec_ones_segs(ones),
    .sec_tens_segs(tens),
    .min_segs(mins),
    .mag_on(mag));
  
  initial begin
    $dumpfile("microwave_tb.vcd");
    $dumpvars(0,microwave_tb);
  end
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    key = 10'b1000000100; start = 1; stop = 0; clear = 0; door = 1; #100; //Recebe tempo e pressiona start
    key = 10'b0000000001; start = 0;  #100; //Ligado
    key = 10'b0000000001;  #100; //Continua com a mesma configuração anterior para testar o end_timer
    key = 10'b1000000100; start = 1; stop = 0; clear = 0; door = 1; #100; //Reinicia
    key = 10'b0000000000;  door = 0; #100; //Desliga abrindo a porta
    $finish();
  end
endmodule
