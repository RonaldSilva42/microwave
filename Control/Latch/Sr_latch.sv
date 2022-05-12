module sr_latch(
    input set,
    input reset,
    output Q
    );
	
  	reg Q;
  
    always @(*)
      begin
        Q = (~set && reset) ? 0:
          (set && ~reset) ? 1:
          (set && reset) ? 0:
          Q;
      end
endmodule
