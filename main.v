module microwave(input wire [9:0] keypad,
                 input wire clock, startn, stopn, clearn, door_closed,
                 output wire [6:0] sec_ones_segs, sec_tens_segs, min_segs,
                 output wire mag_on);
  
  wire zero, pgt, loadn, mag;
  wire [3:0] sec_one, sec_ten, min, D;
  
  MagnetronControl mag_control(
    .start(startn),
    .stop(stopn),
    .clear(clearn),
    .door_closed(door_closed),
    .timer_done(zero),
    .Enabler(mag));

  encoder encoder_1(
    .keypad(keypad),
    .clk(clock),
    .enablen(mag),
    .D(D),
    .pgt_1hz(pgt),
    .loadn(loadn));
  
  timer timer_1(
    .data(D),
    .loadn(loadn),
    .clock(pgt),
    .clrn(clearn),
    .en(mag),
    .sec_ones(sec_one),
    .sec_tens(sec_ten),
    .mins(min),
    .zero(zero));

  decoder decoder_1(
    .sec_ones(sec_one),
    .sec_tens(sec_ten),
    .min(min),
    .sec_ones_segs(sec_ones_segs),
    .sec_tens_segs(sec_tens_segs),
    .min_segs(min_segs));


  assign mag_on = mag;

endmodule

  