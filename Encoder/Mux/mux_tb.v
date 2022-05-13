module mux_tb;
  reg sel, pgt, clk;
  wire out;
  
  mux uut(
    .sel(sel),
    .pgt(pgt),
    .clk(clk),
    .out(out));
  
  initial begin
    $dumpfile("mux_tb.vcd");
    $dumpvars(0,mux_tb);
  end
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    sel = 0; pgt = 1;
    #20; //output em sincronia com o relógio
    sel = 1; //output recebe o valor do 1 do pgt
    #20;
    pgt = 0;//output recebe o valor do 0 do pgt
   	#10;
    $finish();
  end
endmodule
  
