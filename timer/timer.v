module timer (
    input wire [3:0] data,
    input wire loadn, clrn, clk, en,
    output wire [3:0] sec_ones, sec_tens, mins,
    output wire zero
);
    wire en_sec, en_dsec, en_min, zero_sec, zero_dsec, zero_min;

    counter_mod10 sec(.loadn(loadn), .clrn(clrn), .clk(clk), .en(en), .data(data), .ones(sec_ones), .tc(en_dsec), .zero(zero_sec));
    counter_mod6 dsec(.loadn(loadn), .clrn(clrn), .clk(clk), .en(en_dsec), .data(sec_ones), .ones(sec_tens), .tc(en_min), .zero(zero_dsec));
    counter_mod10 min(.loadn(loadn), .clrn(clrn), .clk(clk), .en(en_min), .data(sec_tens), .ones(mins), .tc(en_sec), .zero(zero_min));

    and(zero,zero_sec,zero_dsec,zero_min);

endmodule