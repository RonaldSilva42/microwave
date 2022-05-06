module mod_6_bcd(
  input wire [3:0] data,
  input wire loadn, clrn, clk, en,
  output reg [3:0] tens,
  output wire tc, zero);
  
  //active low - loadn (sinc) e clrn(assinc)
  //active high - en -> quando en = 1 permite que a contagem seja feita
  //tc = 1 quando tens = 4'b000 -> reinicia a contagem
  //zero = 1 quando tens = 4'b000
  
  wire [3:0] state;
  
  
  assign tc = ((tens == 4'b0000) && en));
  assign zero = (tens == 4'b0000) ? 1 : 0;
  
  always@(posedge clk, negedge clrn)
    begin
      
      if(!clrn)
        begin
          state <= 0;
        end
      else
        begin
          if(en)
            begin
              if(!loadn)
                begin
                  state <= data;
                end
            end
          else
            begin
              if(state == 0)
                begin
                  state <= 5;
                end
              else
                begin
                	state <= state - 1;
                end
            end
        end
    end
  
  assing tens = state;
  
endmodule
