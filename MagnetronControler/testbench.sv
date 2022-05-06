module test;

  reg start, stop, clear, door_closed, timer_done;
  wire Enabler;
  
  MagnetronControl dut(start, stop, clear, door_closed, timer_done, Enabler);

  initial begin
    $dumpfile("MagnetronControl.vcd");
	$dumpvars(0, test);
    start = 1; stop = 0; clear = 0; door_closed = 1; timer_done = 0; #10; //start
	start = 0; stop = 0; clear = 0; door_closed = 1; timer_done = 0; #10; //keepsON
    start = 1; stop = 0; clear = 0; door_closed = 0; timer_done = 0; #10; //Doortest
    start = 0; stop = 0; clear = 0; door_closed = 0; timer_done = 0; #10; //Transiçã
    start = 1; stop = 0; clear = 0; door_closed = 1; timer_done = 0; #10; //start
    start = 0; stop = 1; clear = 0; door_closed = 1; timer_done = 0; #10; //stoptest
    start = 1; stop = 0; clear = 0; door_closed = 1; timer_done = 0; #10; //start
    start = 0; stop = 0; clear = 1; door_closed = 1; timer_done = 0; #10; //cleartes
    start = 1; stop = 0; clear = 0; door_closed = 1; timer_done = 0; #10; //start
    start = 0; stop = 0; clear = 0; door_closed = 1; timer_done = 1; #10; //timertes
 

  
  end
endmodule