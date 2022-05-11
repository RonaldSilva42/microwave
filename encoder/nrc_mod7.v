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

        pgt <= 0;

        if (count == 4) begin
            pgt <= 1;
        end
    end
endmodule