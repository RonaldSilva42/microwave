module freq_div_tb;
  reg clock;
  wire div_clk;
  integer i;
  
  freq_div uut(
    .clock(clock),
    .div_clk(div_clk));
  
  initial begin
    $dumpfile("freq_div_tb.vcd");
    $dumpvars(0,freq_div_tb);
    
    clock = 1;
  end
  
  initial begin
    for(i = 0; i < 5000; i = i+1) begin
          #5 clock <= ~clock;
    end
  end
endmodule
