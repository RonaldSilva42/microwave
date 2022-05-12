module timer(
  input wire[3:0] data,
  input wire loadn, clrn, clock, en,
  output wire [3:0] sec_ones, sec_tens, mins,
  output wire zero);
  
  wire en_st, en_min;
  wire zero_so, zero_st, zero_min;
  
  mod_10_bcd unit_sec(.data(data),
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
