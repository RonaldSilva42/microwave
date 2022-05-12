module timer(
  input wire[3:0] data,
  input wire loadn, clrn, clock, en,
  output wire [3:0] sec_ones, sec_tens, mins,
  output wire zero);
  
  wire en_st, en_min;
  wire zero_so, zero_st, zero_min;
  
  mod_10_bcd unit_sec(
    .data(data),
    .loadn(loadn),
    .clrn(clrn),
    .clk(clock),
    .en(en),
    .ones(sec_ones),
    .tc(en_st),
    .zero(zero_so));
  
  mod_6_bcd ten_sec(
    .data(sec_ones),
    .loadn(loadn),
    .clrn(clrn),
    .clk(clock),
    .en(en_st),
    .tens(sec_tens),
    .tc(en_min),
    .zero(zero_st));
  
  mod_10_bcd min(
    .data(sec_tens),
    .loadn(loadn),
    .clrn(clrn),
    .clk(clock),
    .en(en_min),
    .ones(mins),
    .zero(zero_min));
  
  assign zero = zero_so && zero_st && zero_min;
  
endmodule


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
  assign zero = (tens === 4'b0000 || tens === 4'bXXXX) ? 1 : 0;
  
  initial begin
    tens = 4'b0000;
  end
  
  always@(negedge clrn) begin
    tens <= 0;
  end
  
  always@(posedge clk) begin
          if(!en)
            begin
              if(!loadn)
                  tens <= data;
            end
          else
            begin
              if(tens == 0)
                  tens <= 5;
              else
                tens <= tens - 1;
            end
        end
  
endmodule


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
  assign zero = (ones === 4'b0000 || ones === 4'bXXXX) ? 1 : 0;
  
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
 
