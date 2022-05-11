module test;

  reg set, reset;
  wire Q;
  
  sr_latch dut(set, reset, Q);

  initial begin
    $dumpfile("SR_Latch.vcd");
	$dumpvars(0, test);
    
    set = 0; reset = 0; #5;
    set = 1; reset = 0; #5;
 	set = 0; reset = 1; #5;
	set = 1; reset = 1; #5;
  	set = 1; reset = 0; #5;
    set = 0; reset = 0; #5;
    set = 1; reset = 1; #5;
  end
endmodule