module microwave(input wire [9:0] keypad,
                 input wire clock, startn, stopn, clearn, door_closed,
                 output wire [6:0] sec_ones_segs, sec_tens_segs, min_segs,
                 output wire mag_on);
  
  wire zero, mag, pgt, load;
  wire [3:0] sec_one, sec_ten, min, D;
  
  assign mag_on = mag;
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  //módulos
  
  //timer
module timer(
  input wire[3:0] data,
  input wire loadn, clrn, clock, en,
  output wire [3:0] sec_ones, sec_tens, mins,
  output wire zero);
  
  wire en_st, en_min;
  wire zero_so, zero_st, zero_min;
  
  mod_10_bcd unit_sec(.data(data),
    .loadn(loadn),
    .clrn(clrn),
    .clk(clock),
    .en(en),
    .ones(sec_ones),
    .tc(en_st),
    .zero(zero_so));
  
  mod_6_bcd ten_sec(
    .data(sec_ones),
    .loadn(loadn),
    .clrn(clrn),
    .clk(clock),
    .en(en_st),
    .tens(sec_tens),
    .tc(en_min),
    .zero(zero_st));
  
  mod_10_bcd min(
    .data(sec_tens),
    .loadn(loadn),
    .clrn(clrn),
    .clk(clock),
    .en(en_min),
    .ones(mins),
    .zero(zero_min));
  
  assign zero = zero_so && zero_st && zero_min;
  
endmodule
  
module mod_6_bcd(
  input wire [3:0] data,
  input wire loadn, clrn, clk, en,
  output reg [3:0] tens,
  output wire tc, zero);
  
  
  assign tc = ((tens == 4'b0000) && (en == 1)) ? 1 : 0;
  assign zero = (tens == 4'b0000) ? 1 : 0;
  
  always@(posedge clk, negedge clrn)
    begin
      
      if(!clrn)
        begin
          tens <= 0;
        end
      else
        begin
          if(!en)
            begin
              if(!loadn)
                begin
                  tens <= data;
                end
            end
          else
            begin
              if(tens == 0)
                begin
                  tens <= 5;
                end
              else
                begin
                	tens <= tens - 1;
                end
            end
        end
    end
  
endmodule

module mod_10_bcd(
  input wire [3:0] data,
  input wire loadn, clrn, clk, en,
  output reg [3:0] ones,
  output wire tc, zero);

  assign tc = ((ones == 4'b0000) && (en == 1)) ? 1 : 0;
  assign zero = (ones == 4'b0000) ? 1 : 0;
  
  always@(posedge clk, negedge clrn)
    begin
      
      if(!clrn)
        begin
          ones <= 0;
        end
      else
        begin
          if(!en)
            begin
              if(!loadn)
                begin
                  ones <= data;
                end
            end
          else
            begin
              if(ones == 0)
                begin
                  ones <= 9;
                end
              else
                begin
                	ones <= ones - 1;
                end
            end
        end
    end
  
  
endmodule
  
  
  //encoder

module encoder(
    input [9:0] keypad,
    input clk, enablen,

    output wire [3:0] D,
    output wire pgt_1hz, loadn
);

    wire validn, div_clk, pgt;

    priority_encoder p_encoder (.keypad(keypad), .enablen(enablen), .digit(D), .validn(validn));

    freq_div div (.clock(clk), .div_clk(div_clk));

    counter_mod7 counter (.clk(clk), .clear(validn), .pgt(pgt));

    mux mux1 (.sel(enablen), .pgt(pgt), .clk(div_clk), .out(pgt_1hz));

    assign loadn = validn;

endmodule

module freq_div(
    input wire clock,
    output reg div_clk
);
  
  integer count = 0;
  
  always @(posedge clock)
    begin
      if(count != 100)
        begin
          div_clk = 0;
        end
      else
        begin
          count = 0;
          div_clk = 1;
        end
      
      count = count + 1;
    end
endmodule

module mux(
    input wire sel, pgt, clk,
    output reg out
);

    always @(sel, posedge pgt, clk) begin
        if (sel == 0) begin
            out <= pgt;
        end

        else begin
            out <= clk;
        end
    end
endmodule


module counter_mod7(
    input clk, clear,

    output reg pgt
);

    integer count = 0;

    always @(posedge clk) begin
        if (clear == 0) begin
            count <= 0;
        end

        else if (count < 7) begin
            count <= count + 1;
        end

        if (count < 4) begin
            pgt <= 0;
        end
        
        else begin
            pgt <= 1;
        end
    end
endmodule

module priority_encoder (
    input [9:0] keypad,
    input enablen,

    output reg [3:0] digit,
    output reg validn
);

    always @(keypad, enablen) begin
        // Está desligado, então não acontece nada
        if (enablen == 1) begin
            validn = 1;
        end

        else begin
            validn = 0;

            case (keypad)
                // 1
                10'b1000000000: digit = 4'b0001;

                // 2
                10'b0100000000: digit = 4'b0010;
                
                // 3
                10'b0010000000: digit = 4'b0011;
                
                // 4
                10'b0001000000: digit = 4'b0100;

                // 5
                10'b0000100000: digit = 4'b0101;

                // 6
                10'b0000010000: digit = 4'b0110;

                // 7
                10'b0000001000: digit = 4'b0111;

                // 8
                10'b1000000100: digit = 4'b1000;

                // 9
                10'b0000000010: digit = 4'b1001;

                // 0
                10'b0000000001: digit = 4'b0000;

                // Input inválido
                default: begin
                    validn = 1;
                end
            endcase
        end
    end
endmodule
  

//decoder
module decoder(input wire[3:0] sec_ones, sec_tens, min,
               output wire[6:0] sec_ones_segs, sec_tens_segs, min_segs);
  
  assign min_segs = (min == 4'b0000) ? 7'b000_0000 :
    				(min == 4'b0001) ? 7'b011_0000 : 
    				(min == 4'b0010) ? 7'b110_1101 : 
    				(min == 4'b0011) ? 7'b111_1001 : 
                    (min == 4'b0100) ? 7'b011_0011 : 
    				(min == 4'b0101) ? 7'b101_1011 : 
    				(min == 4'b0110) ? 7'b001_1111 : 
    				(min == 4'b0111) ? 7'b111_0000 :
    				(min == 4'b1000) ? 7'b111_1111 :
    				(min == 4'b1001) ? 7'b111_0011 :
    				7'b000_0000;
  
 
  assign sec_tens_segs =  ((min_segs == 7'b000_0000) && (sec_tens == 4'b0000)) ? 7'b000_0000:
    					  (sec_tens == 4'b0000) ? 7'b111_1110 :
                          (sec_tens == 4'b0001) ? 7'b011_0000 :
                          (sec_tens == 4'b0010) ? 7'b110_1101 :
                          (sec_tens == 4'b0011) ? 7'b111_1001 :
                          (sec_tens == 4'b0100) ? 7'b011_0011 : 
                          (sec_tens == 4'b0101) ? 7'b101_1011 : 
                          (sec_tens == 4'b0110) ? 7'b001_1111 : 
                          (sec_tens == 4'b0111) ? 7'b111_0000 : 
                          (sec_tens == 4'b1000) ? 7'b111_1111 : 
                          (sec_tens == 4'b1001) ? 7'b111_0011 : 
                          7'b000_0000;
 
  assign sec_ones_segs = ((min_segs == 7'b000_0000) && (sec_tens_segs == 7'b000_0000) && (sec_ones == 4'b0000)) ? 7'b000_0000:
     					 (sec_ones == 4'b0000) ? 7'b111_1110 :
                         (sec_ones == 4'b0001) ? 7'b011_0000 :
                         (sec_ones == 4'b0010) ? 7'b110_1101 :
                         (sec_ones == 4'b0011) ? 7'b111_1001 :
                         (sec_ones == 4'b0100) ? 7'b011_0011 :
                         (sec_ones == 4'b0101) ? 7'b101_1011 :
                         (sec_ones == 4'b0110) ? 7'b001_1111 :
                         (sec_ones == 4'b0111) ? 7'b111_0000 :
                         (sec_ones == 4'b1000) ? 7'b111_1111 :
                         (sec_ones == 4'b1001) ? 7'b111_0011 :
                         7'b000_0000;
  
endmodule
  
  
//mag-control
  
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
