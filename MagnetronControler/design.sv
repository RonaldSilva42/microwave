module MagnetronControl(
  input start,
  input stop,
  input clear,
  input door_closed,
  input timer_done,
  output Enabler);
  
  reg Enabler;

  always @(*)
    begin
      if(stop)
        Enabler = 0;
      else if(clear)
        Enabler = 0;
      else if(timer_done)
        Enabler = 0;
      else if(~door_closed)
        Enabler = 0;
      else if(start)
		Enabler = 1;
    end
endmodule

  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  