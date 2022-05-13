module counter_mod7_tb;
  reg clk, clear;
  wire pgt;
  
  counter_mod8 uut(
    .clk(clk),
    .clear(clear),
    .pgt(pgt));
  
  initial begin
    $dumpfile("counter_mod7_tb.vcd");
    $dumpvars(0,counter_mod7_tb);
  end
  
  initial begin
    clk = 0;
    forever #500 clk = ~clk;
  end
  
  initial begin
    clear = 1;
    #50000;
    
    clear = 0;
    #5000;
    clear = 1;
    #5000;
    
    clear = 0;
    #1000;
    clear = 1;
    $finish();
  end
endmodule
