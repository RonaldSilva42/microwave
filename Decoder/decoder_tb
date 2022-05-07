module decoder_tb;
  reg[3:0] Sec_ones, Sec_tens, Min;
  wire[6:0] Sec_ones_segs, Sec_tens_segs, Min_segs;
  
  decoder uut(.sec_ones(Sec_ones),
              .sec_tens(Sec_tens),
              .min(Min),
              .sec_ones_segs(Sec_ones_segs),
              .sec_tens_segs(Sec_tens_segs),
              .min_segs(Min_segs));
  
  initial begin
    $dumpfile("decoder_tb.vcd");
    $dumpvars(0,decoder_tb);
  end
  
  initial begin
     Min = 7; Sec_tens = 4;Sec_ones = 3;
    #10 Min = 1; Sec_tens = 3; Sec_ones = 0;
    #10 Min = 5; Sec_tens = 0; Sec_ones = 9;  
    #10 Min = 0; Sec_tens = 1; Sec_ones = 2;  
    #10 Min = 0; Sec_tens = 0; Sec_ones = 0;  
    #20;
    
  end
  
endmodule
