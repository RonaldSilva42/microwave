module counter_mod10 (
    input wire [3:0] data,
    input wire loadn, clrn, clk, en,
    output wire [3:0] ones,
    output wire tc, zero
);
    
    reg [3:0] current;
    assign ones = current;
    assign zero = (current == 0) ? 1 : 0;
    assign tc = ((current == 0) & en) ? 1 : 0;

    always @(posedge clk) begin 
        if (en) begin 
          if (current == 4'd0) begin
                current <= 4'd9;
            end
            else begin
                current <= current - 1;
            end
        end
        else begin
            if (!loadn) begin
                current <= data;
            end
        end
    end
    always @(negedge clrn) begin
        if(!clrn) begin
            current <= 4'd0;
        end
    end
endmodule