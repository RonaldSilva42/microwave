module logic_and_or_not(input start, input stop, input clear, input door_closed, input timer_done, output wire set, output wire reset);
	
  assign set = (~start && door_closed);
  assign reset = (~stop || ~clear || ~door_closed || timer_done); 
  
endmodule
