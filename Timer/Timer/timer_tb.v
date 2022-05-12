module timer_tb;
  reg [3:0] Data;
  reg Clock, Clear, Load, En;
  
  wire [3:0] Sec_ones, Sec_tens, Mins;
  wire Zero;
  
  timer uut(
    .data(Data),
    .loadn(Load),
    .clrn(Clear),
    .clock(Clock),
    .en(En),
    .sec_ones(Sec_ones),
    .sec_tens(Sec_tens),
    .mins(Mins),
    .zero(Zero));
  
  initial begin
    $dumpfile("timer_tb.vcd");
    $dumpvars(0,timer_tb);
  end
  
  initial begin
    Clock = 0;
    forever #500 Clock = ~Clock;
  end
  
  initial begin
    Clear = 1;
    En = 0;
    
    Load = 0;
    Data = 5;
    #1000 Load = 1;
    
    #9000;
    
    En = 1; //iniciar a cont
    
    #15000;
    
    En = 0; //pausa
    
    #5000;
    
    Clear = 0; //limpa
    
    #5000
    
    Clear = 1;
    
    En = 1; //reinicia contagem
    
    #15000;
    
    En = 0; //pausa o cronometro
    $finish();
  end
endmodule
