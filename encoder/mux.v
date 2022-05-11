module mux(
    input wire sel, pgt, clk,
    output reg out
);

    always @(*) begin
        if (sel == 0) begin
            out = clk;
        end

        else begin
            out = pgt;
        end
    end
endmodule