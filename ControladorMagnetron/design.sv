module MagnetronControl(
  input start,
  input stop,
  input clear,
  input door_closed,
  input timer_done,
  output Enabler);

  reg Enabler;
  reg set, reset;
  
  always @(*)
    begin
      
      set = (start && door_closed);
  	  reset = (stop || clear || ~door_closed || timer_done); 
      
      Enabler = (~set && reset) ? 0:
    	(set && ~reset) ? 1:
    	(set && reset) ? 0:
    	Enabler;
    end

    
endmodule
