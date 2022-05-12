module timer_tb;
  reg [3:0] Data;
  reg Clock, Clear, Load, En;
  
  integer i;
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
    
    for(i = 0; i < 2500; i = i+1) begin
          #500 Clock <= !Clock;
        end
  end
  
  initial begin
    Load = 0; Clear = 0; En = 0; Data = 4'b0111; Clock = 1; //insere o 7 nas unidades de segundos
    #1000;
    Data = 4'b0010; //insere o 2 nas unidades de segundos e passa o 7 para dezena de segundos 
    
    #1000;
    
    Data = 4'b0100; //insere o 4 nas unidades de segundos, passa o 2 para dezena de segundos e o 7 para minutos
    
    #1000;
    Load = 1;
    En = 1;
    
    #5000;
    En = 0; //pausa
    
    #5000;
    
    Clear = 0; //limpa
    
    #5000
    
    Clear = 1;
    
    En = 1; //reinicia contagem
    
    #15000;
    
    En = 0; //pausa o cronometro
  end
endmodule
