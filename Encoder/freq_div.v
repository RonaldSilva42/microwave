module freq_div(input wire clock,
                output wire div_clk);
  
  integer count = 0;
  
  always @(posedge clock)
    begin
      if(count < 100)
        begin
          div_clk = 0;
        end
      else
        begin
          count = 0;
          div_clk = 1;
        end
      
      count = count + 1;
    end
endmodule
