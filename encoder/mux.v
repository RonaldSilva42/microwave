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