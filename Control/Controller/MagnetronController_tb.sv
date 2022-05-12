module test;

  reg start, stop, clear, door_closed, timer_done;
  wire Enabler;
  
  MagnetronControl dut(start, stop, clear, door_closed, timer_done, Enabler);

  initial begin
    $dumpfile("MagnetronControl.vcd");
	  $dumpvars(0, test);

    start = 1; stop = 1; clear = 1; door_closed = 0; timer_done = 0; #10; //start
    start = 0; stop = 1; clear = 1; door_closed = 1; timer_done = 0; #10; //start
	  start = 1; stop = 1; clear = 1; door_closed = 1; timer_done = 0; #10; //keepsON
    start = 1; stop = 0; clear = 1; door_closed = 1; timer_done = 0; #10; //Doortest
	  start = 1; stop = 1; clear = 1; door_closed = 0; timer_done = 0; #10;
    start = 0; stop = 1; clear = 1; door_closed = 1; timer_done = 0; #10;

  end
endmodule