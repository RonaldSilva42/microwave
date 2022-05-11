module counter_mod7(
    input clk, clear,

    output reg pgt
);

    integer count = 0;

    always @(negedge clear) begin
        if (count == 7) begin
            count = 0;
        end
    end

    always @(posedge clk) begin
        if (count < 7) begin
            count = count + 1;
        end

        if (count == 4) begin
            pgt = 1;
        end

        else begin
            pgt = 0;
        end
    end
endmodule