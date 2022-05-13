module mod_10_bcd(
  input wire [3:0] data,
  input wire loadn, clrn, clk, en,
  output reg [3:0] ones,
  output wire tc, zero);
  
  //active low - loadn (sinc) e clrn(assinc)
  //active high - en -> quando en = 1 permite que a contagem seja feita
  //tc = 1 quando ones = 4'b000 -> reinicia a contagem
  //zero = 1 quando ones = 4'b000

  assign tc = ((ones == 4'b0000) && (en == 1)) ? 1 : 0;
  assign zero = (ones === 4'b0000) ? 1 : 0;
  
  always@(negedge clrn) begin
    ones <= 0;
  end
  
  always@(posedge clk) begin
          if(!en)
            begin
              if(!loadn)
                  ones <= data;
            end
          else
            begin
              if(ones == 0)
                  ones <= 9;
              else
                ones <= ones - 1;
            end
        end 
endmodule