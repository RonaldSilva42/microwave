module mod_6_bcd(
  input wire [3:0] data,
  input wire loadn, clrn, clk, en,
  output reg [3:0] tens,
  output wire tc, zero);
  
  //active low - loadn (sinc) e clrn(assinc)
  //active high - en -> quando en = 1 permite que a contagem seja feita
  //tc = 1 quando tens = 4'b000 -> reinicia a contagem
  //zero = 1 quando tens = 4'b000
  
  
  assign tc = ((tens == 4'b0000) && (en == 1)) ? 1 : 0;
  assign zero = (tens == 4'b0000) ? 1 : 0;
  
  always@(posedge clk, negedge clrn)
    begin
      
      if(!clrn)
        begin
          tens <= 0;
        end
      else
        begin
          if(!en)
            begin
              if(!loadn)
                begin
                  tens <= data;
                end
            end
          else
            begin
              if(tens == 0)
                begin
                  tens <= 5;
                end
              else
                begin
                	tens <= tens - 1;
                end
            end
        end
    end
  
endmodule
