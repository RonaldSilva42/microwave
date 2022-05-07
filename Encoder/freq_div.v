module freq_div(input wire clock,
                output wire div_clk);
  
  interger count = 0;
  
  always @(posedge clock)
    begin
      if(count == 100)
        begin
          div_clk = 1;
          count = 0;
        end
      else
        begin
          div_clk = 0;
          count = count + 1;
        end
    end
endmodule
