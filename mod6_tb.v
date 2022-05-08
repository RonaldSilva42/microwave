
module mod_6_bcd_tb;
  reg [3:0] Data;
  reg Clock, Clear, Load, En;
  
  wire [3:0] Tens;
  wire Tc, Zero;
  
  mod_6_bcd uut(
    .data(Data),
    .loadn(Load),
    .clrn(Clear),
    .clk(Clock),
    .en(En),
    .tens(Tens),
    .tc(Tc),
    .zero(Zero));
  
  initial begin
    $dumpfile("mod_6_bcd_tb.vcd");
    $dumpvars(0,mod_6_bcd_tb);
  end
  
  initial begin
    Clock = 0;
    forever #500 Clock = ~Clock;
  end
  
  initial begin
    
    
    Clear = 1;
    En = 1;
    #5000;
    
    En = 0;
    #5000;
    Clear = 0;
    #5000;
    
    Clear = 1;
    En = 0;
    
    Load = 0;
    Data = 5;
    #1000 Load = 1;
    
    #9000;
    
    En = 1;
    
    #15000;
    
    En = 0;
    $finish();
  end
endmodule
    
