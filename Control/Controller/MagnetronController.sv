module MagnetronControl(
  input start,
  input stop,
  input clear,
  input door_closed,
  input timer_done,
  output Enabler);
  

  wire set, reset;
  
  logic_and_or_not B_logic(start, stop, clear, door_closed, timer_done, set, reset);
  sr_latch latch(set, reset, Enabler);
  

  
  
endmodule
