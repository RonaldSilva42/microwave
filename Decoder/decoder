module decoder(input wire[3:0] sec_ones, sec_tens, min,
               output wire[6:0] sec_ones_segs, sec_tens_segs, min_segs);
  
  assign min_segs = (min === 4'b0000) ? 7'b000_0000 :
    				(min === 4'b0001) ? 7'b011_0000 : 
    				(min === 4'b0010) ? 7'b110_1101 : 
    				(min === 4'b0011) ? 7'b111_1001 : 
            (min === 4'b0100) ? 7'b011_0011 : 
    				(min === 4'b0101) ? 7'b101_1011 : 
    				(min === 4'b0110) ? 7'b001_1111 : 
    				(min === 4'b0111) ? 7'b111_0000 :
    				(min === 4'b1000) ? 7'b111_1111 :
    				(min === 4'b1001) ? 7'b111_0011 :
    				7'b000_0000;
  
 
  assign sec_tens_segs =  ((min == 4'b0000 ) && (sec_tens == 4'b0000)) ? 7'b000_0000:
    					  (sec_tens === 4'b0000) ? 7'b111_1110 :
                          (sec_tens === 4'b0001) ? 7'b011_0000 :
                          (sec_tens === 4'b0010) ? 7'b110_1101 :
                          (sec_tens === 4'b0011) ? 7'b111_1001 :
                          (sec_tens === 4'b0100) ? 7'b011_0011 : 
                          (sec_tens === 4'b0101) ? 7'b101_1011 : 
                          (sec_tens === 4'b0110) ? 7'b001_1111 : 
                          (sec_tens === 4'b0111) ? 7'b111_0000 : 
                          (sec_tens === 4'b1000) ? 7'b111_1111 : 
                          (sec_tens === 4'b1001) ? 7'b111_0011 : 
                          7'b000_0000;
 
  assign sec_ones_segs = ((min == 4'b0000 ) && (sec_tens == 4'b0000) && (sec_ones == 4'b0000)) ? 7'b000_0000:
     					 (sec_ones === 4'b0000) ? 7'b111_1110 :
                         (sec_ones === 4'b0001) ? 7'b011_0000 :
                         (sec_ones === 4'b0010) ? 7'b110_1101 :
                         (sec_ones === 4'b0011) ? 7'b111_1001 :
                         (sec_ones === 4'b0100) ? 7'b011_0011 :
                         (sec_ones === 4'b0101) ? 7'b101_1011 :
                         (sec_ones === 4'b0110) ? 7'b001_1111 :
                         (sec_ones === 4'b0111) ? 7'b111_0000 :
                         (sec_ones === 4'b1000) ? 7'b111_1111 :
                         (sec_ones === 4'b1001) ? 7'b111_0011 :
                         7'b000_0000;
  
  
endmodule
